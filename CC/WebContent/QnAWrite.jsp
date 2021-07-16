<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글쓰기</title>

<script>
	function check(){
		
		alert("등록합니다.");
			document.frm.action ="<%=request.getContextPath()%>/Board/QnAWriteAction.do";
			document.frm.method = "post";
			document.frm.submit(); 
			return;
			}
</script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/Q&AWritecss.css">

</head>
<body>
<form name="frm">
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
			Q&A
		</div>
		<div class="board2">
			<table border="1" class="board2-2" width="600" height="450">
				<tr>
					<th height="5%" >제목</th>
					<td><input type="text" name="QTitle" id="title"></td>
				</tr>
				<tr>
					<th height="75%">내용</th>
					<td><textarea name="QContents"></textarea></td>
				</tr>
				<tr>
					<th height="20%">파일첨부</th>
					<td><input type="file" onchange=""></td>
				</tr>
				
			</table>
			<div class="btnArea">
				<input type="button" value="저장" onClick="check()"> 
				<button type="button" href="#">취소</button>
			</div>
		</div>
	</section>
	</form>
</body>
</html>