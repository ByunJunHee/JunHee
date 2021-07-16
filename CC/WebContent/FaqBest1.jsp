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
	<section>
	<div id="menu_sub">
		      <ul id="navi2">
		         <li class="group2">
		            <div class="title">자유 게시판</div>
		            <ul class="sub2">
		               <li><a href="<%=request.getContextPath() %>/Board/CmBoard.do">-자유게시판</a></li>
		               <li><a href="<%=request.getContextPath() %>/Board/CmBoard2.do">-출고인증</a></li>
		               <li><a href="<%=request.getContextPath() %>/Board/CmBoard3.do">-차량 갤러리</a></li>
		            </ul>
		         </li>
		         <li class="group2">
		            <div class="title">고객센터</div>
		            <ul class="sub2">
		               <li><a href="<%=request.getContextPath() %>/Board/QnA.do">-Q&A</a></li>
		               <li><a href="<%=request.getContextPath() %>/Board/Faq.do">-FAQ</a></li>
		               <li><a href="#">-공지사항</a></li>
		               <li><a href="#">-이벤트</a></li>
		            </ul>
		         </li>
		         
		      </ul>
		</div>
		<div class="board">
			FAQ
		</div>
		<div class="board2">
			
			<hr>
			<div class="board3" >
				<h3>예약/취소 수수료</h3>
				<ol>
					<li><a href="">예약/취소 수수료</li>
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