<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.MemberDAO1"%>
<%@ page import = "java.sql.*" %>    
<%@ page import = "java.net.*" %>  
<%@ page import = "dbconn.DBconn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
회원가입 처리페이지
<%
	request.setCharacterEncoding("UTF-8");
	String m_id = null;
	if(session.getAttribute("m_id") != null){
		m_id = (String)session.getAttribute("m_id");
}

	//String m_id = request.getParameter("m_id");
	//String m_pass = request.getParameter("m_pass");
	//String m_name = request.getParameter("m_name");
	//String m_gender = request.getParameter("m_gender");
	//String m_phone1 = request.getParameter("m_phone1");
	//String m_phone2 = request.getParameter("m_phone2");
	//String m_email = request.getParameter("m_email");
	//String m_addr1 = request.getParameter("m_addr1");
	//String m_addr2 = request.getParameter("m_addr2");
	//String m_addr3 = request.getParameter("m_addr3");
	
	//out.println(m_id+"<br>");
	//out.println(m_pass+"<br>");
	//out.println(m_name+"<br>");
	//out.println(m_gender+"<br>");
	//out.println(m_phone1+"<br>");
	//out.println(m_phone2+"<br>");
	//out.println(m_email+"<br>");
	//out.println(m_addr1+"<br>");
	//out.println(m_addr2+"<br>");
	//out.println(m_addr3+"<br>");
	
	//DBconn dbconn = new DBconn();
	//Connection conn = dbconn.getConnection();
	
	//MemberDAO md = new MemberDAO();
	//md.memberInsert(m_id, m_pass, m_name, m_gender, m_phone1, m_phone2, m_email, m_addr1, m_addr2, m_addr3);
	
	//out.println("<script>alert('데이터가 입력되었습니다.');document.location.href='"+request.getContextPath()+"/memberjoin.jsp';<script>");
%>
<script>
	location.href='memberLogin.jsp'
</script>
</body>
</html>