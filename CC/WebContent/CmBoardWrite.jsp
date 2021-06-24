<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글쓰기</title>
<script src="jquery-3.6.0.min.js"></script>
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
	.cm{
		position:absolute; left:50px; top:200px;
	}
	.board{
		position:absolute; left:220px; top:150px;
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
		text-align:right;
	}
	.board1-1{
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
	.board2{
		position:absolute; left:220px; top:220px;
		width:500px;
	}
	.board2-2{
		border-right:hidden;
		border-left:hidden;
	}
	
	.btnArea{
			position:relative;
            left:500px;
	}
	textarea{
				border-width:1px;
				resize:none;
				width:99%;
				height:97%;
	}
	#title{
			width:99%;
			height:93%;
	}
	.cm a{
		text-decoration:none;
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
	<section>
		<div class="cm">
			<table border="1" class="board1-1" >
				<tr class="c1">
					<th width="120px" height="30px">게시판</th>
				</tr>
				<tr class="c2">
					<td><a href="">-자유 게시판</a></td>
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
			</table>
			<div class="btnArea">
				<button type="button" href="#">저장</button>
				<button type="button" href="#">취소</button>
			</div>
		</div>
		<div class="board_cmt">
    	<div class="tit" style="margin-left: 6px"><em id="totalCmt" class="bico_comment"></em>Comments</div>
     		<div class="board_cmt_write">
         		<div class="bx"> 
             		<textarea id="cmtContent" placeholder="소중한 댓글을 작성해주세요^^" maxlength="150"></textarea>
         		</div>
        		<button id="btn_insert_cmt">등록</button>
     		</div>
		</div>
	</section>
</body>
</html>