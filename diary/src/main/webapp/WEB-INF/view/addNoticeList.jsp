<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>공지 추가하기</h1>
	<form method="post" action="${pageContext.request.contextPath}/addNotice">
		<table class="table table-bordered">
			<tr>
				<td>공지 제목</td>
				<td><input type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td><textarea cols="25" rows="4" name="noticeContent"></textarea></td>
			</tr>
			<tr>
				<td>공지사항 비밀번호</td>
				<td><input type="password" name="noticePw"></td>
			</tr>
		</table>
		<button class="btn btn-primary">확인</button>
	</form>
</div>
</body>
</html>