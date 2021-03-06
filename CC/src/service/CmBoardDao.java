package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
//import oracle.net.aso.b;

public class CmBoardDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public CmBoardDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int boardInsert(String bTitle, String bContents ) {
		int value=0;
		
		String sql="insert into Cm_Board(bnum,btitle,bcontents,bWriteday,BHIT) "
				+ "values(bnum.nextval,?,?,sysdate,1)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContents);
			
			
			
			
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
		
	}



	public ArrayList<CmBoardVo> boardSelectAll(int page, String keyword) {
		System.out.println("boardSelectAll page"+page);
		
		ArrayList<CmBoardVo> alist = new ArrayList<CmBoardVo>();
		
		/*
		 * String sql =
		 * "select * from board_api where delYn='N' order by originbidx desc, depth asc "
		 * ;
		 */
		ResultSet rs = null;
		String sql = "select B.* from ("
				+ "select rownum as rnum, A.* from("
				+ "select * from cm_board where btitle like ? order by bwriteday)A "
				+ "where rownum <= ?)B   "
				+ "where B.bnum >=?";
		
		try {
			pstmt = conn.prepareStatement(sql); // 
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, page*15);
			pstmt.setInt(3, 1+(page-1)*15);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("bNum"));
				CmBoardVo cbv = new CmBoardVo();
				cbv.setbNum(rs.getInt("bNum"));
				cbv.setbTitle(rs.getString("bTitle"));
				cbv.setbContents(rs.getString("bContents"));
				cbv.setbWriteday(rs.getNString("bWriteday"));
				cbv.setbHit(rs.getNString("bHit"));
				alist.add(cbv);
				
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
		 String sql = "select count(*) as cnt from cm_board where btitle like ?";
		 
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

	public CmBoardVo boardSelectOne(int bNum) {
		CmBoardVo cbv = null;
		ResultSet rs = null;
		
		String sql="select * from Cm_board where bNum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			rs = pstmt.executeQuery();
			
			//???????????? ???????????? ????????????????????
			if (rs.next()) {
				cbv = new CmBoardVo();
				cbv.setbNum(rs.getInt("bNum"));
				cbv.setbTitle(rs.getString("bTitle"));
				cbv.setbContents(rs.getString("bContents"));
				cbv.setbWriteday(rs.getNString("bWriteday"));
				cbv.setbHit(rs.getString("bHit"));

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
		
		return cbv;
	}
	public int boardViewCount(int bNum) {
		int value=0;
		
		String sql="update cm_board set bhit = nvl(bhit,0)+1 where bnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			value= pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		
		return value;
	}
	public int boardModify(int bNum, String bTitle, String bContents) {
		int value = 0;
		
		String sql="update CM_BOARD set BTITLE=?, bContents=? where bNum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContents);
			pstmt.setInt(3, bNum);
	
			value = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
	}
	public int boardDelete(int bNum) {
		int value = 0;
		
		String sql = "DELETE FROM CM_BOARD WHERE BNUM=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			value = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
		
	}
}
