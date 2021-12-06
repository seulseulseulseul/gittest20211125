<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name = (String)request.getParameter("name");
String pass = (String)request.getParameter("pass");
String subject = (String)request.getParameter("subject");
String content = (String)request.getParameter("content");
int readcount = 0; //조회수 0
//날짜내장객체 <= 시스템 날짜 가져오기
Timestamp date = new Timestamp(System.currentTimeMillis());
//게시판내용을 담아서 디비작업파일에 전달할 파일
BoardDTO boardDTO = new BoardDTO();
boardDTO.setName(name);
boardDTO.setPass(pass);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setReadcount(readcount);
boardDTO.setDate(date);
//디비작업파일
BoardDAO boardDAO = new BoardDAO();
boardDAO.insertBoard(boardDTO);
//글목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>