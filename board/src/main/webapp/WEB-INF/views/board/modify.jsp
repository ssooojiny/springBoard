<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
		<div class="form-group">
			<form method="post">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" name="title" class="form-control" value="${view.title }"/>
				</div> <br/>
				
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" name="writer"class="form-control" value="${view.writer }"/>
				</div><br />
				
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea cols="50" rows="5" name="content" class="form-control">${view.content }</textarea><br />
				</div> 
				<div>
					<button type="submit"  class="btn btn-warning">수정</button>
				</div>
			</form>
		</div>	
	<footer>
		<%@include file="../include/footer.jsp" %>
	</footer>

	</div>
</body>
</html>