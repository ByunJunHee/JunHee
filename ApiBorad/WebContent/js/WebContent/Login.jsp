<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/Login.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<header>
		<div id="menu_top">
			<div id="mypage">
				<p>ooo님 | <a href="#">Logout | </a><a href="#"> Mypage</a></p>
			</div>
			<ul id="navi">
				<li><a href="#">Logoimage</a></li>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="#">렌트</a></li>
				<li><a href="#">커뮤니티</a></li>
			</ul>	
		</div>
	<div id="header">로그인</div>
	<div id="login">
		<form>
			<div>
				<input type="text" placeholder="아이디를 입력하세요." maxlength="14">
				<input type="password" placeholder="비밀번호를 입력하세요." maxlength="16">
			</div>
			<button id="submit">로그인</button>
			<br>
			<div id="find">
			<a href="Find_id.jsp">아이디 찾기</a> | <a href="Find_pwd.jsp">비밀번호 찾기</a> | <a href="Join.jsp">회원가입</a>
			</div>
		</form>
	</div>
</body>
</html>