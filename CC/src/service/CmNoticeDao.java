package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
//import oracle.net.aso.b;

public class CmNoticeDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public CmNoticeDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int boardInsert(String NTitle, String NContents) {
		int value=0;
		
		String sql="insert into CM_NOTICE(NIDX,NTITLE,NCONTENTS,NWRITEDAY,NHIT) "
				+ "values(NIDX.nextval,?,?,sysdate,1)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NTitle);
			pstmt.setString(2, NContents);
			
			
			
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
	}



	public ArrayList<CmNoticeVo> boardSelectAll(int page, String keyword) {
		System.out.println("boardSelectAll page"+page);
		
		ArrayList<CmNoticeVo> alist = new ArrayList<CmNoticeVo>();
		
		/*
		 * String sql =
		 * "select * from board_api where delYn='N' order by originbidx desc, depth asc "
		 * ;
		 */
		ResultSet rs = null;
		String sql = "select B.* from ("
				+ "select rownum as rnum, A.* from("
				+ "select * from cm_NOTICE where Ntitle like ? order by Nwriteday)A "
				+ "where rownum <= ?)B   "
				+ "where B.NIDX >=?";
		
		try {
			pstmt = conn.prepareStatement(sql); // 
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, page*15);
			pstmt.setInt(3, 1+(page-1)*15);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("NIDX"));
				CmNoticeVo cnv = new CmNoticeVo();
				cnv.setNIdx(rs.getInt("NIdx"));
				cnv.setNTitle(rs.getString("NTitle"));
				cnv.setNContents(rs.getString("NContents"));
				cnv.setNWriteday(rs.getNString("NWriteday"));
				cnv.setNHit(rs.getNString("NHit"));
				alist.add(cnv);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			//	conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
		

		return alist;
	}

	public int boardTotalCount(String keyword) {
		 int cnt = 0;
		 ResultSet rs = null;
		 String sql = "select count(*) as cnt from CM_NOTICE where Ntitle like ?";
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	public CmNoticeVo boardSelectOne(int NIdx) {
		CmNoticeVo cnv = null;
		ResultSet rs = null;
		
		String sql="select * from Cm_NOTICE where NIDX=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NIdx);
			rs = pstmt.executeQuery();
			
			//���� ���� �����ϸ�
			if (rs.next()) {
				cnv = new CmNoticeVo();
				cnv.setNIdx(rs.getInt("NIdx"));
				cnv.setNTitle(rs.getString("NTitle"));
				cnv.setNContents(rs.getString("NContents"));
				cnv.setNWriteday(rs.getNString("NWriteday"));
				cnv.setNHit(rs.getString("NHit"));

			}	
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				//conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
		}	
		
		return cnv;
	}
	public int boardViewCount(int NIdx) {
		int value=0;
		
		String sql="update cm_NOTICE set Nhit = nvl(Nhit,0)+1 where NIDX=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NIdx);
			value= pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		
		return value;
	}
	public int boardModify(int NIdx, String NTitle, String NContents) {
		int value = 0;
		
		String sql="update CM_NOTICE set NTITLE=?, NContents=? where NIDX=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NTitle);
			pstmt.setString(2, NContents);
			pstmt.setInt(3, NIdx);
	
			value = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
	}
	public int boardDelete(int NIdx) {
		int value = 0;
		
		String sql = "DELETE FROM CM_NOTICE WHERE NIDX=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NIdx);
			value = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
		
	}
}
