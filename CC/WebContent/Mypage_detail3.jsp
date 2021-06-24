<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글 관리</title>
</head>
 <link rel="stylesheet" href="./resource/Mypage_detail3css.css">
<body>
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
	<div id="wrap">
		 <h2>내가 쓴 글 관리</h2>
		<div id="menu_sub">
		      <ul id="navi2">
		         <li class="group2">
		            <div class="title">나의 부가 정보</div>
		            <ul class="sub2">
		               <li><a href="#">-나의 견적내역</a></li>
		               <li><a href="#">-나의 찜 차량</a></li>
		               <li><a href="#">-내가 쓴 글 관리</a></li>
		            </ul>
		         </li>
		         <li class="group2">
		            <div class="title">회원</div>
		            <ul class="sub2">
		               <li><a href="#">-회원정보 수정</a></li>
		               <li><a href="#">-회원탈퇴</a></li>
		            </ul>
		         </li>
		      </ul>
		</div>
		<div id="page_main">
			<form name="frm" action="#" method="post">
				<table>
					<thead>
						<th width="10%">번호</th>
						<th width="10%">분류</th>
						<th width="50%">제목</th>
						<th width="20%">작성일</th>
						<th width="10%">조회수</th>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>