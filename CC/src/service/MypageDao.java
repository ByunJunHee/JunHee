package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dbconn.DBconn;

public class MypageDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public MypageDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public String MypageSelectBoard(String inpt_Id) {

		
		String value = null;
		System.out.print("오지수아이디 : "+ inpt_Id);
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM RENT_ESTIMATE WHERE INPT_ID LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, value);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				value = rs.getString("CNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return value;
		
		
	}
	
	
	
}
