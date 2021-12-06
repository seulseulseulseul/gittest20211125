<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/deleteForm.jsp</title>
</head>
<body>
<%
// http://localhost:8181/JspStudy/jsp5/deleteForm.jsp?num=2
int num = Integer.parseInt(request.getParameter("num")) ;
%>
<h1>게시판 글삭제</h1>
<form action="deletePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<table border="1">
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><input type="submit" value="글삭제"></td></tr>
</table>
</form>
</body>
</html>