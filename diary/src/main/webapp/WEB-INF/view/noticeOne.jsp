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
	<h1>상세정보</h1>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>만든 날짜</th>
		</tr>
		<tr>
			<td>${resultNotice.noticeNo} </td>
			<td>${resultNotice.noticeTitle} </td>
			<td>${resultNotice.noticeContent} </td>
			<td>${resultNotice.createdate} </td>
		</tr>
	</table>
	<c:if test="${loginMember.memberLevel > 0}"> <!-- 매니저가 아니면 볼 수 없음 -->
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/updateNotice?noticeNo=${resultNotice.noticeNo}">수정</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${resultNotice.noticeNo}">삭제</a>	
	</c:if>
	
	<c:forEach var="c" items="${list}">
		${c.comment}
		${c.memberId}
	</c:forEach>
</div>
</body>
</html>