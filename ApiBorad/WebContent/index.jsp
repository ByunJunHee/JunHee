<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here   gddddd</title>
</head>
<body>
Hello
<a href="<%=request.getContextPath()%>/memberWrite.do">회원가입 페이지 바로가기</a>
<a href="<%=request.getContextPath()%>/memberList.do">회원 리스트 가기</a>
<a href="<%=request.getContextPath()%>/memberLogin.do">회원 로그인</a>

<a href="<%=request.getContextPath()%>/board/boardList.do">게시판 리스트 가기</a>
<a href="<%=request.getContextPath()%>/board/boardWrite.do">게시판 글쓰기</a>

</body>
</html>