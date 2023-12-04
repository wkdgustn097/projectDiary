<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	현재 페이지 : ${currentPage}<br><br>
	<c:if test="${loginMember.memberLevel > 0}"> <!-- 매니저가 아니면 볼 수 없음 -->
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/addNotice">추가</a><br>
	</c:if>
	<br>
	<h1>공지 리스트</h1>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>공지제목</th>
		</tr>
		<c:forEach var="n" items="${list}">
			<tr>
				<td>${n.noticeNo}</td>
				<td><a href="${pageContext.request.contextPath}/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
			<tr>
		</c:forEach>
	</table>
	<c:if test="${currentPage > 1}">
		<a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage - 1}">이전</a>
	</c:if>
	<a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage + 1}">다음</a>
</div>
</body>
</html>