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
	
	public int boardInsert(String b_title, String b_contents) {
		int value=0;
		
		String sql="insert into Cm_Board(b_num,b_title,b_contents,b_writeday) "
				+ "values(b_num.nextval,?,?,sysdate)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_title);
			pstmt.setString(2, b_contents);
			
			
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
		String sql = "select * from ("
				+ "select rownum as bnum("
				+ "select * from cm_board where b_title like ? order by b_writeday)"
				+ "where rownum <= ?)   "
				+ "where bnum >=?";
		
		try {
			pstmt = conn.prepareStatement(sql); // ���� ���ڿ��� ��Ƽ� ����ȭ(����ȭ)��Ű�°�
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
				alist.add(cbv);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
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
		
}
