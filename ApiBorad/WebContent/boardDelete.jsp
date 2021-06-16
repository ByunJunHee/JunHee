<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "service.BoardVo" %>    
<% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>    
<!DOCTYPE HTML>
<HTML>
 <HEAD>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <TITLE> New Document </TITLE> 
  <script language = "javascript">
function check(){
		var fm = document.frm;		

	if (fm.password.value==""){
		alert("비밀번호 입력");
		fm.password.focus();
		return;
	}
		alert("전송합니다");
		fm.action ="<%=request.getContextPath()%>/board/boardDeleteAction.do";
		fm.method = "post";
		fm.submit();	

	return;
}

 </script>
 </HEAD>

 <BODY>
<center><h1>게시판 삭제하기</h1></center>
<hr></hr>
<form name="frm">
<input type="hidden" name="bidx" value="<%= bv.getBidx()%>"> 
 <table border="1" style="text-align:left;width:800px;height:300px">
<tr>
<td>제목</td>
<td><%= bv.getSubject()%></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="password" size="30"></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" value="확인" onClick="check();"> 
<input type="reset" value="다시작성"> 
</td>
</tr>
 </table>
 </form>
 </BODY>
</HTML>