<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
	
	if (document.frm.memberId.value =="")	{
		alert("아이디 입력하세요");
		document.frm.memberId.focus();
		return;
	}else if (document.frm.memberPwd.value==""){
		alert("비밀번호 입력하세요");
		document.frm.memberPwd.focus();
		return;
	}
		document.frm.action ="<%=request.getContextPath()%>/memberLoginAction.do";
		document.frm.method = "post";
		document.frm.submit();	
	
	return;
	}
</script>
</head>
<body>
	<section>
		<form name="frm">
			<fieldset>
		        <legend>로그인</legend>
				    ID : <input type="text" name="memberId"><br>
				    Password : <input type="password" name="memberPwd">
				    <div>
				    	<input type="button" onclick="check()" value="확인"> 
				    </div>
  			  </fieldset>
		</form>
	</section>
</body>
</html>