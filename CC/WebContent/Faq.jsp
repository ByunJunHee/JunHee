<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>

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
	.cm{
		position:absolute; left:50px; top:200px;
	}
	.board{
		position:absolute; left:220px; top:150px;
	}
	.board2{
		position:absolute; left:220px; top:220px;
	}
	.button{
		position:relative;
		left:560px;
	}
	.pagingArea{
		width:30%;
		text-align:center;
		margin-left:35%;
	}
	.search{
		text-align:center;
	}
	table{
		border-collapse:collapse;
		border-right:hidden;
		border-left:hidden;
		text-align:center;
	}
	.c1{
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	.c2{
		border-bottom: hidden;
	}
	.c3{
		border-bottom: 2px solid black;
	}
	#d1{
		background-color:black;
		color:white;
	}
	.board3{
		border:1px solid black;
		width:600px;
		height:300px;
	}
	.board2 a{
		text-decoration:none;
	}
	.cm a{
		text-decoration:none;
	}
	#input{
		width:400px;
	}
</style>
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
	</header>
	<section>
		<div class="cm">
			<table border="1" >
				<tr class="c1">
					<th width="120px" height="30px">게시판</th>
				</tr>
				<tr class="c2">
					<td><a href="#">-자유 게시판</a></td>
				</tr>
				<tr class="c2">
					<td height="20px" ><a href="#">-출고인증</td>
				</tr>
				<tr>
					<td height="20px"><a href="#">-차량 갤러리</td>
				</tr>
				<tr class="c1">
					<th height="30px">고객센터</th>
				</tr>
				<tr class="c2">
					<td><a href="#">-Q&A</td>
				</tr>
				<tr>
					<td class="c3"><a href="#">-FAQ</td>
				</tr>
				<tr class="c1">
					<th height="30px">자유 게시판</th>
				</tr>
				<tr class="c2">
					<td><a href="#">-이벤트</td>
				</tr>
				<tr class="c3">
					<td><a href="#">-공지사항</td>
				</tr>
			</table>
		</div>
		<div class="board">
			FAQ
		</div>
		<div class="board2">
			<div class="search">
				<input type="text" id="input">
				<input type="submit" id="d1" value="검색">
			</div>
			<hr>
			<div class="board3" >
				<h3>자주 하는 질문 BEST</h3>
				<ol>
					<li><a href="#">예약/취소 수수료</li>
					<li><a href="#">대여 자격(나이, 면허) 기준</li>
					<li><a href="#">보험</li>
					<li><a href="#">대여요금/ 무료이용권</li>
					<li><a href="#">혜택</li>
				</ol>
			</div>
		</div>
	</section>
</body>
</html>