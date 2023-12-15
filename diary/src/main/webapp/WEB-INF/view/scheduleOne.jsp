<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<br>
	<div class="container">
	<h1>${targetYear}년 ${targetMonth}월 ${targetDay}일 일정리스트</h1>
	<br>
	<c:forEach var="s" items="${scheduleList}">
		<div class="alert alert-success">
			<span>${s.scheduleDate}</span>
			<span>${s.scheduleMemo}</span>
			<span>${s.memberId}</span>
		</div>
	</c:forEach>
		<table class="table table-bordered">
			<div>
				<tr>
					<th>날짜</th>
					<th>내용</th>
					<th>이름</th>
				</tr>
				<c:forEach var="s" items="${scheduleList}">
					<tr>
					  <td><span>${s.scheduleDate}</span></td>
					  <td><textarea cols="30" rows="3">${s.scheduleMemo}</textarea></td>
					  <td>${s.memberId}</td>
					  <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/scheduleUpdate?scheduleNo=${s.scheduleNo}">일정 수정</a></td>
					  <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/scheduleRemove?scheduleNo=${s.scheduleNo}">일정 삭제</a></td>
					</tr>
			 </c:forEach>
			</div>
		</table>
		<br>
		<h1>일정 추가</h1>
		<br>
		<form id="addForm" action="${pageContext.request.contextPath}/scheduleOne" method="POST">
			<input type="hidden" name="Year" value="${targetYear}">
			<input type="hidden" name="Month" value="${targetMonth}">
			<input type="hidden" name="Day" value="${targetDay}">
		<div>
			<input type="radio" name="emoji" value="&#1F4DD;"><span>&#128110;</span>
			<input type="radio" name="emoji" value="&#128186;">&#128186;
			<input type="radio" name="emoji" value="&#127981;">&#127981;
			<input type="radio" name="emoji" value="&#127863;">&#127863;
			<input type="radio" name="emoji" value="&#127834;">&#127834;
		</div>
		<textarea rows="3" cols="80" id="scheduleMemo" name="scheduleMemo"></textarea>
		<button class="btn btn-primary" type="submit" id="addBtn">일정추가</button>
		</form>
	</div>
</body>

<script type="text/javascript">
	$('#addBtn').click(function() {
		if($('#scheduleMemo').val().length < 1) {
			alert('내용을 추가하세요');
		} else {
			$('#addForm').submit();
		}
	});
</script>
</html>