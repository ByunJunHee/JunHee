<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 자유게시판</title>
 <link rel="stylesheet" href="./resource/Q&AAnswercss.css">
</head>
<body>
	<header>
		<div id="menu_top">
			<div id="mypage">
				<p>ooo님 | <a href="#">Logout | </a><a href="#"> Mypage</a></p>
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
			자유 게시판
		</div>
		<div class="board2">
			<table border="1">
				<tr>
					<td width="500px">[Q]렌터가 문의 합니다.</td>
					<td width="100px">홍길동</td>
					<td width="100px">2021-05-05</td>
				</tr>
				<tr>
					<td colspan="3" height="100px">렌터카 견적 신청하면 차량을 몇일만에 받을 수 있나요?</td>
				</tr>
			</table>
			<div>
				<h5>A</h5>
				<textarea></textarea>
			</div>
			<div class="btn">
				<input type="submit" value="등록">
				<input type="submit" value="취소">
			</div>
		</div>
	</section>
</body>
</html>