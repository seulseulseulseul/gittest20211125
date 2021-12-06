
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.dao.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
</head>
<body>
<%
// 세션값 가져오기
// String id=(String)session.getAttribute("id");
//자바파일안에 디비연동작업 메서드 정의(getMember)하고 자바파일 객체생성(기억장소할당)하고 메서드 호출
// MemberDAO memberDAO = new MemberDAO();
// MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO");
%>
아이디 : ${memberDTO.id}<br>
비밀번호 : ${memberDTO.pass}<br>
이름 : ${memberDTO.name}<br>
가입날짜 : ${memberDTO.date}<br>
<a href = "${pageContext.request.contextPath}/member/main">메인으로 이동</a>
<img src="${pageContext.request.contextPath}/resources/images/icon1.png">
</body>
</html>