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
	
	public int RentInsert(String r_name, String r_phone, String r_addr, String r_interest , String r_division) {
		int value=0;
		
		String sql="insert into Rent_Estimate(r_num,r_phone,r_addr,r_interest,r_division) "
				+ "values(r_num.nextval,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, r_name);
			pstmt.setString(1, r_phone);
			pstmt.setString(2, r_addr);
			pstmt.setString(3, r_interest);
			pstmt.setString(4, r_division);

			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return value;
	}
	
	public int RentResisterInsert(String kr_name,String kr_spec, String kr_price,String kr_discount,String kr_dtoption,String kr_dbenefit) {
		int value=0;
		
		String sql = "insert into Rent_Register(kr_num,kr_name,kr_spec,kr_price,kr_discount,kr_dtoption,kr_dbenefit)"
				+ "values(kr_num.nextval,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kr_name);
			pstmt.setString(2, kr_spec);
			pstmt.setString(3, kr_price);
			pstmt.setString(4, kr_discount);
			pstmt.setString(5, kr_dtoption);
			pstmt.setString(6, kr_dbenefit);
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

	
	
}
