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

	<label>제목</label>
	${view.title}<br />
	
	<label>작성자</label>
	${view.writer}<br />
	
	<label>내용</label><br />
	${view.content}<br />

<div>
<a href="/board/modify?bno=${view.bno}">게시물 수정</a>
<a href="/board/delete?bno=${view.bno}">게시물 삭제</a>
</div>

</body>
</html>