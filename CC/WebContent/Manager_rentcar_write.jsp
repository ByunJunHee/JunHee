<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-3.6.0.js"></script>
<title>관리자 렌트등록</title>
<script language = "javascript">
	function check(){
		var fm = document.frm;
		
		if(fm.kr_name.value == ""){
			alert("차량이름을 입력하세요");
			fm.kr_name.focus();
			return;
		
		}else if(fm.kr_spec.value == ""){
			alert("차량스펙을 입력하세요");
			fm.kr_spec.focus();
			return;
			
		}else if(fm.kr_price.value == ""){
			alert("차량가격을 입력하세요");
			fm.kr_price.focus();
			return;
		
		}else if(fm.kr_discount.value == ""){
			alert("할인가격을 입력하세요");
			fm.kr_discount.focus();
			return;
		
		}else if(fm.kr_dtoption.value == ""){
			alert("상세옵션을 입력하세요");
			fm.kr_dtoption.focus();
			return;
		
		}else if(fm.kr_dbenefit.value == ""){
			alert("할인혜택을 입력하세요");
			fm.kr_dbenefit.focus();
			return;
		}
		fm.action ="<%=request.getContextPath()%>/Manager/Manager_rentcar_writeAction.do";
		fm.method="post"
		fm.submit();
		
		return;
	}
</script>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/Manager_rentcar_writecss.css">
</head>
<body>
	<header>
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
	</header>
	<div id="wrap">
	<div id="rent">
		<div>
			<h2>렌트등록</h2>
		</div>
		<div id="renttable">
		<form name="frm">
			<table border="1" width="60%">
				<tr>
					<th width="20%">차량명</th>
					<td width="30%"><input type="text" name="kr_name"></td>
					<th width="20%">사양</th>
					<td width="30%"><input type="text" name="kr_spec"></td>
				</tr>
				<tr>
					<th width="20%">가격</th>
					<td width="30%"><input type="text" name="kr_price"></td>
					<th width="20%">할인가격</th>
					<td width="30%"><input type="text" name="kr_discount"></td>
				</tr>
				<tr>
					<th>상세옵션</th>
					<td  colspan="4" >
						<textarea cols="90" rows="10" name="kr_dtoption"></textarea>
					</td>
				</tr>
				<tr>
					<th>할인혜택</th>
					<td colspan="4">
						<textarea cols="90" rows="10" name="kr_dbenefit"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
					<input type="file">
					</td>
				</tr>
			</table>
			<div>
				<button type="button" onclick="check()">글 등록</button>
				<button type="button" onclick="history.back()">뒤로가기</button>
			</div>
			</form>
		</div><!-- renttable end -->
	</div><!-- rent end -->
	</div><!-- wrap end -->

</body>
</html>