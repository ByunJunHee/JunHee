package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
//import oracle.net.aso.b;

public class BoardDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public BoardDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int boardInsert(String b_title, String b_contents, String b_writer) {
		int value=0;
		
		String sql="insert into board_api(b_num,b_title,b_contents,b_writer) "
				+ "values(b_num.nextval,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_title);
			pstmt.setString(2, b_contents);
			pstmt.setString(3, b_writer);
			
			
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
	}
	public ArrayList<BoardVo> boardSelectAll(int page, String keyword){
		System.out.println("boardSelectAll page"+page);
		
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		
		/*
		 * String sql =
		 * "select * from board_api where delYn='N' order by originbidx desc, depth asc "
		 * ;
		 */
		ResultSet rs = null;
		String sql = "select B.* from ("
				+ "select rownum as rnum, A.* from("
				+ "select * from board_api where delYn='N' and subject like ? order by originbidx desc, depth asc)A "
				+ "where rownum <= ?) B  "
				+ "where B.rnum >=?";
		
		try {
			pstmt = conn.prepareStatement(sql); // ���� ���ڿ��� ��Ƽ� ����ȭ(����ȭ)��Ű�°�
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, page*15);
			pstmt.setInt(3, 1+(page-1)*15);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("rnum"));
				System.out.println(rs.getInt("bidx"));
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContents(rs.getString("Contents"));
				bv.setWriter(rs.getString("Writer"));
				bv.setWritedayY(rs.getNString("Writeday"));
				bv.setLlevel(rs.getInt("llevel"));
				alist.add(bv);
				
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
	public BoardVo boardSelectOne(int bidx){
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql="select * from board_api where bidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			//���� ���� �����ϸ�
			if (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContents(rs.getString("contents"));
				bv.setWriter(rs.getString("writer"));
				bv.setViewcount(rs.getInt("viewcount"));
				bv.setOriginbidx(rs.getInt("originbidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLlevel(rs.getInt("llevel"));
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
		
		return bv;
	}
	public int boardViewCount(int bidx) {
		int value=0;
		
		String sql="update board_api set viewcount = viewcount+1 where bidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			value= pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		
		return value;
	}
	public int boardModify(int bidx, String password, String subject, String contents, String writer) {
		int value = 0;
		
		String sql="update board_api set subject=?, contents=?, writer=? where bidx=? and password=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setString(3, writer);
			pstmt.setInt(4, bidx);
			pstmt.setString(5, password);
			value = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
	}
	
	public int boardDelete(int bidx, String password) {
		int value = 0;
		
		String sql = "update board_api set delYn='Y' where bidx=? and password=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			pstmt.setString(2, password);
			value = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return value;
		
	}
	
	public int boardReply(int bidx, int originbidx, int depth, int llevel, String subject, String contents, String writer, String password, String ip, int midx) {
		int value = 0;
		
		String sql = "update board_api set depth=depth+1 where originbidx=? and depth>?";
		String sql2="insert into board_api(bidx,originbidx,depth,llevel,"
				+ "subject,contents,writer,password,ip,midx)"
				+ "values(bidx_seq.nextval,?,?,?,?,?,?,?,?,?)";
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, originbidx);
			pstmt.setInt(2, depth);
			value = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, originbidx);
			pstmt.setInt(2, depth+1);
			pstmt.setInt(3, llevel+1);
			pstmt.setString(4, subject);
			pstmt.setString(5, contents);
			pstmt.setString(6, writer);
			pstmt.setString(7, password);
			pstmt.setString(8, ip);
			pstmt.setInt(9, midx);
			value = pstmt.executeUpdate();
			
			conn.commit();

		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return value;
	}
	
	public int boardTotalCount(String keyword) {
		 int cnt = 0;
		 ResultSet rs = null;
		 String sql = "select count(*) as cnt from board_api where delYn='N' and subject like ?";
		 
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
