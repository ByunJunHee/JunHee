<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "service.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String m_id = request.getParameter("m_id");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	MemberDAO md = new MemberDAO();
	String m_pass = md.findPw(m_id,m_name, m_email);
%>
<link href="resource/header.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resource/header.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<script>
	function login(){
		location.href="memberLogin.jsp";
	}
	function join(){
		location.href="memberJoin.jsp";
	}
</script>
<style>
	.container{
		min-width:500px;
		height:200px;
		margin-left:25%;
		margin-right:25%;
		margin-top:10%;
		padding:auto;
		border:1px solid gray;
		text-align:center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
		<div id="menu_top">
			<div id="mypage">
				<p>
					<a href="<%=request.getContextPath()%>/memberJoin.do">회원가입</a>
					<a href="<%=request.getContextPath()%>/memberLogin.do">로그인</a>
				</p>
			</div>
			<ul id="navi">
				<li><a href="/main.do">Logoimage</a></li>
				<li><a href="/introduce.do">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="/Rent/Rentpage_main.do">렌트</a></li>
				<li><a href="/Board/Cmboard.do">커뮤니티</a></li>
			</ul>	
		</div>
	</header>
	<form name="findpw" method="post">
	<%
		if(m_pass != null){
	%>
	<div class = "container">
		<div class="find-success">
			<h4> 회원님의 비밀번호는 </h4>
			<div class="find-id"><%=m_pass %></div>			
			<h4> 입니다 </h4>
		</div>
		<div class="find-login">
			<input type="button" id="btnLogin" value="로그인" onclick='login()'/>
		</div>
	</div>
	<%}else{ %>
		<div class="container">
			<div class="find-fail">
				<h4>등록된 정보가 없습니다</h4>
			</div>
			<div class="find-login">
				<input type="button" id="btnback" value="다시찾기" onclick="history.back()">
				<input type="button" id="btnjoin" value="회원가입" onclick="join()"/>
			</div>
		</div>	
	<% } %>
	</form>
</body>
</html>