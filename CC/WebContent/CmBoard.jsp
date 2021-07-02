<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>    
<%@ page import ="service.*" %> 
<%@ page import ="domain.*" %> 
<% ArrayList<CmBoardVo> alist = (ArrayList<CmBoardVo>)request.getAttribute("alist");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 자유게시판</title>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/CmBoardcss.css">

</head>
<body>
	<header>
		<div id="menu_top">
			<div id="mypage">
				<p>ooo님 | <a href="#">Logout | </a><a href="<%=request.getContextPath()%>/Mypage/Mypage_main.do"> Mypage</a></p>
			</div>
			<ul id="navi">
				<li><a href="#">Logoimage</a></li>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="<%=request.getContextPath() %>/Rentpage_main.do">렌트</a></li>
				<li><a href="<%=request.getContextPath() %>/Board/CmBoard.do">커뮤니티</a></li>
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
					<td><a href="<%=request.getContextPath() %>/Board/CmBoard.do">-자유 게시판</a></td>
				</tr>
				<tr class="c2">
					<td height="20px"><a href="<%=request.getContextPath() %>/Board/CmBoard2.do">-출고인증</a></td>
				</tr>
				<tr>
					<td height="20px"><a href="<%=request.getContextPath() %>/Board/CmBoard3.do">-차량 갤러리</a></td>
				</tr>
				<tr class="c1">
					<th height="30px">고객센터</th>
				</tr>
				<tr class="c2">
					<td><a href="#">-Q&A</a></td>
				</tr>
				<tr>
					<td class="c3"><a href="#">-FAQ</a></td>
				</tr>
				<tr class="c1">
					<th height="30px">자유 게시판</th>
				</tr>
				<tr class="c2">
					<td><a href="#">-이벤트</a></td>
				</tr>
				<tr class="c3">
					<td><a href="#">-공지사항</a></td>
				</tr>
			</table>
		</div>
		<div class="board">
			자유 게시판
		</div>
		<div class="board2">
			<table border="1">
				
				<tr>
					<th width="7%">번호</th>
					<th >제목</th>
					<th width="12%">작성자</th>
					<th width="15%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
				<%
					
				for (CmBoardVo cbv : alist) { %>
				<tr>
					<p>1</p>
					<td><%=cbv.getbNum() %></td>
					
				
				</tr>
				<% } %>
				
			</table>
			<br>
			<div class="button">
				 <a href="<%=request.getContextPath() %>/Board/CmBoardWrite.do"><button type="button">글쓰기</button></a>
			</div>
			<br>
			<div class="pagingArea">
				<a href="">&lt;</a>
				<a href="">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href="">&gt;</a>
			</div>
			<br>
			<div class="search">
				<form action="#" method="get">
					<select name="searchType">
						<option value="1">제목</option>
						<option value="2">제목+내용</option>
						<option value="3">작성자</option>
					</select>
					<input type="text" name="searchText">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
	</section>
</body>
</html>