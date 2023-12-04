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

	<h1>공지사항 삭제</h1>
	<form method="post" action="${pageContext.request.contextPath}/deleteNotice">
	<input type="hidden" value="${noticeNo}" name="noticeNo">
		<table class="table table-bordered">
			<tr>
				<td>비밀번호를 입력하세요</td>
				<td><input type="password" name="noticePw"></td>
			</tr>
		</table>
		<button class="btn btn-primary" >공지사항 삭제</button>
	</form>
	</div>
</body>
</html>