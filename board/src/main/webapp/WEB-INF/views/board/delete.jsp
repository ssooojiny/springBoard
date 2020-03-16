<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>

<div class="container">
	<div>
		<header>
			<%@include file="../include/header.jsp" %>
		</header>
		<hr />
			<nav>
				<%@include file="../include/nav.jsp" %>
			</nav>
		</div>
		<hr />
		<section>
		
		<div class="form-group">
		
		 <form role="form" method="post" autocomplete="off">
  
		    <label for="bno" class="col-sm-2 control-label">글 번호</label>
		    <div class="col-sm-10">
		   		<input type="text" id="bno" name="bno"  class="form-control" value="${delete}" readonly="readonly" />
		  		<br/>
		  	</div>


		   
		   <p>정말로 삭제하시겠습니까?</p><br>
		   
		   <div>
		   
		    <button type="submit" class="btn btn-primary">예, 삭제합니다.</button>
		    <button id="cancel_btn" class="btn btn-danger">아니오, 삭제하지 않습니다.</button>
		    
		  </div>    
		    <script>
		
		    // 폼을 변수에 저장
		    var formObj = $("form[role='form']"); 
		    
		    // 취소 버튼 클릭
		    $("#cancel_btn").click(function(){   
		     formObj.attr("action", "/board/view?bno=" + $("#bno").val());
		     formObj.attr("method", "get");  
		     formObj.submit();     
		     
		    });
		    </script>
		   
		   
  		</form>
   	</div>
 </section>

<hr />
		

</div>
</body>
</html>