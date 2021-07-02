<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "service.MemberDAO1" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="cc_member" class="service.MemberVO1" scope="page"/>
<jsp:setProperty name ="cc_member" property="m_id" />
<jsp:setProperty name ="cc_member" property="m_pass" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String m_id = null;
	if(session.getAttribute("m_id") != null){
		m_id = (String)session.getAttribute("m_id");
	}
	if(m_id != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	MemberDAO1 memberDAO = new MemberDAO1();
	int result = memberDAO.memberLoginCheck(cc_member.getM_id(),cc_member.getM_pass());
	if(result == 1){
		session.setAttribute("m_id", cc_member.getM_id());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('database에 오류가 발생하였습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>