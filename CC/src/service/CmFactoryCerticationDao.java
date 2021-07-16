package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
//import oracle.net.aso.b;

public class CmFactoryCerticationDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public CmFactoryCerticationDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int boardInsert(String FcTitle, String FcContents) {
		int value=0;
		
		String sql="insert into Cm_FactoryCertication (FCIDX,FCTITLE,FCCONTENTS,FCWRITEDAY,FCHIT) "
				+ "values(FCIDX.nextval,?,?,sysdate,1)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, FcTitle);
			pstmt.setString(2, FcContents);
			
			
			
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
	}



	public ArrayList<CmFactoryCerticationVo> boardSelectAll(int page, String keyword) {
		System.out.println("boardSelectAll page"+page);
		
		ArrayList<CmFactoryCerticationVo> alist = new ArrayList<CmFactoryCerticationVo>();
		
		/*
		 * String sql =
		 * "select * from board_api where delYn='N' order by originbidx desc, depth asc "
		 * ;
		 */
		ResultSet rs = null;
		String sql = "select B.* from ("
				+ "select rownum as rnum, A.* from("
				+ "select * from Cm_FactoryCertication where fctitle like ? order by fcwriteday)A "
				+ "where rownum <= ?)B   "
				+ "where B.fcidx >=?";
		
		try {
			pstmt = conn.prepareStatement(sql); // 
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, page*15);
			pstmt.setInt(3, 1+(page-1)*15);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("FcIdx"));
				CmFactoryCerticationVo cfv = new CmFactoryCerticationVo();
				cfv.setFcIdx(rs.getInt("FcIdx"));
				cfv.setFcTitle(rs.getString("FcTitle"));
				cfv.setFcContents(rs.getString("FcContents"));
				cfv.setFcWriteday(rs.getNString("FcWriteday"));
				cfv.setFcHit(rs.getNString("FcHit"));
				alist.add(cfv);
				
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
		 String sql = "select count(*) as cnt from Cm_FactoryCertication where fctitle like ?";
		 
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

	public CmFactoryCerticationVo boardSelectOne(int FcIdx) {
		CmFactoryCerticationVo cfv = null;
		ResultSet rs = null;
		
		String sql="select * from Cm_FactoryCertication where FcIdx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, FcIdx);
			rs = pstmt.executeQuery();
			
			//���� ���� �����ϸ�
			if (rs.next()) {
				cfv = new CmFactoryCerticationVo();
				cfv.setFcIdx(rs.getInt("FcIdx"));
				cfv.setFcTitle(rs.getString("FcTitle"));
				cfv.setFcContents(rs.getString("FcContents"));
				cfv.setFcWriteday(rs.getNString("FcWriteday"));
				cfv.setFcHit(rs.getString("FcHit"));

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
		
		return cfv;
	}
	public int boardViewCount(int FcIdx) {
		int value=0;
		
		String sql="update Cm_FactoryCertication set fchit = nvl(fchit,0)+1 where fcidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, FcIdx);
			value= pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		
		return value;
	}
	public int boardModify(int FcIdx, String FcTitle, String FcContents) {
		int value = 0;
		
		String sql="update Cm_FactoryCertication set FcTITLE=?, FcContents=? where FcIdx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, FcTitle);
			pstmt.setString(2, FcContents);
			pstmt.setInt(3, FcIdx);
	
			value = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
	}
	public int boardDelete(int FcIdx) {
		int value = 0;
		
		String sql = "DELETE FROM Cm_FactoryCertication WHERE FCIDX=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, FcIdx);
			value = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
		
	}
}
