package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
//import oracle.net.aso.b;

public class Cm_BoardDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public Cm_BoardDao() {
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

	
}
