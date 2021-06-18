<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
 <HEAD>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <TITLE> New Document </TITLE> 
  <script language = "javascript">
function check(){
		var fm = document.frm;		

	if (fm.subject.value =="")	{
		alert("제목 입력");
		fm.subject.focus();
		return;
	}else if (fm.contents.value==""){
		alert("내용 입력");
		fm.contents.focus();
		return;
	}
	else if (fm.writer.value ==""){
	    alert("작성자 입력");
		fm.writer.focus();
		return;
	}else if (fm.password.value==""){
		alert("비밀번호 입력");
		fm.password.focus();
		return;
	}
		fm.action ="<%=request.getContextPath()%>/board/boardWriteAction.do";
		fm.method = "post";
		fm.submit();	

	return;
}

 </script>
 </HEAD>

 <BODY>
<center><h1>게시판 글쓰기</h1></center>
<hr></hr>
<form name="frm"> 
 <table border="1" style="text-align:left;width:800px;height:300px">
<tr>
<td>제목</td>
<td><input type="text" name="subject" size="30"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea name="contents" size="30"></textarea> </td>
</tr>
<tr>
<td>작성자</td>
<td>
<input type="text" name ="writer">
</td>
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