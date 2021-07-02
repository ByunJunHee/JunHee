<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<%
Connection conn = null;
try{
   //String url ="jdbc:oracle:thin:@192.168.0.8:1521:xe";
   String url ="jdbc:oracle:thin:@localhost:1521:xe";
   String id = "system";
   String password = "1234";
   
   //드라이버 객체 생성
   Class.forName("oracle.jdbc.driver.OracleDriver");
   //드라이버 연결
   conn = DriverManager.getConnection(url, id, password);
   out.println("접속성공");
}catch(Exception e){
   e.printStackTrace();
   out.println("접속실패");
}
%>