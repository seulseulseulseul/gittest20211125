<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<%
// BoardDAO boardDAO = new BoardDAO();
//한 화면에 보여줄 글 개수 10개 설정
// int pageSize = 3;
//첫번째 페이지 => 1
//http://localhost:8181/JspStudy/board/list.jsp
//페이지번호 클릭하면 => 1,2,3, ....
//http://localhost:8181/JspStudy/board/list.jsp?pageNum=3

//페이지 번호 가져오기
// String pageNum = request.getParameter("pageNum");
//페이지 번호가 없으면 -> 1
// if(pageNum==null){
// 	pageNum="1";
// }

//pageNum => 정수형 변경
// int currentPage = Integer.parseInt(pageNum);
//시작하는 행번호 구하기
// int startRow=(currentPage-1)*pageSize+1;
// int endRow=startRow+pageSize-1;

//getBoardList(startRow,pageSize) 메서드 정의
//select * from board order by num desc limit 시작행-1, 가져올개수
// List<BoardDTO> boardList = boardDAO.getBoardList(startRow,pageSize);

//게시판 전체 글 개수
// int count = boardDAO.getBoardCount();
%>
<h1>글목록[전체글 개수 : ${pageDTO.count}]</h1>
<h2><a href="fwriteForm.jsp">글쓰기</a></h2>
<table border="1">
<tr><td>글번호</td><td>글쓴이</td><td>제목</td><td>등록일</td><td>조회수</td></tr>
<% 
// for(int i=0;i<boardList.size();i++){
	//boardList 한칸접근 게시판 한개 들고 오기
	// BoardDTO boardDTO = (BoardDTO)boardList.get(i);
// 	BoardDTO boardDTO = boardList.get(i);
%>
<%-- <tr><td><%=boardDTO.getNum()%></td><td><%=boardDTO.getName()%></td> --%>
<%-- <td><a href="content.jsp?num=<%=boardDTO.getNum()%>"><%=boardDTO.getSubject()%></a></td> --%>
<%-- <td><%=boardDTO.getDate()%></td> --%>
<%-- <td><%=boardDTO.getReadcount()%></td></tr> --%>
<%-- <%}%> --%>

<c:forEach var="boardDTO" items="${boardList }">
<tr><td>${boardDTO.num}</td><td>${boardDTO.name}</td>
<td><a href="${pageContext.request.contextPath}/board/content?num=${boardDTO.num}">${boardDTO.subject}</a></td>
<td>${boardDTO.date}</td>
<td>${boardDTO.readcount}</td></tr>
</c:forEach>
</table>
<%
//한페이지에 보여줄 페이지 개수 설정
// int pageBlock=3;
//시작하는 페이지 번호
// int startPage= (currentPage-1)/pageBlock*pageBlock+1;
//끝나는 페이지 번호
// int endPage = startPage+pageBlock-1;
//구한 끝나는 페이지 번호 10,전체 글 페이지 수 2
//전체 글 페이지 수 구하기
//전체 글 50 / 한화면에 보여줄 글개수 10 => 전체페이지수 5 + 나머지글 없음 0
//전체 글 57 / 한화면에 보여줄 글개수 10 => 전체페이지수 5 + 나머지글 있음 1

// int pageCount = count/pageSize+(count%endPage==0?0:1);
// if(endPage>pageCount){
	//끝나는 페이지번호 = 전체 글 페이지 수
// 	endPage=pageCount;
// }

//이전 1 안보임 11 21 .. 보임
// if(startPage > pageBlock){
	%>

	<%
// }
//1~10
// for(int i=startPage;i<=endPage;i++){
%>

<% 
// } 

//다음 끝페이지번호 10 전체페이지개수 50 => 다음에 글이 있음
// if(endPage < pageCount){
%>

<% 
// }
%>
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
</c:if>

<!-- var: 변수명. begin: 시작. end: 끝. step:증가  -->
<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${i }">${i }</a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
</c:if>

</body>
</html>