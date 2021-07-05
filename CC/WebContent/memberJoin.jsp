<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-3.6.0.js"></script>
<link href="resource/header.css" rel="stylesheet" type="text/css">
<link href="resource/Join.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script language = "javascript">
function check(){
	var fm = document.frm;
	
	if(fm.m_id.value==""){
		alert("아이디를 입력하세요");
		fm.m_id.focus();
		return;
	}else if(fm.m_pass.value==""){
		alert("비밀번호를 입력하세요");
		fm.m_pass.focus();
		return;
	}else if(fm.m_pass2.value==""){
		alert("비밀번호를 입력하세요");
		fm.m_pass2.focus();
		return;
	}else if(fm.m_pass.value != fm.m_pass2.value){
		alert("비밀번호를 확인하세요");
		fm.m_pass2.value="";
		fm.m_pass2.focus();
		return;
	}else if(fm.m_name.value ==""){
		alert("이름을 입력하세요");
		fm.m_name.focus();
		return;
	}else if(fm.m_phone1.value==""){
		alert("휴대폰번호를 입력하세요");
		fm.m_phone.focus();
		return;
	}else if(fm.m_phone2.value==""){
		alert("휴대폰번호를 입력하세요");
		fm.m_phone2.focus();
		return;
	}else if(fm.m_email.value==""){
		alert("이메일을 입력하세요");
		fm.m_email.focus();
		return;
	}else if(fm.m_addr1.value==""){
		alert("우편번호를 입력하세요");
		fm.m_addr1.focus();
		return;
	}else if(fm.m_addr2.value==""){
		alert("주소를 입력하세요");
		fm.m_addr2.focus();
		return;
	}else if(fm.m_addr3.value==""){
		alert("상세주소를 입력하세요");
		fm.m_addr3.focus();
		return;
	}
		fm.action ="<%=request.getContextPath()%>/memberJoinAction.do";
		fm.method = "post";
		fm.submit();	
	
	return;
}
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<header>
		<div id="menu_top">
			<div id="mypage">
				<p>ooo님 | <a href="#">Logout | </a><a href="#"> Mypage</a></p>
			</div>
			<ul id="navi">
				<li><a href="main.do">Logoimage</a></li>
				<li><a href="introduce.do">회사소개</a></li>
				<li><a href="#">차량비교</a></li>
				<li><a href="#">렌트</a></li>
				<li><a href="#">커뮤니티</a></li>
			</ul>	
		</div>
	</header>
	<div id="header">회원가입</div>
	<div id="join">
	<center>
		<form name="frm">
			<table border=1>
				<tr>
					<td id="title">아이디</td>
					<td>
						<input type="text" name="m_id" maxlength="12" required>
					</td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td>
						<input type="password" name="m_pass" id="m_pass" maxlength="15" required>
					</td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td>
						<input type="password" name="m_pass2" id="m_pass2" maxlength="15" required>
					</td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td>
						<input type="text" name="m_name" id=m_name required>
					</td>
				</tr>
				<tr>
					<td id="title">성별</td>
					<td>
						<input type="radio" name="m_gender" value="남" checked required>남
						<input type="radio" name="m_gender" value="여" required>여
					</td>
				</tr>
				<tr>
					<td id="title">휴대폰</td>
					<td>
						<select>
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select>
						<input type="text" name="m_phone1" required size="1" id="m_phone" maxlength="4">-
						<input type="text" name="m_phone2" required size="1" id="m_phone2" maxlength="4">
					</td>
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td>
						<input type="text" name="m_email" id="m_email" required>@
						<select name="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td id="title" rowspan="3">주소</td>
					<td>
						<input style="width:40%; display:inline;" placeholder="우편번호"  type="text" name="m_addr1" id="m_addr1">
						<%-- <button type="button">우편번호 찾기</button>--%>
					</td>
 				</tr>
				<tr>
					<td>
						<input style="top:5px; width:90%;" placeholder="도로명 주소" type="text" name="m_addr2" id="m_addr2">
					</td>
				</tr>
				<tr>
					<td>
						<input style="width:90%;" placeholder="상세주소" type="text" name="m_addr3" id="m_addr3" required>
					</td>
				</tr>
			</table>
			<br>
			<div id="btn">
			<input type="button" value="돌아가기" onclick="history.back();">
			<input type="button" value="가입하기" onclick="check();">
			</div>
		</form>
	</center>
	</div>
</body>
</html>