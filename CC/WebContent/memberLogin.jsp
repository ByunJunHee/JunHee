<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/Login.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script>
	function check(){
		
		if(document.frm.m_id.value ==""){
			alert("아이디를 입력하세요.");
			document.frm.m_id.focus();
			return;
		}else if(document.frm.m_pass.value ==""){
			alert("비밀번호를 입력하세요.");
			document.frm.m_pass.focus();
			return;
		}
		
			document.frm.action ="<%=request.getContextPath()%>/memberLoginOk.do";
			document.frm.method = "post";
			document.frm.submit();
			
		return;
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
					<a href="<%=request.getContextPath()%>#">마이페이지</a>
				<%
					}
				%>
				</p>
			</div>
			<ul id="navi">
				<li><a href="main.do">Logoimage</a></li>
				<li><a href="introduce.do">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="#">렌트</a></li>
				<li><a href="#">커뮤니티</a></li>
			</ul>	
		</div>
	<div id="header">로그인</div>
	<div id="login">
		<form name="frm">
			<div>
				<input type="text" placeholder="아이디를 입력하세요." maxlength="14" name="m_id">
				<input type="password" placeholder="비밀번호를 입력하세요." maxlength="16" name="m_pass">
			</div>
			<input type="submit" id="submit" value="로그인" onclick="check();">
			<br>
			<div id="find">
			<a href="findId.do">아이디 찾기</a> | <a href="findPw.do">비밀번호 찾기</a> | <a href="memberJoin.do">회원가입</a>
			</div>
		</form>
	</div>
</body>
</html>