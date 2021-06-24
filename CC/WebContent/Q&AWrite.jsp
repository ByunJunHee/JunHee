<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글쓰기</title>
<script src="jquery-3.6.0.min.js"></script>

 <link rel="stylesheet" href="./resource/Q&AWritecss.css">

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
			<table border="1" class="board1-1" >
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
			Q&A
		</div>
		<div class="board2">
			<table border="1" class="board2-2" width="600" height="450">
				<tr>
					<th height="5%" >제목</th>
					<td><input type="text" id="title"></td>
				</tr>
				<tr>
					<th height="75%">내용</th>
					<td><textarea></textarea></td>
				</tr>
				<tr>
					<th height="20%">파일첨부</th>
					<td><input type="file" onchange=""></td>
				</tr>
				<tr>
					<th height="20%">비밀번호</th>
					<td><input id="pwd" type="password" maxlength="15" ></td>
				</tr>
			</table>
			<div class="btnArea">
				<button type="button" href="#">저장</button>
				<button type="button" href="#">취소</button>
			</div>
		</div>
	</section>
</body>
</html>