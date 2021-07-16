package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
//import oracle.net.aso.b;

public class CmQnADao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public CmQnADao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int boardInsert(String QTitle, String QContents) {
		int value=0;
		
		String sql="insert into Cm_QNA(QIDX,QTITLE,QCONTENTS,QWRITEDAY,QDEPTH) "
				+ "values(QIDX.nextval,?,?,sysdate,1)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, QTitle);
			pstmt.setString(2, QContents);
			
			
			
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
	}



	public ArrayList<CmQnAVo> boardSelectAll(int page, String keyword) {
		System.out.println("boardSelectAll page"+page);
		
		ArrayList<CmQnAVo> alist = new ArrayList<CmQnAVo>();
		
		/*
		 * String sql =
		 * "select * from board_api where delYn='N' order by originbidx desc, depth asc "
		 * ;
		 */
		ResultSet rs = null;
		String sql = "select B.* from ("
				+ "select rownum as rnum, A.* from("
				+ "select * from cm_QNA where Qtitle like ? order by Qwriteday)A "
				+ "where rownum <= ?)B   "
				+ "where B.QIDX >=?";
		
		try {
			pstmt = conn.prepareStatement(sql); // 
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, page*15);
			pstmt.setInt(3, 1+(page-1)*15);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("QIDX"));
				CmQnAVo cqv = new CmQnAVo();
				cqv.setQIdx(rs.getInt("QIdx"));
				cqv.setQTitle(rs.getString("QTitle"));
				cqv.setQContents(rs.getString("QContents"));
				cqv.setQWriteday(rs.getNString("QWriteday"));
				cqv.setQHit(rs.getNString("QHit"));
				alist.add(cqv);
				
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
		 String sql = "select count(*) as cnt from cm_qna where qtitle like ?";
		 
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

	public CmQnAVo boardSelectOne(int QIdx) {
		CmQnAVo cqv = null;
		ResultSet rs = null;
		
		String sql="select * from Cm_QNA where QIDX=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, QIdx);
			rs = pstmt.executeQuery();
			
			//���� ���� �����ϸ�
			if (rs.next()) {
				cqv = new CmQnAVo();
				cqv.setQIdx(rs.getInt("QIdx"));
				cqv.setQTitle(rs.getString("QTitle"));
				cqv.setQContents(rs.getString("QContents"));
				cqv.setQWriteday(rs.getNString("QWriteday"));
				cqv.setQHit(rs.getString("QHit"));

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
		
		return cqv;
	}
	public int boardViewCount(int QIdx) {
		int value=0;
		
		String sql="update cm_QNA set qhit = nvl(qhit,0)+1 where QIDX=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, QIdx);
			value= pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		
		return value;
	}
	public int boardModify(int QIdx, String QTitle, String QContents) {
		int value = 0;
		
		String sql="update CM_QNA set QTITLE=?, QContents=? where QNum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, QTitle);
			pstmt.setString(2, QContents);
			pstmt.setInt(3, QIdx);
	
			value = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
	}
	public int boardDelete(int QIdx) {
		int value = 0;
		
		String sql = "DELETE FROM CM_QNA WHERE QIDX=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, QIdx);
			value = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
		
	}
}
