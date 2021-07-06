<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "service.MemberDAO"%>
<!DOCTYPE html>
<%
	String m_id = request.getParameter("m_id");
	System.out.println("idCheck.jsp의 m_id=>" + m_id);
	
	MemberDAO md = new MemberDAO();
	boolean check = md.checkId(m_id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b><%=m_id %></b>
<%
	if(check){
		out.println("는 이미 존재하는 아이디입니다.<p>");
	}else{
		out.println("는 사용가능한 아이디입니다.<p>");
	}
%>
<a href="#" onclick="self.close()">닫기</a>
</body>
</html>