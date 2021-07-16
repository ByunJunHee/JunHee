<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>    
<%@ page import ="service.*" %> 
<%@ page import ="domain.*" %> 
<% ArrayList<CmCarGalleryVo> alist = (ArrayList<CmCarGalleryVo>)request.getAttribute("alist");

%>
 <% CmCarGalleryVo cgv = (CmCarGalleryVo)request.getAttribute("cgv"); %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 자유게시판</title>

 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/CmBoardcss.css">

</head>
<body>
<form name="frm">
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
				<li><a href="#">Logoimage</a></li>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
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
					<td>제목</td>
					<td colspan="7"><%=cgv.getCgTitle()%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%= m_id %></td>
					<td>작성일</td>
					<td><%=cgv.getCgWriteday()%></td>
					<td>조회수</td>
					<td><%=cgv.getCgHit()%></td>
				</tr>
				
				<tr>
					<td style="height:300px;">내용</td>
					<td colspan=5>
					<%=cgv.getCgContents() %>
					</td>
				</tr>
			</table>
			<br>
			<div class="button">
				<button type="button"><a href="<%=request.getContextPath() %>/Board/CmBoard3Modify.do?CgIdx=<%=cgv.getCgIdx()%>">수정</a></button>
				<button type="button"><a href="<%=request.getContextPath() %>/Board/CmBoard3Delete.do?CgIdx=<%=cgv.getCgIdx()%>">삭제</a></button>
			</div>
			<br>
		
		</div>
	</section>
	</form>
</body>
</html>