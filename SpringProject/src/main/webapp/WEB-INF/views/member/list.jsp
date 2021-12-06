<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/list.jsp</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
// 자바스크립트 배열 => JSON(JavaScript Object Notation) : 속성:값 쌍

// [
// {"id":"kim","pass":"p123","name":"김길동","date":"2021-12-02"},
// {"id":"kim2","pass2":"p123","name":"김길동2","date":"2021-12-04"},
// {"id":"kim3","pass3":"p123","name":"김길동3","date":"2021-12-05"}
// ]
	$(document).ready(function(){
		$('#btn').click(function(){
			$.getJSON('${pageContext.request.contextPath}/member/list2',function(rdata){
				$.each(rdata,function(index,item){
					//테이블 태그 뒷부분에 추가
					$('table').append('<tr><td>'+item.id+'</td><td>'+item.pass+'</td><td>'+item.name+'</td><td>'+item.date+'</td></tr>');
				});
			});
		});
	});
</script>
</head>
<body>
<%
//세션값 가져오기
// String id = (String)session.getAttribute("id");
// //세션값 없으면 loginForm.jsp
// if(id==null){
// 	response.sendRedirect("loginForm.jsp");
// }else if(!id.equals("admin")){
// 	response.sendRedirect("main.jsp");
// }

// List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
%>
<!-- if-else가 없으므로 -->
<c:choose>
	<c:when test="${ empty sessionScope.id }">
		<c:redirect url="/member/login"></c:redirect>
	</c:when>
	<c:otherwise>
		<c:if test="${ sessionScope.id != 'admin' }">
			<c:redirect url="/member/main"></c:redirect>
		</c:if>
	</c:otherwise>
</c:choose>

<input type="button" value="회원목록가져오기" id="btn">

<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
//for(int i = 0; i<memberList.size(); i++){
//	MemberDTO memberDTO = memberList.get(i);
	%>
<%-- 	<tr><td><%=memberDTO.getId()%></td><td><%=memberDTO.getPass()%></td> --%>
<%-- 	<td><%=memberDTO.getPass()%></td><td><%=memberDTO.getDate()%></td></tr>	 --%>
<% 
//}
%>
<!-- for 구문 -->
<%-- <c:forEach var="memberDTO" items="${memberList }"> --%>
<%-- 	<tr><td>${memberDTO.id}</td> --%>
<%-- 		<td>${memberDTO.pass}</td> --%>
<%-- 		<td>${memberDTO.name}</td> --%>
<%-- 		<td>${memberDTO.date}</td> --%>
<!-- 	</tr> -->
<%-- </c:forEach> --%>

<a href="${pageContext.request.contextPath}/member/main">메인으로 이동</a>
</table>
</body>
</html>