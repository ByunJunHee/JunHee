<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.net.*" %>
<%@ page import = "dbconn.DBconn" %>
<%@ page import = "service.MemberDao" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원가입 처리 페이지

<%
/* request.setCharacterEncoding("UTF-8");

//1.넘겨받는다.
String memberId =request.getParameter("memberId");
String memberPwd =request.getParameter("memberPwd");
String memberName =request.getParameter("memberName");
String memberEmail =request.getParameter("memberEmail");
String memberJumin =request.getParameter("memberJumin");
String memberPhone =request.getParameter("memberPhone");
String memberAddr =request.getParameter("memberAddr");
String memberGender =request.getParameter("memberGender");

//2. 접속이되는지 확인.
out.println(memberId+"<br>");
out.println(memberPwd+"<br>");
out.println(memberName+"<br>");
out.println(memberEmail+"<br>");
out.println(memberJumin+"<br>");
out.println(memberPhone+"<br>");
out.println(memberAddr+"<br>");
out.println(memberGender+"<br>"); */

	//DBconn dbConn = new DBconn();
	//Connection conn = dbConn.getConnection();
	

			
	//out.println("<script>alert('데이터가 입력되었습니다.');document.location.href='"+request.getContextPath()+"/memberWrite.jsp';</script>");
	//response.sendRedirect(request.getContextPath()+"/memberWrite.jsp");






%>
</body>
</html>