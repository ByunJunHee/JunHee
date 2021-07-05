 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록차량목록</title>
<script type="text/javascript">
	function click(){
		if(document.frm.password.value)
		
	}
</script>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/Manager_cardbcss.css">
</head>

<body>
	<div id="menu_top">
		<div id="mypage">
			<p>ooo님 | <a href="#">Logout | </a><a href="<%=request.getContextPath()%>/Mypage/Mypage_main.do"> Mypage</a></p>
		</div>
		<ul id="navi">
			<li><a href="#">Logoimage</a></li>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">차량비교</a></li>
			<li><a href="<%=request.getContextPath() %>/Rent/Rentpage_main.do">렌트</a></li>
			<li><a href="<%=request.getContextPath() %>/Board/CmBoard.do">커뮤니티</a></li>
		</ul>	
	</div>
	<div id="wrap">
		 <h2>차량DB</h2>
		<div id="menu_sub">
		      <ul id="navi2">
		         <li class="group2">
		            <div class="title">차량</div>
		            <ul class="sub2">
		               <li><a href="<%=request.getContextPath()%>/Manager/Manager_cardb.do">-등록차량목록</a></li>
		               <li><a href="<%=request.getContextPath()%>/Manager/Manager_cardb2.do">-차량추가</a></li>
		            </ul>
		         </li>
		      </ul>
		</div><!-- menu_sub end -->
		<div id="dbtable">
			<table border="1" width="70%">
				<tr>
					<th width="10%">No</th>
					<th width="30%">차량이름</th>
					<th width="20%">제조사</th>
					<th width="40%">출시가격</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div><!-- dbtable end -->
		<div id="schoption">
			<select>
				<option>검색옵션</option>
				<option value="1">No</option>
				<option value="1">차량이름</option>
				<option value="1">출시가격</option>
			</select>
			<button type="button" value="검색"onclick="click()">검색</button>
		</div>
	</div><!-- wrap end -->
</body>
</html>