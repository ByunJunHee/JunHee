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
   
   //����̹� ��ü ����
   Class.forName("oracle.jdbc.driver.OracleDriver");
   //����̹� ����
   conn = DriverManager.getConnection(url, id, password);
   out.println("���Ӽ���");
}catch(Exception e){
   e.printStackTrace();
   out.println("���ӽ���");
}
%>