<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_회원정보</title>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/Manager_member_detail.css">
</head>
<body>
	<!-- 상단메뉴 -->
	<header>
		<div id="menu_top">
			<div id="mypage">
				<p>관리자님 | <a href="#">Logout | </a><a href="<%=request.getContextPath()%>/Mypage/Mypage_main.do"> Mypage</a></p>
			</div>
			<ul id="navi">
				<li><a href="#">Logoimage</a></li>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="<%=request.getContextPath() %>/Rentpage_main.do">렌트</a></li>
				<li><a href="<%=request.getContextPath() %>/Board/CmBoard.do"">커뮤니티</a></li>
				<li><a href="#">관리자메뉴</a>
				
					<ul id="Secnavi">
						<li>메인관리</li>
						<li>회원관리</li>
						<li>렌트관리</li>
						<li>차량관리</li>
						<li>커뮤니티관리</li>
					</ul>
				</li>
			</ul>	
		</div><!-- id menu_top -->
	</header><!-- top_menu end -->
	<!-- 회원관리 -->
	<div id="wrap">	
		<!-- 회원정보 -->
		<div id=member_jb>
			<div>
				<h2>회원 정보</h2>
			</div>
			<div id="jb">
				<table border="1">
					<tr>
						<th width="30%">아이디</th>
						<td width="70%">?</td>
					</tr>
					<tr>
						<th width="30%">이름</th>
						<td width="70%">?</td>
					</tr>
					<tr>
						<th width="30%">성별</th>
						<td width="70%">?</td>
					</tr>
					<tr>
						<th width="30%">휴대전화</th>
						<td width="70%">?</td>
					</tr>
					<tr>
						<th width="30%">이메일</th>
						<td width="70%">?</td>
					</tr>
					<tr>
						<th width="30%">가입일</th>
						<td width="70%">?</td>
					</tr>
				</table>
			</div>
			<!-- 이용내역 -->
			  <form>
				<div id="dldyd">
				<div>
					<h2>이용내역</h2>
				</div>
					<table border="1" width="80%">
						<tr>
							<th width="10%">No</th>
							<th width="30%">날짜</th>
							<th width="30%">상품명</th>
							<th width="30%">기간</th>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div><!-- dldyd end -->
			</form>
			
		</div><!-- member_jb end -->
		<div id="button">
			<button type="button" width="200px">게시판 이용정지</button>
			<button type="button" width="150px">뒤로가기</button>
		</div>
	</div><!-- wrap -->
</body>
</html>