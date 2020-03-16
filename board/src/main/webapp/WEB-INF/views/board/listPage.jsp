<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.bno }</td>
						<td><a href="/board/view?bno=${list.bno }">${list.title }</a></td>
						<td><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd  hh:mm:ss"/></td>
						<td>${list.writer }</td>
						<td>${list.viewCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
				
		</table>
		
		
		<div class="col-md-offset-3">
			<ul class="pagination">
				<c:if test="${prev}">
					<li>[ <a href="/board/listPage?num=${startPageNum - 1}">이전</a> ]</li>
				</c:if>
				
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
					<li>
						<a href="/board/listPage?num=${num}">${num}</a>
					</li>
				</c:forEach>
				
				<c:if test="${next}">
					<li><a href="/board/listPage?num=${endPageNum + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</section>
	
	<hr />
	
	<footer>
		<%@include file="../include/footer.jsp" %>
	</footer>

</div>

</body>
</html>