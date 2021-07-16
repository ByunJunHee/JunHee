package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
//import oracle.net.aso.b;

public class CmCarGalleryDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public CmCarGalleryDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int boardInsert(String CgTitle, String CgContents) {
		int value=0;
		
		String sql="insert into Cm_CarGallery (CGIDX,CGTITLE,CGCONTENTS,CGWRITEDAY,CGHIT) "
				+ "values(CGIDX.nextval,?,?,sysdate,1)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, CgTitle);
			pstmt.setString(2, CgContents);
			
			
			
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
	}



	public ArrayList<CmCarGalleryVo> boardSelectAll(int page, String keyword) {
		System.out.println("boardSelectAll page"+page);
		
		ArrayList<CmCarGalleryVo> alist = new ArrayList<CmCarGalleryVo>();
		
		/*
		 * String sql =
		 * "select * from board_api where delYn='N' order by originbidx desc, depth asc "
		 * ;
		 */
		ResultSet rs = null;
		String sql = "select B.* from ("
				+ "select rownum as rnum, A.* from("
				+ "select * from Cm_CarGallery where cgtitle like ? order by cgwriteday)A "
				+ "where rownum <= ?)B   "
				+ "where B.cgidx >=?";
		
		try {
			pstmt = conn.prepareStatement(sql); // 
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, page*15);
			pstmt.setInt(3, 1+(page-1)*15);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("CgIdx"));
				CmCarGalleryVo cgv = new CmCarGalleryVo();
				cgv.setCgIdx(rs.getInt("CgIdx"));
				cgv.setCgTitle(rs.getString("CgTitle"));
				cgv.setCgContents(rs.getString("CgContents"));
				cgv.setCgWriteday(rs.getNString("CgWriteday"));
				cgv.setCgHit(rs.getNString("CgHit"));
				alist.add(cgv);
				
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
		 String sql = "select count(*) as cnt from Cm_CarGallery where cgtitle like ?";
		 
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

	public CmCarGalleryVo boardSelectOne(int CgIdx) {
		CmCarGalleryVo cgv = null;
		ResultSet rs = null;
		
		String sql="select * from Cm_CarGallery where CGIdx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, CgIdx);
			rs = pstmt.executeQuery();
			
			//���� ���� �����ϸ�
			if (rs.next()) {
				cgv = new CmCarGalleryVo();
				cgv.setCgIdx(rs.getInt("CgIdx"));
				cgv.setCgTitle(rs.getString("CgTitle"));
				cgv.setCgContents(rs.getString("CgContents"));
				cgv.setCgWriteday(rs.getNString("CgWriteday"));
				cgv.setCgHit(rs.getString("CgHit"));

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
		
		return cgv;
	}
	public int boardViewCount(int CgIdx) {
		int value=0;
		
		String sql="update Cm_CarGallery set cghit = nvl(cghit,0)+1 where cgidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, CgIdx);
			value= pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		
		return value;
	}
	public int boardModify(int CgIdx, String CgTitle, String CgContents) {
		int value = 0;
		
		String sql="update Cm_CarGallery set CGTITLE=?, CGContents=? where CGIdx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, CgTitle);
			pstmt.setString(2, CgContents);
			pstmt.setInt(3, CgIdx);
	
			value = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
	}
	public int boardDelete(int CgIdx) {
		int value = 0;
		
		String sql = "DELETE FROM Cm_CarGallery WHERE CGIDX=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, CgIdx);
			value = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
		
	}
}
