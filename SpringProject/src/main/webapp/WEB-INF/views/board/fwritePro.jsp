<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<title>board/fwritePro.jsp</title>
</head>
<body>
<%
// request.setCharacterEncoding("utf-8");

//파일업로드
// MultipartRequest multi = new MultipartRequest(request,업로드폴더물리적경로,파일최대크기,한글처리,동일한파일이름변경);
//webapp - upload 폴더 만들기
//upload 폴더 물리적경로 알아오기
String uploadPath = request.getRealPath("/upload");
System.out.println(uploadPath);
//첨부할 파일 최대크기 : 10MB
int maxSize = 10*1024*1024; 
MultipartRequest multi = 
	new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

//업로드한 multi 파라미터(태그) 값 가져오기
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
//upload폴더에 올라간 첨부파일의 이름
String file = multi.getFilesystemName("file");

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
boardDTO.setFile(file);
//디비작업파일
BoardDAO boardDAO = new BoardDAO();
boardDAO.insertBoard(boardDTO);
//글목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>