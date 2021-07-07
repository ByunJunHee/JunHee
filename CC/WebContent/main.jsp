<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="service.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery-3.6.0.js"></script>
<link href="resource/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/header.css">
<title>Choice Car</title>
<script>
var time; // 슬라이드 넘어가는 시간
var $carouselLi;
var carouselCount; // 캐러셀 사진 갯수
var currentIndex; // 현재 보여지는 슬라이드 인덱스 값
var caInterval;

//사진 연결
var imgW; // 사진 한장의 너비	
$(document).ready(function(){

	carouselInit(500, 3000);
});

$(window).resize(function(){
	carousel_setImgPosition();
});

/* 초기 설정 */
function carouselInit( height, t ){
	/*
	 * height : 캐러셀 높이
	 * t : 사진 전환 간격 
	*/
	time = t;
	$("#carousel_section").height(height); // 캐너셀 높이 설정
	$carouselLi = $("#carousel_section > ul >li");
	carouselCount = $carouselLi.length; // 캐러셀 사진 갯수
	currentIndex = 0; // 현재 보여지는 슬라이드 인덱스 값
	carousel_setImgPosition();
	carousel();
}

function carousel_setImgPosition(){

	imgW = $carouselLi.width(); // 사진 한장의 너비	
	// 이미지 위치 조정
	for(var i = 0; i < carouselCount; i++)
	{
		if( i == currentIndex)
		{
			$carouselLi.eq(i).css("left", 0);
		}
		else
		{
			$carouselLi.eq(i).css("left", imgW);
		}
	}
}

function carousel(){

	// 사진 넘기기
	// 사진 하나가 넘어간 후 다시 꼬리에 붙어야함
	// 화면에 보이는 슬라이드만 보이기
	caInterval = setInterval(function(){
		var left = "-" + imgW;

		//현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
		$carouselLi.eq(currentIndex).animate( { left: left }, function(){
			// 다시 오른쪽 (제자리)로 이동
			$carouselLi.eq(currentIndex).css("left", imgW);

			if( currentIndex == ( carouselCount - 1 ) )
			{
				currentIndex = 0;
			}
			else
			{
				currentIndex ++;
			}
		} );

		// 다음 슬라이드 화면으로
		if( currentIndex == ( carouselCount - 1 ) )
		{
			// 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
			$carouselLi.eq(0).animate( { left: 0 } );
		}
		else
		{
			$carouselLi.eq(currentIndex + 1).animate( { left: 0 } );
		}
	}, time);
	
}



$(window).resize(function(){
    carousel_setImgPosition();
});

$(document).ready(function(){
    $(".gt").click(function(){
       var src = $("#best").attr("src");

       var strArr = src.split("/");

            var strArr2 = strArr[1].split(".");

       var result = Number(strArr2[0]) + 1;


       if(result < 7){
          $("#best").attr("src",strArr[0]+"/"+result+".jpg");
       }else{
          $("#best").attr("src",strArr[0]+"/1.jpg");
       }
    });
    
    $(".lt").click(function(){
       var src2 = $("#best").attr("src");
       var strArr2 = src2.split("/");
            var strArr3 = strArr2[1].split(".");
       var result2 = strArr3[0] - 1;
       if(result2 > 0){
          $("#best").attr("src",strArr2[0]+"/"+result2+".jpg");
       }else{
          $("#best").attr("src",strArr2[0]+"/6.jpg");
       }
    });
 });
</script>
<style>
    body{
    margin: 0px;
}
#carousel_section{
    width: 100%;

}
#carousel_section > ul{
    margin: 0px;
    padding: 0px;
    width: 100%;
    height: 100%;
    position: relative;
}
#carousel_section > ul > li{
    list-style: none;
    width: 100%;
    height: 100%;
    position: absolute;
}
#carousel_section > ul > li >img{
    list-style: none;
    width: 100%;
    height: 100%;
}
#board{
    width: 90%;
    margin: 10px auto;
    display:flex;
    flex-wrap : wrap;
}

#board table{
	width:555px;
}
#board div{
	border:1px solid lightgray;
}
#board a{
	text-decoration:none;
	color:black;
}
#board a:hover{
	background:#000000;
		color:yellow;
}
h4{
text-align:left;
}


</style>
</head>
<body>
	<%
		String m_id = null;
		if(session.getAttribute("m_id") != null){
			m_id = (String) session.getAttribute("m_id");
		}
	%>
<header>
		<div id="menu_top">
			<div id="mypage">
				<p>
				<% if (m_id == null){%>
					<a href="<%=request.getContextPath()%>/memberJoin.do">회원가입</a>
					<a href="<%=request.getContextPath()%>/memberLogin.do">로그인</a>
				<%
					}else{
				%>
					<%= m_id %>님
					<a href="<%=request.getContextPath()%>/memberLogout.do">로그아웃</a>
					<a href="<%=request.getContextPath()%>/Mypage/Mypage_main.do">마이페이지</a>
				<%
					}
				%>
				</p>
			</div>
			<ul id="navi">
				<li><a href="<%=request.getContextPath()%>/main.do">Logoimage</a></li>
				<li><a href="<%=request.getContextPath()%>/introduce.do">회사소개</a></li>
				<li><a href="<%=request.getContextPath()%>/carDetail.do">차량비교</a></li>
				<li><a href="<%=request.getContextPath() %>/Rent/Rentpage_main.do">렌트</a></li>
				<li><a href="<%=request.getContextPath() %>/Board/CmBoard.do">커뮤니티</a></li>
			</ul>	
		</div>
	</header>
		 <div id="carousel_section">
		        <ul>
		            <li> <img src="<%=request.getContextPath()%>/image/1.jpg"> </li>
		            <li> <img src="<%=request.getContextPath()%>/image/2.jpg"> </li>
		            <li> <img src="<%=request.getContextPath()%>/image/3.jpg"> </li>
		            <li> <img src="<%=request.getContextPath()%>/image/4.jpg"> </li>
		        </ul>
		  </div>	
		  <div id="carimage_section" style="margin-top:5%;  object-fit: cover;">
		  	<table>
		  		<tr>
		  		<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<div id="best_img">
		  			<td rowspan="2">
		  					  		<h4>TOP 6 렌트</h4>
		  			<button type="button" class="lt" style="position:absolute; lgft:5px; top:85%;">&lt</button>
		  			<a href="#"><img src="image/1.jpg" id="best" style="width:100%; height:400px; min-width:50%;"></a>
		  			<button type="button" class="gt" style="position:absolute; right:5px; top:85%;">&gt</button>
		  			</td>
		  		</div>
		  		</tr>
		  		<tr>
				<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<td><a href="#"><img src="<%=request.getContextPath()%>/image/5.jpg" style="width:200px; height:200px;"></a></td>
		  		<td></td>
		  		</tr>
		  	</table>
		  </div>
		  <div id="board">
		  <div id="freeboard">
		  	<table border="1px solid black">
		  	<h5>자유게시판</h5>
		  		<tr>
		  			<td colspan="5"><a href="#">자유게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">자유게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">자유게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">자유게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">자유게시판</a></td>
		  		</tr>
		  	</table>
		  </div>
		  <div id="cargallery">
		  	<table border="1px solid black">
		  		<h5>차량게시판</h5>
		  		<tr>
		  			<td colspan="5"><a href="#">차량게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">차량게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">차량게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">차량게시판</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">차량게시판</a></td>
		  		</tr>
		  	</table>
		  </div>
		  <div id="factorycertication">
		  	<table border="1px solid black">
		  		<h5>출고 인증</h5>
		  		<tr>
		  			<td colspan="5"><a href="#">출고 인증</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">출고 인증</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">출고 인증</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">출고 인증</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">출고 인증</a></td>
		  		</tr>
		  	</table>
		  </div>
		  <div id="qna">
		  	<table border="1px solid black">
		  		<h5>Q&A</h5>
		  		<tr>
		  			<td colspan="5"><a href="#">Q&A</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">Q&A</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">Q&A</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">Q&A</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">Q&A</a></td>
		  		</tr>
		  	</table>
		  </div>
		  <div id="event">
		  	<table border="1px solid black">
		  		<h5>이벤트</h5>
		  		<tr>
		  			<td colspan="5"><a href="#">이벤트</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">이벤트</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">이벤트</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">이벤트</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">이벤트</a></td>
		  		</tr>
		  	</table>
		  </div>
		  <div id="notice">
		  	<table border="1px solid black">
			  	<h5>공지사항</h5>
		  		<tr>
		  			<td colspan="5"><a href="#">공지사항</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">공지사항</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">공지사항</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">공지사항</a></td>
		  		</tr>
		  		<tr>
		  			<td colspan="5"><a href="#">공지사항</a></td>
		  		</tr>
		  	</table>
		  </div>
		  </div>
</body>
</html>