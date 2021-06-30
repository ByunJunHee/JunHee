<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 렌트등록</title>

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
			<table border="1" width="60%">
				<tr>
					<th width="20%">차량명</th>
					<td width="30%"><input type="text"></td>
					<th width="20%">사양</th>
					<td width="30%"><input type="text"></td>
				</tr>
				<tr>
					<th width="20%">가격</th>
					<td width="30%"><input type="text"></td>
					<th width="20%">할인가격</th>
					<td width="30%"><input type="text"></td>
				</tr>
				<tr>
					<th>상세옵션</th>
					<td  colspan="4" >
						<textarea cols="90" rows="10" ></textarea>
					</td>
				</tr>
				<tr>
					<th>할인혜택</th>
					<td colspan="4">
						<textarea cols="90" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
					<input type="file">
					</td>
				</tr>
			</table>
			<div>
				<button type="button">글 등록</button>
				<button type="button">뒤로가기</button>
			</div>
		</div><!-- renttable end -->
	</div><!-- rent end -->
	</div><!-- wrap end -->

</body>
</html>