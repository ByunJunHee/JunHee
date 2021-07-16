<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*" %>    
<%@ page import ="service.*" %> 
<%@ page import ="domain.*" %> 
    <% ArrayList<CmQnAVo> alist = (ArrayList<CmQnAVo>)request.getAttribute("alist");

%>
 <% CmQnAVo cqv = (CmQnAVo)request.getAttribute("cqv"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 자유게시판</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/Q&AAnswercss.css">
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
		<div class="cm">
			<table border="1" >
				<tr class="c1">
					<th width="120px" height="30px">게시판</th>
				</tr>
				<tr class="c2">
					<td><a href="<%=request.getContextPath() %>/Board/CmBoard">-자유 게시판</a></td>
				</tr>
				<tr class="c2">
					<td height="20px"><a href="<%=request.getContextPath() %>/Board/CmBoard2">-출고인증</a></td>
				</tr>
				<tr>
					<td height="20px"><a href="<%=request.getContextPath() %>/Board/CmBoard3">-차량 갤러리</a></td>
				</tr>
				<tr class="c1">
					<th height="30px">고객센터</th>
				</tr>
				<tr class="c2">
					<td><a href="<%=request.getContextPath() %>/Board/QnA">-Q&A</a></td>
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
			QnA
		</div>
		<div class="board2">
		<input type="hidden">
			<table border="1">
				<tr>
					<td width="500px">[Q]<%=cqv.getQTitle()%></td>
					<td width="100px"><%=m_id %></td>
					<td width="200px"><%=cqv.getQWriteday()%></td>
				</tr>
				<tr>
					<td colspan="3" width="600px"><%=cqv.getQContents()%></td>
				</tr>
			
			</table>
			<div>
			
			</div>
			<div class="btn">
				<button type="button"><a href="<%=request.getContextPath() %>/Board/QnADelete.do?QIdx=<%=cqv.getQIdx()%>">삭제</a></button>

			</div>
		</div>
	</section>
</body>
</html>