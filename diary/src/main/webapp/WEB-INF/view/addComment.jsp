<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<h1>내용 입력</h1>
	<br>
	<form action="${pageContext.request.contextPath}/addComment" method="post">
		<input type="hidden" name="noticeNo" value="${noticeNo}">
		<input type="checkbox" value="true" name="isSecret">비밀글<br>															
		<table class="table table-bordered">
			<tr>
				<td>댓글</td>
				<td><textarea cols="25" rows="4" name="comment"></textarea></td>
			</tr>
		</table>
		<br>
		<button type="submit" class="btn btn-primary">댓글 달기</button>
	</form>
	<br>
	</div>
</body>
</html>