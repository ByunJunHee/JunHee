<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 렌트관리</title>

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
	#submit{
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
	<article>
		<div id="main_image">image</div>
			<!--
			<img src="lt.png" class="lt">
			<img class="_banner"src="1_banner.jpg" width="600"  align="center">
			<img src="gt.png" class="gt">  -->
	</article>
	<article>
		<div id="top6" align="center">
			Best top 6
		</div>
	</article>
	<!-- top6 이미지 -->
	<div class="besttop6">
		<ul>
			<li>
				<div id="rentcar1">
					<p><button type="button" class="car_option" >상세조건</button></p>
					<div></div>
					<p class="wappen">
						<span>신차할인280만원▼</span>
						<span>| 엔진오일 무료쿠폰</span>
					</p>
					<p class="p1">K8</p>
					<p class="p2">노블레스2.5(G)</p>
					<p class="p3">월 41만원대</p>
					<p class="p4">월 33만원대~</p>
					<p class="p5">(세금/보험료/방문정비 포함)</p>
					<div class="btn">
					<button type="button">간편견적신청</button>
					<button type="button">수정</button>
					</div>
				</div>

			</li>
			<li>
				<div id="rentcar2">
					<p><button type="button" class="car_option" >상세조건</button></p>
					<div></div>
					<p class="wappen">
						<span>신차할인280만원▼</span>
						<span>| 엔진오일 무료쿠폰</span>
					</p>
					<p class="p1">K8</p>
					<p class="p2">노블레스2.5(G)</p>
					<p class="p3">월 41만원대</p>
					<p class="p4">월 33만원대~</p>
					<p class="p5">(세금/보험료/방문정비 포함)</p>
					<div class="btn">
					<button type="button">간편견적신청</button>
					<button type="button">수정</button>
					</div>
				</div>
			</li>
			<li>
				<div id="rentcar3">
					<p><button type="button" class="car_option" >상세조건</button></p>
					<div></div>
					<p class="wappen">
						<span>신차할인280만원▼</span>
						<span>| 엔진오일 무료쿠폰</span>
					</p>
					<p class="p1">K8</p>
					<p class="p2">노블레스2.5(G)</p>
					<p class="p3">월 41만원대</p>
					<p class="p4">월 33만원대~</p>
					<p class="p5">(세금/보험료/방문정비 포함)</p>
					<div class="btn">
					<button type="button">간편견적신청</button>
					<button type="button">수정</button>
					</div>
				</div>
			</li>
			<li>
				<div id="rentcar4">
					<p><button type="button" class="car_option" >상세조건</button></p>
						<div class="img"></div>
						<p class="wappen">
							<span>신차할인280만원▼</span>
							<span>| 엔진오일 무료쿠폰</span>
						</p>
						<p class="p1">K8</p>
						<p class="p2">노블레스2.5(G)</p>
						<p class="p3">월 41만원대</p>
						<p class="p4">월 33만원대~</p>
						<p class="p5">(세금/보험료/방문정비 포함)</p>
						<div class="btn">
						<button type="button">간편견적신청</button>
						<button type="button">수정</button>
						</div>
				</div>
			</li>
			<li>
				<div id="rentcar5">
					<p><button type="button" class="car_option" >상세조건</button></p>
					<div></div>
					<p class="wappen">
						<span>신차할인280만원▼</span>
						<span>| 엔진오일 무료쿠폰</span>
					</p>
					<p class="p1">K8</p>
					<p class="p2">노블레스2.5(G)</p>
					<p class="p3">월 41만원대</p>
					<p class="p4">월 33만원대~</p>
					<p class="p5">(세금/보험료/방문정비 포함)</p>
					<div class="btn">
					<button type="button">간편견적신청</button>
					<button type="button">수정</button>
					</div>
				</div>
			</li>
			<li>
				<div id="rentcar6">
					<p><button type="button" class="car_option" >상세조건</button></p>
					<div></div>
					<p class="wappen">
						<span>신차할인280만원▼</span>
						<span>| 엔진오일 무료쿠폰</span>
					</p>
					<p class="p1">K8</p>
					<p class="p2">노블레스2.5(G)</p>
					<p class="p3">월 41만원대</p>
					<p class="p4">월 33만원대~</p>
					<p class="p5">(세금/보험료/방문정비 포함)</p>
					<div class="btn">
					<button type="button">간편견적신청</button>
					<button type="button">수정</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<button type="button" id="submit">글등록</button>
</body>
</html>