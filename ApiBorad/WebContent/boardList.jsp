<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>   
<%@ page import = "domain.*" %>

<% 
ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
PageMaker pm = (PageMaker)request.getAttribute("pm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center><h1>게시판 리스트 보기</h1></center>
	<form name="frm" action='<%=request.getContextPath()%>/board/boardList.do' method='post'>
	<table border="0" width="1000px">	
		<tr>
			<td width="750px" align="right">
				<input type="text" name="keyword" size=10>
			</td>
			<td>
				<input type="button" name="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	<table border="1" style="text-align:center; width:1000px; height:80px">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<%for(BoardVo bv : alist){ %>
		<tr>
			<td><%=bv.getBidx() %></td>
			<td>
				<a><%for(int i =1; i<=bv.getLlevel(); i++){
					out.println("&nbsp;&nbsp;");
					if(i == bv.getLlevel()){
						out.println("ㄴ");						
					}
					}%>
				</a>
				<a href="<%=request.getContextPath()%>/board/boardContents.do?bidx=<%=bv.getBidx()%>"><%=bv.getSubject()%></a>
			</td>
			<td><%=bv.getWriter()%></td>
			<td><%=bv.getWritedayY() %></td>
		</tr>
		<%} %>
	</table>
	<table border=0 style="text-align:center; width:1000px; height:80px">
		<tr>
			<td width="300px">
				<% if (pm.isPrev() == true){ %>
					<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">◀</a>
				<%} %>
			</td>
			<td>
			<%
			for(int i= pm.getStartPage(); i<=pm.getEndPage(); i++){
			%>
			&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>"><%=i %></a>
			<%
			}
			%>
			</td>
			<td width="300px">
			<%if (pm.isNext() == true){ %>
				<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">▶</a>
			<%} %>
			</td>
		</tr>
	</table>

	<br>
	<a href="<%=request.getContextPath()%>/board/boardWrite.do">글쓰기</a>
</body>
</html>