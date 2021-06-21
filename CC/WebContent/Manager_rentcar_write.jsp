<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 렌트등록</title>

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
	#main_image{
		width:100%;
		height:400px;
		border:1px solid black;
	}
	#top6{
		margin:0px auto;
		width:300px;
		height:50px;
		background:yellow;
		margin-top:50px;
		padding-top:30px;
		font-size:20px;
		
	}
	.besttop6{
		width:1200px;
		margin:0 auto;
	
	}
	.besttop6 li{
		list-style:none;
		position: relative;
		line-height: 1;
		width: 500px;
		height: 300px;
		margin-right: 8px;
		float: left;
		margin:30px 70px 70px 0;
		border:1px solid black;
	}
	.besttop6 p{
		color:black;
	}
	button{
		float:right;
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
	<div id="wrap">
	<div id="rent">
		<div>
			<h2>렌트등록</h2>
		</div>
		<div id="renttable">
			<table border="1" width="60%">
				<tr>
					<th width="20%">차량명</th>
					<td width="30%"><input type="text"></td>
					<th width="20%">사양</th>
					<td width="30%"><input type="text"></td>
				</tr>
				<tr>
					<th width="20%">가격</th>
					<td width="30%"><input type="text"></td>
					<th width="20%">할인가격</th>
					<td width="30%"><input type="text"></td>
				</tr>
				<tr>
					<th>상세옵션</th>
					<td  colspan="4" >
						<textarea cols="90" rows="10" ></textarea>
					</td>
				</tr>
				<tr>
					<th>할인혜택</th>
					<td colspan="4">
						<textarea cols="90" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
					<input type="file">
					</td>
				</tr>
			</table>
			<div>
				<button type="button">글 등록</button>
				<button type="button">뒤로가기</button>
			</div>
		</div><!-- renttable end -->
	</div><!-- rent end -->
	</div><!-- wrap end -->

</body>
</html>