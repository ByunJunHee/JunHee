<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 찜 차량</title>
</head>
 <link href="<%=request.getContextPath()%>/resource/Mypage_detail2css.css" rel="stylesheet" type="text/css">
<body>
<div id="menu_top">
		<div id="mypage">
			<p>ooo님 | <a href="#">Logout | </a><a href="<%=request.getContextPath()%>/Mypage/Mypage_main.do"> Mypage</a></p>
		</div>
		<ul id="navi">
			<li><a href="#">Logoimage</a></li>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">차량비교</a></li>
			<li><a href="<%=request.getContextPath() %>/Rentpage_main.do">렌트</a></li>
			<li><a href="#">커뮤니티</a></li>
		</ul>	
	</div>
	<div id="wrap">
		 <h2>나의 찜 차량</h2>
		<div id="menu_sub">
		      <ul id="navi2">
		         <li class="group2">
		            <div class="title">나의 부가 정보</div>
		            <ul class="sub2">
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail1.do">-나의 견적내역</a></li>
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail2.do">-나의 찜 차량</a></li>
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail3.do">-내가 쓴 글 관리</a></li>
		            </ul>
		         </li>
		         <li class="group2">
		            <div class="title">회원</div>
		            <ul class="sub2">
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail4.do">-회원정보 수정</a></li>
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail5.do">-회원탈퇴</a></li>
		            </ul>
		         </li>
		      </ul>
		</div>
		<div id="page_main">
			<div align="center">
				<p>찜목록</p>
				<div>찜 목록이 없습니다.</div>
			</div>
		</div>
	</div>
</body>
</html>