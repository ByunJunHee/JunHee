<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_회원리스트</title>

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
	#menu_top ul li{
		float:left;
		width:16%;
		height:50px;
		line-height:120px;
		align:center;
		font-size:18px;
	}
	#Secnavi{width:100%}
	#Secnavi li{
		float:unset !important;
		display: inline-block !important; 
        width: 100% !important;

	}
	#top_menu p{
		color:#ffffff;
		font-size:16px;
		margin-left:10px;
	}
	#mypage p{
		font-size:13px;
		 position: absolute;
 		 top: 5px; right: 20px;;
	}
	table{
		margin:0px auto;
	}
	#search{
		float:right;
		margin-right:50px;
	}
</style>
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