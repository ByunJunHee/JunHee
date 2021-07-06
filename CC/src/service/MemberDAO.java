package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;

public class MemberDAO {

	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	public MemberDAO() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int memberInsert(String m_id,String m_pass,String m_name,String m_gender,String m_phone1,
			String m_phone2,String m_email,String m_addr1,String m_addr2,String m_addr3) {
		int value = 0;
		
		try {
			String sql = "insert into cc_member(m_num,m_id,m_pass,m_name,m_gender,m_phone1,"
					+ "m_phone2,m_email,m_addr1,m_addr2,m_addr3,m_delYn) "
					+ "values(m_num_seq.nextval,?,?,?,?,?,"
					+ "?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pass);
			pstmt.setString(3, m_name);
			pstmt.setString(4, m_gender);
			pstmt.setString(5, m_phone1);
			pstmt.setString(6, m_phone2);
			pstmt.setString(7, m_email);
			pstmt.setString(8, m_addr1);
			pstmt.setString(9, m_addr2);
			pstmt.setString(10, m_addr3);
			pstmt.setString(11, "N");
			pstmt.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return value;
	}
	
	public int memberLoginCheck(String m_id, String m_pass) {
		String sql = "select m_pass from cc_member where m_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(m_pass)) {
					return 1;
				}else {
					return 0;
				}
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

	public String findId(String m_name,String m_email) {
			String id = null;
		try{
			String sql = "select m_id from cc_member where m_name=?and m_email=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_name);
			pstmt.setString(2, m_email);
			
			ResultSet rs = pstmt.executeQuery();
					
			if(rs.next()) {
				id = rs.getString("m_id");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return id;
		
	}
	
	public String findPw(String m_id,String m_name,String m_email) {
		String pw = null;
		try {
			String sql = "select m_pass from cc_member where m_id=? and m_name=? and m_email=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_name);
			pstmt.setString(3, m_email);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("m_pass");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return pw;
	}
	
	public boolean checkId(String m_id) {
		boolean check = false;
		try {
			String sql = "select m_id from cc_member where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			check = rs.next();
		}catch(Exception e) {
			System.out.println("checkId() 호출 에러" + e);
		}
		return check;
	}
}
