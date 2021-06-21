<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량추가</title>
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
	#schoption{
		margin:0px auto;
	}
	#jw{
		margin-left:210px;
	}
	#button{
		float:right;
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
		 <h2>차량DB</h2>
		<div id="menu_sub">
		      <ul id="navi2">
		         <li class="group2">
		            <div class="title">차량</div>
		            <ul class="sub2">
		               <li><a href="#">-등록차량목록</a></li>
		               <li><a href="#">-차량추가</a></li>
		            </ul>
		         </li>
		      </ul>
		</div><!-- menu_sub end -->
		<!-- 차량추가 -->
		<div id="dbtable">
			<table border="1" width="50%">
				<tr>
					<th width="30%">제조사</th>
					<td width="70%"><input type="text"></td>
				</tr>
				<tr>
					<th width="30%">출시</th>
					<td width="70%">
						<label>
						<input type="radio" name="value">국산
						</label>
						<label>
						<input type="radio" name="value">수입
						</label>
					</td>
				</tr>
				<tr>
					<th width="20%">출시가</th>
					<td width="60%"><input type="text">~<input type="text"></td>
				</tr>
				<tr>
					<th width="40%">차량이름</th>
					<td width="60%"><input type="text"></td>
				</tr>
				<tr>
					<th width="40%">대표사진</th>
					<td width="60%"><input type="file"></td>
				</tr>
				<tr>
					<th width="40%">사진</th>
					<td width="60%"><input type="file"></td>
				</tr>
				
			</table>
		</div><!-- dbtable end -->
		<!-- 제원 -->
		<div id="jw">
			<div>
				<h3>제원</h3>
			</div>
			<div id="jwtable">
				<table border="1" width="40%">
					<tr>
						<th colspan="2">치수</th>
					</tr>
					<tr>
						<th width="60%">전장</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">전폭</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">전고</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">윤거 전</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">윤거 후</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">축거</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">공차중량</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">승차정원</th>
						<td width="40%"><input type="text"></td>
					</tr><tr>
						<th width="60%">전륜타이어</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">후륜타이어</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th colspan="2">엔진</th>
					</tr>
					<tr>
						<th width="60%">배기량</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">최고속도</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">엔진형식</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">최고출력</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">최고출력회전수</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">최대토크</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">최대토크회전수</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">가속 성능 0~100km</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">최대코트발생 시작 회전 수</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">최대토크발생 종료 회전 수</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">구동모터 최대출력</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">구동모터 최대토크</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">합산출력</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">엔진위치</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">베터리종류</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">배터리 용량</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th colspan="2">연비</th>
					</tr>
					<tr>
						<th width="60%">연료</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">연비</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">연비등급</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">이산화탄소 배출량</th>
						<td width="40%"><input type="text"></td>
					</tr>
					<tr>
						<th width="60%">1회충전 주행거리</th>
						<td width="40%"><input type="text"></td>
					</tr>
				</table>
			</div><!-- jwtable end -->
			<!-- 사진 list -->
			<div>
				<h4>등록된 사진</h4>
				<h5>대표사진</h5>
				<div id="imagelist"></div>
			</div>
			<div id="button">
			<button type="button">등록</button>
			</div>
		</div><!-- jw end -->
	</div><!-- wrap end -->
</body>
</html>