<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "service.*" %>
	<% CmBoardVo cbv = (CmBoardVo)request.getAttribute("cbv"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function check(){

		
	  
	var returnValue = confirm('삭제하시겠습니까?');
	alert(returnValue);

	  document.frm.action ="<%=request.getContextPath()%>/Board/CmBoardDeleteAction.do";
	  document.frm.method = "post";
	  document.frm.submit(); 
	  return;
} 
 </script>
</head>
<body>
<form name="frm"> 
<input type="hidden" name="bNum" value="<%=cbv.getbNum()%>">

<
<input type="button" value="확인" onClick="check();"> 


 </form>
</body>
</html>