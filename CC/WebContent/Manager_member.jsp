<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_회원리스트</title>

 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/Manager_membercss.css">
</head>
<body>
	<!-- 상단메뉴 -->
	<header>
		<div id="menu_top">
			<div id="mypage">
				<p>관리자님 | <a href="#">Logout | </a><a href="#"> Mypage</a></p>
			</div>
			<ul id="navi">
				<li><a href="#">Logoimage</a></li>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="#">렌트</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">관리자메뉴</a>
				
					<ul id="Secnavi">
						<li><a href="#">메인관리</a></li>
						<li><a href="<%=request.getContextPath()%>/Manager/Manager_member.do">회원관리</a></li>
						<li><a href="<%=request.getContextPath()%>/Manager/Manager_Rentpage_main.do">렌트관리</a></li>
						<li><a href="<%=request.getContextPath()%>/Manager/Manager_cardb.do">차량관리</a></li>
						<li><a href="#">커뮤니티관리</a></li>
					</ul>
				</li>
			</ul>	
		</div><!-- id menu_top -->
	</header><!-- top_menu end -->
	<!-- 회원관리 -->
	<div id="wrap">
		<div id=mem_management>
			<div>
				<h2>회원 관리</h2>
			</div>
			<div id="search">
				이름: <input type="text"> ID: <input type="text">
				<button type="submit">검색</button>
			</div>
			  <form>
				<div>
					<table border="1" width="70%">
						<tr>
							<th width="10%">No</th>
							<th width="30%">이름</th>
							<th width="30%">아이디</th>
							<th width="30%">핸드폰</th>
						</tr>
						
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>