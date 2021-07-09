<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function modify(){
		location.href="Manager/Manager_rentcar_modify.do";
	}
</script>
<title>관리자 렌트관리</title>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/Manager_Rentpage_maincss.css">
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
					<button type="button" onclick="modify()">수정</button>
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
					<button type="button" onclick="modify()">수정</button>
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
					<button type="button" onclick="modify()">수정</button>
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
						<button type="button" onclick="modify()">수정</button>
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
					<button type="button" onclick="modify()">수정</button>
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
					<button type="button" onclick="modify()">수정</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div>
	<a href="<%=request.getContextPath()%>/Manager/Manager_rentcar_write.do"><button type="button" id="submit">글등록</button></a>
	</div>
</body>
</html>