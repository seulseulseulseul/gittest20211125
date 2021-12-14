<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름_통합구현_실기시험_파일_test1.jsp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#idbtn').click(function(){
// 			alert("클릭");
			$.ajax('${pageContext.request.contextPath}/test/ajaxtest1',{
				data:{id:$('#id').val()},
				success:function(rdata){
					if(rdata=='iddup'){
						rdata="아이디 중복";
					}else{
						rdata="아이디 사용가능"
					}
					$('#idmsg').html(rdata);
				}
			});
		});
		//id="emailbtn" 클릭하면
		//${pageContext.request.contextPath}/test/ajaxtest2
		//들고갈 데이터 email 파라미터 : id = "email"
		//rdata emaildup 이메일중복, 이메일 사용가능
		//id = "emailmsg" 출력
		$('#emailbtn').click(function(){
// 			alert("클릭");
			$.ajax('${pageContext.request.contextPath}/test/ajaxtest2',{
				data:{email:$('#email').val()},
				success:function(rdata){
					if(rdata=='emaildup'){
						rdata="이메일 중복";
					}else{
						rdata="이메일 사용가능"
					}
					$('#emailmsg').html(rdata);
				}
			});
		});
	});
</script>
</head>
<body>
<h3>1번)아이디중복확인버튼 클릭시 id중복체크 하세요</h3>
<h3>2번)이메일중복확인버튼 클릭시 email중복체크 하세요</h3>

<form action="a.jsp" method="post" name="fr" id="fr">
<table>
<tr>
<th colspan="4">*표시는 반드시 입력하도록 체크하세요
</th>
</tr>

<tr>
<th>*이름</th>
<td colspan="3"><input type="text" name="name" id="name"></td>
</tr>

<tr>
<th>*주민등록번호</th>
<td><input type="text" name="주민등록번호앞자리" name="ju1" id="ju1"></td>
<td >-</td>
<td><input type="text" name="주민등록번호뒷자리" name="ju2" id="ju2"></td>
</tr>

<tr>
<th>*회원 ID</th>
<td><input type="text" name="id" id="id"></td>
<td colspan="2"><input type="button" value="아이디중복확인" id="idbtn"></td>
<td><div id="idmsg">중복확인 해주세요</div></td>
</tr>
 
<tr>
<th>*비밀번호</th>
<td colspan="3"><input type="password" name="pass" id="pass"></td> 
</tr>

<tr>
<th>*이메일 Email</th>
<td><input type="text" name="email" id="email"></td>
<td colspan="2"><input type="button" value="이메일중복확인" id="emailbtn"></td>
<td><div id="emailmsg">중복확인 해주세요</div></td>
</tr>

<tr>
<th>*핸드폰번호</th>
<td colspan="3"><input type="text" name="mobile" id="mobile"></td> 
</tr>

<tr>
<th>*취미</th>
<td  colspan="3"><input type="checkbox" name="hob" id="hobtrip" value="여행">여행
<input type="checkbox" name="hob" id="hobbook" value="독서">독서
<input type="checkbox" name="hob" id="hobgame" value="게임">게임</td>
</tr>

<tr>
<th>*회원분류</th>
<td  colspan="3"><select name="grade" id="grade">
<option value="">선택해주십시오</option>
<option value="일반">일반</option>
<option value="실버">실버</option>
<option value="골드">골드</option>
</select></td>
</tr>

<tr>
<th></th>
<td  colspan="3"><input type="submit" value="회원가입" id="sbtn">
<input type="reset" value="취소" id="rbtn"></td>
</tr>

</table>
</form>
</body>
</html>