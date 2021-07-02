<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
	#title{
		text-align:center;
	}
	.content{
		margin:5%;
	}
	#img{
		width:100%;
		height:500px;
	}
	#img2{
		float:right;
		width:50%;
	}
	#content2{
		text-align:center;
	}
	#intro{
		margin-top:15%;
	}
</style>
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
	</header>
<img id="img" src="image/3.jpg">
<div class="content">
<h3 id="title">인사말</h3>
<center>인사말
인사말인사말인사말인사말인사말인사말인사말인사말인사말인<br>
사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사<br>
말인사말인사말인사말인사말인사말인사말인사말인사말인<br>
사말인사말인사말인사말인사말인사말인사말인사말인사말<br>
인사말인사말인사말인사말인사말인사말인사말.
</center>
</div>
<img id="img2" src="image/5.jpg">
<div class="content">
<center id="intro">
소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개<br>
소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개<br>
소개소개소개소개소개소개소개소개소개소개소개소개소개소<br>
개소개소개소개소개소개소개소개소개소개소개소개<br>
소개소개.
</center>
</div>

</body>
</html>