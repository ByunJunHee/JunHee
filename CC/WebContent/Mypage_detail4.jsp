<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
 <link rel="stylesheet" href="./resource/Mypage_detail4css.css">
<body>
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
	<div id="wrap">
		 <h2>회원 정보 수정</h2>
		<div id="menu_sub">
		      <ul id="navi2">
		         <li class="group2">
		            <div class="title">나의 부가 정보</div>
		            <ul class="sub2">
		               <li><a href="#">-나의 견적내역</a></li>
		               <li><a href="#">-나의 찜 차량</a></li>
		               <li><a href="#">-내가 쓴 글 관리</a></li>
		            </ul>
		         </li>
		         <li class="group2">
		            <div class="title">회원</div>
		            <ul class="sub2">
		               <li><a href="#">-회원정보 수정</a></li>
		               <li><a href="#">-회원탈퇴</a></li>
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
						<td><input type="text" size="20"><span>(영문 대소문자/숫자/!@#,8자~16자</span></td>
					</tr>
					<tr>
						<th>비밀번호 확인 <span class="impred">*</span></th>
						<td><input type="text" size="20"></td>
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
			</form>
			<div>
				<button id="submit"name="submit" value="submit">등록</button>
				<button id="cancle"name="cancle">취소</button>
			</div>
		</div>
		</div>
	</div>
</body>
</html>