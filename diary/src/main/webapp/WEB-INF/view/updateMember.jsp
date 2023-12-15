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
<br>
	<h1>비밀번호 수정</h1>
	<div>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/home">돌아가기</a>
	</div><br>
	<form method="post" action="${pageContext.request.contextPath}/updateMember">
	<input type="hidden" name="memberNo" value="${memberNo}">
		<table class="table table-bordered">			
			<tr>
				<td>변경 전 비밀번호</td>
				<td><input type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>새로운 비밀번호</td>
				<td><input type="password" name="memberPw2"></td>
			</tr>
		</table>
		<button class="btn btn-primary">변경</button>
	</form>
</div>
</body>
</html>