<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resource/header.css" rel="stylesheet" type="text/css">
<link href="resource/find.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resource/header.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resource/find.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script>
	function findPw(){
		var fm = document.frm;
		
		if(fm.m_id.value.length<1){
			alert('아이디를 올바르게 입력해주세요');
			return;
		}
		if(fm.m_name.value.length<1){
			alert("이름을 입력해주세요");
			return;
		}
		if(fm.m_email.value.length<1){
			alert("이메일을 입력해주세요");
			return;
		}
		
		fm.method="post";
		fm.action="findPwOk.jsp"
		fm.submit();
	}
</script>
</head>
<body>
	<%
		String m_id = null;
		if(session.getAttribute("m_id") != null){
			m_id = (String) session.getAttribute("m_id");
		}
	%>
<header>
		<div id="menu_top">
			<div id="mypage">
				<p>
				<% if (m_id == null){%>
					<a href="<%=request.getContextPath()%>/memberJoin.do">회원가입</a>
					<a href="<%=request.getContextPath()%>/memberLogin.do">로그인</a>
				<%
					}else{
				%>
					<%= m_id %>님
					<a href="<%=request.getContextPath()%>/memberLogout.do">로그아웃</a>
					<a href="<%=request.getContextPath()%>Mypage/Mypage_main.do">마이페이지</a>
				<%
					}
				%>
				</p>
			</div>
			<ul id="navi">
				<li><a href="/main.do">Logoimage</a></li>
				<li><a href="/introduce.do">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="/Rent/Rentpage_main.do">렌트</a></li>
				<li><a href="Mypage/Mypage_main.do">커뮤니티</a></li>
			</ul>	
		</div>
	</header>
	<div id="header">비밀번호 찾기</div>
	<div id="find">
		<form name="frm">
			<div>
				<input type="text" name="m_id" placeholder="아이디를 입력하세요.">
				<input type="text" name="m_name" placeholder="이름을 입력하세요.">
				<input type="text" name="m_email" placeholder="이메일을 입력하세요.">
				<input type="button" value="비밀번호 찾기" onclick="findPw()"/>
			</div>
		</form>
	</div>
</body>
</html>