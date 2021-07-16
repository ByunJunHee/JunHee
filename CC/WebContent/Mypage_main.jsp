<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_main</title>
<link href="<%=request.getContextPath()%>/resource/Mypage_maincss.css" rel="stylesheet" type="text/css">


</head>

<body>
<%
		String m_id = null;
		if(session.getAttribute("m_id") != null){
			m_id = (String) session.getAttribute("m_id");
		}
		
		MypageDao md = new MypageDao();
		//String m_id = md.MypageSelectBoard(inpt_Id);
		
		
		
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
			<li><a href="<%=request.getContextPath()%>/main.do">Logoimage</a></li>
			<li><a href="<%=request.getContextPath()%>/introduce.do">회사소개</a></li>
			<li><a href="#">차량비교</a></li>
			<li><a href="<%=request.getContextPath() %>/Rent/Rentpage_main.do">렌트</a></li>
			<li><a href="<%=request.getContextPath() %>/Board/CmBoard.do">커뮤니티</a></li>
		</ul>	
	</div>
	<div id="wrap">
		 <h2>마이페이지</h2>
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

				<p><%=m_id %>님</p>

				<p><%= m_id %>님 일반회원</p>

				<div id="d1" align="center">견적내역
					<br><br><br>
					<div><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail1.do" style="text-decoration:none" class="click">?</a>건</div>
				</div>
				<div id="d2"  align="center">찜 차량
					<br><br><br>
					<div><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail2.do" style="text-decoration:none" class="click">?</a>건</div>
				</div>
				<div id="d3"  align="center">내가 쓴 글
					<br><br><br>
					<div><a href="<%=request.getContextPath() %>/Mypage/Mypage_detail3.do" style="text-decoration:none" class="click">?</a>건</div>
				</div>
			</div>
		</div>
</body>
</html>