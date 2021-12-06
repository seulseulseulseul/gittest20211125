
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateForm.jsp</title>
</head>
<body>
<%
// String id = (String) session.getAttribute("id");
// request.setCharacterEncoding("utf-8");
//sql구문 실행
// MemberDAO memberDAO = new MemberDAO();
// MemberDTO memberDTO = (MemberDTO) request.getAttribute("memberDTO");
// model.addAttribute("memberDTO", memberDTO);
%>
<form action="${pageContext.request.contextPath}/member/updatePro" method="post">
아이디 : <input type="text" name="id" value="${sessionScope.id}" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name" value="${memberDTO.name}"><br>
<input type="submit" value="회원정보수정">
</form>

</body>
</html>