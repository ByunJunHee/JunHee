<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>    
<%@ page import ="service.*" %> 
<%@ page import ="domain.*" %> 
<% ArrayList<RentEstimateVo> alist = (ArrayList<RentEstimateVo>)request.getAttribute("alist");

%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>나의 견적내역</title>
</head>
<link href="<%=request.getContextPath()%>/resource/Mypage_detail1css.css" rel="stylesheet" type="text/css">
<body>
<%
		String m_id = null;
		if(session.getAttribute("m_id") != null){
			m_id = (String) session.getAttribute("m_id");
		}
	%>
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
			<li><a href="<%=request.getContextPath()%>/Rent/Rentpage_main.do">렌트</a></li>
			<li><a href="<%=request.getContextPath() %>/Board/CmBoard.do">커뮤니티</a></li>
		</ul>	
	</div>
	<div id="wrap">
		 <h2>나의 견적 내역</h2>
		<div id="menu_sub">
		      <ul id="navi2">
		         <li class="group2">
		            <div class="title">나의 부가 정보</div>
		            <ul class="sub2">
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail1.do">-나의 견적내역</a></li>
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail2.do">-나의 찜 차량</a></li>
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail3.do">-내가 쓴 글 관리</a></li>
		            </ul>
		         </li>
		         <li class="group2">
		            <div class="title">회원</div>
		            <ul class="sub2">
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail4.do">-회원정보 수정</a></li>
		               <li><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail5.do">-회원탈퇴</a></li>
		            </ul>
		         </li>
		      </ul>
		</div>
		<div id="page_main">
			<div>
				
			</div>
		</div>
	</div>
</body>
</html>