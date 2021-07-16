<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberVO mv = (MemberVO)request.getAttribute("mv"); %>
<%@ page import ="java.util.*" %>    
<%@ page import ="service.*" %> 
<%@ page import ="domain.*" %>     

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">

<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="../jquery-3.6.0.min.js"></script>


<script>
	$(document).ready(function(){
	
		$("input[name=pwdRd]").blur(function(){
			var pwd = $("input[name=pwd]").val();
			var pwdRe = $(this).val();
			if(pwd == pwdRe){
				$(this).next().show().text("비밀번호가 일치합니다.").css("color","green");
				
			}else{
				$(this).next().show().text("비밀번호가 일치하지 않습니다.").css("color","red");
				
			}
			
		})
	})
</script>
</head>
 <link href="<%=request.getContextPath()%>/resource/Mypage_detail4css.css" rel="stylesheet" type="text/css">
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
			<li><a href="<%=request.getContextPath()%>/main.do">Logoimage</a></li>
				<li><a href="<%=request.getContextPath()%>/introduce.do">회사소개</a></li>
				<li><a href="<%=request.getContextPath()%>/carDetail.do">차량비교</a></li>
				<li><a href="<%=request.getContextPath() %>/Rent/Rentpage_main.do">렌트</a></li>
				<li><a href="<%=request.getContextPath() %>/Board/CmBoard.do">커뮤니티</a></li>
		</ul>	
	</div>
	<div id="wrap">
		 <h2>회원정보 수정</h2>
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
		<div id="modify">
		<form name="frm" action="#" method="post">
				<table>
					<tr class="box">
						<th>비밀번호</th>
						<td><input type="password" size="20" name="pwd"><span>(영문 대소문자/숫자8자~16자</span></td>
					</tr>
					<tr>
						<th>비밀번호 확인 <span class="impred">*</span></th>
						<td><input type="password" size="20" name="pwdRe"><span>비밀번호를 입력해주세요</span></td>
					
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>  
						 <select id="mPhone1" name="mPhone1">
			               <option value="010" selected>010</option>
			               <option value="011">011</option>
			               <option value="016">017</option>
		   				  </select>
		   				  <input type="text" class="phone" maxlength="4" size="3" name=""> <input type="text" class="phone" maxlength="4" size="3">
						</td>
					</tr>
					<tr>
						<th>이메일 <span class="impred">*</span></th>
						<td><input type="email" size="20"></td>
					</tr>
				</table>
			
			<div>
				<button id="submit"name="submit" value="submit">등록</button>
				<button id="cancle"name="cancle">취소</button>
			</div>
		</form>
		</div>
		</div>
	</div>
</body>

</html>