<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>    
<%@ page import ="service.*" %> 
<%@ page import ="domain.*" %> 
<% ArrayList<CmNoticeVo> alist = (ArrayList<CmNoticeVo>)request.getAttribute("alist");
PageMaker pm =(PageMaker)request.getAttribute("pm");
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CC_NOTICE</title>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/CmBoardcss.css">

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
		            <div class="title">공지사항</div>
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
		               <li><a href="<%=request.getContextPath() %>/Manager/Manager_Notice.do">-공지사항</a></li>
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
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="12%">작성자</th>
					<th width="15%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
				 <%for (CmNoticeVo cnv : alist) { %>
				<tr>
					<td><%=cnv.getNIdx()%></td>
					<td><a href="<%=request.getContextPath()%>/Manager/Manager_NoticeContents.do?NIdx=<%=cnv.getNIdx()%>"><%=cnv.getNTitle()%></a></td>
					<td><%=m_id %></td>
					<td><%=cnv.getNWriteday() %></td>
					<td><%=cnv.getNHit() %></td>
				
				</tr>
				 <% } %>
				
			</table>
			<br>
			<div class="button">
				<a href="<%=request.getContextPath() %>/Manager/Manager_NoticeWrite.do"><button type="button">글쓰기</button></a>
			</div>
			<br>
			<div class="pagingArea">
				<table border=0 style="text-align:left;width:800px;height:80px">
					<tr>
						<td width="50px">
						<% if(pm.isPrev() == true) { %>
						<a href="<%=request.getContextPath()%>/Manager/Manager_Notice.do?page=<%=pm.getStartPage()-1%>">◀</a>
						<% } %>
						</td>
						<td>
						<%
						for(int i = pm.getStartPage(); i<=pm.getEndPage(); i++){	
						%>
						&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/Manager/Manager_Notice.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>"><%=i%></a>
						<%} %>
						</td>
						<td width="50px">
						<%if (pm.isNext() == true){ %>
						<a href="<%=request.getContextPath()%>/Manager/Manager_Notice.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">
						▶</a>
						<%} %>
						</td>
					</tr>
				</table>
			</div>
			<br>
			<div class="search">
			
			<form name="frm" action='<%=request.getContextPath()%>/Manager/Manager_Notice.do' method='post'>
				
					<select name="searchType">
						<option value="1">제목</option>
						<option value="2">제목+내용</option>
						<option value="3">작성자</option>
					</select>
					<input type='text' name='keyword' size=10>
					<input type='submit' name='submit' value='검색'>
				</form>

			</div>
		</div>
	</section>
</body>
</html>