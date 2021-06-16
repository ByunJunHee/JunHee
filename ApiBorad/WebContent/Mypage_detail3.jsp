<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글 관리</title>
</head>
<style>
	@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	body{
	font-family: 'InfinitySans-RegularA1';
	}
	#wrap{
	width:1300px;
		height:94vh;
		min-height:1000px;
		max-height:1000px;
		background-color:white;

		margin:2.5vh auto;
		}
	#menu_top{
		background: #000000;
		width:100%;
		height:100px;
		opacity:0.5;
	}
	#menu_top:hover{
		opacity:1;
		
	}
	#menu_ul{
		width:500px;
		margin: 0 auto;
		overflow:hidden ;
	}
	#menu_top li{
		list-style:none;
	}
	#menu_top a{
	text-decoration: none;
		color:#FFFFFF
	}
	#menu_top ul li a:hover{
		background:#000000;
		color:yellow;
		
	}
	#menu_top ul  li{
		float:left;
		width:20%;
		height:100%;
		line-height:120px;
		align:center;
		font-size:18px;
	}
    #navi2 {
        width: 200px;
        text-indent: 10px;
	}
    #navi2, #navi2 ul {
        margin:0;
        padding:0;
        list-style:none;
	}
    .group2 {
        margin-bottom: 3px;
	}
    .group2 .title {
        height: 35px;
        line-height: 35px;
        background:#6B6E6F;
        cursor:pointer;
	}
    ul.sub2 li {
        margin-bottom:5px;
        height:35px;
        line-height:35px;
        background:#f4f4f4;
        cursor:pointer;
	}
    .sub2 li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
	}
	#menu_sub{
		float:left;
		margin-left:10px;
		
	}
	p{
		color:#ffffff;
		font-size:16px;
		margin-left:10px;
	}
	#mypage p{
		font-size:13px;
		 position: absolute;
 		 top: 5px; right: 20px;;
	}
	#page_main{
		width:600px;
		height:400px;

		margin-left:250px;
	}
	h2{
		margin-left:250px;
		margin-top:70px;
	}
	#page_main p{
		color:black;
	}
</style>
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