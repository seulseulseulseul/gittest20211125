<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a data-toggle="modal" data-id="여기에 넘길 데이터 넣어준다!" class="btn btn-primary" href="#modalid">test</a>
</body>
<div class="modal hide" id="modalid"> 

 <div class="modal-header">
  <h5 class="modal-title">여기는 모달의 타이틀이다.</h5>

   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
   </button>
  </div>
  <div class="modal-body">
    <input type="text" name="bookId" id="bookId" value=""/> 
  </div>
</div>
  <script src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>
<script type="text/javascript">
$(document).on("click", ".open-modalid", function () { // 클릭하면 id가 modalid인 모달을 연다는 의미이다.
    var myBookId = $(this).data('id'); // a태그에서 data-'id'(''는 강조의 의미)가 정의하고 있는 값을 가져와서 myBoodId에 넣는다.
                                       // 예를 들어, a태그에서 data-title="제목"이라고 되어있다면
                                       // 이 코드는 var myBookId = $(this).data('title')이 될 것이다.
    $(".modal-body #bookId").val( myBookId ); // modal의 body에 있는,
                                              // name과 id가 bookId인 태그의 value를(현재는 value="") myBookId로 바꿔준다.
});
</script>
</html>