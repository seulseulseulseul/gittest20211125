<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertForm.jsp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn').click(function(){
			$.ajax('${pageContext.request.contextPath}/member/idCheck',{
				data:{id:$('#id').val()},
				success:function(rdata){
					if(rdata=='iddup'){
						rdata="아이디 중복";
					}else{
						rdata="아이디 사용가능"
					}
					$("#dupdiv").html(rdata);
				}
			});
		});
	});
</script>
</head>
<body>
<h1>http://localhost:8181/myweb/member/insert</h1>
<!-- ./member/insertPro -->
<!-- http://localhost:8088/myweb/member/member/insertPro -->
<!-- /member/insertPro -->
<!-- http://localhost:8088/member/insertPro -->
<!-- ${pageContext.request.contextPath}/member/insertPro -->
<!-- http://localhost:8088/myweb/member/insertPro?id=&pass=&name= -->
<form action="${pageContext.request.contextPath}/member/insertPro" method="post">
아이디 : <input type="text" name="id" id="id"><br>
<input type="button" value="아이디 중복체크" id="btn">
<div id="dupdiv">아이디 중복체크하세요</div>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name"><br>
<input type="submit" value="회원가입">
</form>
</body>
</html>