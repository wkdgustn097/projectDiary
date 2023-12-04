<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login">
		<table class="table table-bordered">
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" placeholder="ID를 입력하세요."></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="memberPw" placeholder="PW를 입력하세요."></td>
			</tr>
		</table>
		<button class="btn btn-primary" type="submit">로그인</button>
	</form>
	</div>
</body>
</html>