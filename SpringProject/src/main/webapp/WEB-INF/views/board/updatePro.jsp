<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updatePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num")) ;
String pass = (String)request.getParameter("pass");
String name = (String)request.getParameter("name");
String subject = (String)request.getParameter("subject");
String content = (String)request.getParameter("content");
BoardDAO boardDAO = new BoardDAO();
//메서드 정의 BoardDTO numCheck(int num,String pass)
BoardDTO boardDTO = boardDAO.numCheck(num, pass);
if(boardDTO!=null){
	boardDTO.setName(name);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	boardDAO.updateBoard(boardDTO);
	response.sendRedirect("list.jsp");
}else{%>
	<script type="text/javascript">
	alert("입력하신 정보가 틀립니다.");
	history.back(); //뒤로 이동
	</script>
<% 
}
%>
</body>
</html>