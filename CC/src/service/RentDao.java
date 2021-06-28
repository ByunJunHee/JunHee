package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import dbconn.DBconn;

public class RentDao {

	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public RentDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public int RentInsert(String r_name, String r_phone, String r_addr, String r_interest , String r_division,int r_num) {
		int value=0;
		
		String sql="insert into Rent_Estimate(r_num,r_phone,r_addr,r_interest,r_diviseion) "
				+ "values(r_num.nextval,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_name);
			pstmt.setString(2, r_phone);
			pstmt.setString(3, r_addr);
			pstmt.setString(4, r_interest);
			pstmt.setString(5, r_division);

			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
	}

	
	
}
