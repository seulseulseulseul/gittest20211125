<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/main.jsp</title>
</head>
<body>
<%
// String id = (String) session.getAttribute("id");
//아이디가 없으면(세션값이 없으면) loginForm.jsp 이동
// if(id==null){
// 	response.sendRedirect("./login");
// }

// 표현언어 ${ } 세션, 연산자, 
// 		<dependency>
// 			<groupId>javax.servlet</groupId>
// 			<artifactId>jstl</artifactId>
// 			<version>1.2</version>
// 		</dependency>
// JSTL (JSP Standard Tag Library) => if for 태그 표현
%>
<!-- if구문 -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/member/login"></c:redirect>
</c:if>
${sessionScope.id }님 로그인 하셨습니다.<br>
<input type="button" value="로그아웃"
		onclick="location.href='${pageContext.request.contextPath}/member/logout'"><br>
<a href="${pageContext.request.contextPath}/member/info">회원정보조회</a><br>
<a href="${pageContext.request.contextPath}/member/update">회원정보수정</a><br>
<a href="${pageContext.request.contextPath}/member/delete">회원정보삭제</a><br>
<c:if test="${!empty sessionScope.id }">
	<c:if test="${sessionScope.id == 'admin' }">
		<a href="${pageContext.request.contextPath}/member/list">회원목록</a><br>
	</c:if>
</c:if>
<%
// if(id!=null){
// 	//로그인 회원
// 	if(id.equals("admin")){
// 		//admin 관리자
		%><% 
// 	}
// }
%>
</body>
</html>