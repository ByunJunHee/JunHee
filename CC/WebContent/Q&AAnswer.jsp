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
					<td height="20px"><a href="#">-출고인증</td>
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