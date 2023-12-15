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
	<br>
	<c:if test="${loginMember.memberLevel > 0}"> <!-- 매니저가 아니면 볼 수 없음 -->
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/addNotice">추가</a>
	</c:if>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/home">홈으로</a><br>
	<br>
	<h1>공지사항</h1>
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
	
	<!-- 페이징 -->
	
	
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=1">처음으로</a></li>
		
		
		<c:if test="${currentPage > 1}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage - 1}">이전</a></li>
			<c:if test="${currentPage > 2}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage - 2}">${currentPage - 2}</a></li>
			</c:if>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage - 1}">${currentPage - 1}</a></li>
		</c:if>
		
		
		<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage}">${currentPage}</a></li>
		
		
		<c:if test="${currentPage < lastPage}">
			<c:if test="${currentPage + 1 <= lastPage}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage+1}">${currentPage + 1}</a></li>
			</c:if>
			<c:if test="${currentPage + 2 <= lastPage}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage+2}">${currentPage + 2}</a></li>
			</c:if>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
		
		
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeList?currentPage=${lastPage}">마지막으로</a></li>
	</ul>
</div>
</body>
</html>