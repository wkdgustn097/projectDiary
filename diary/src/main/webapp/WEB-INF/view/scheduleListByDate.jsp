<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>날짜별 스케줄 조회</h1>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>내용</td>
			<td>날짜</td>
		</tr>
		<c:forEach var="l" items="${list}">
			<tr>
				<td>${l.scheduleNo}</td>
				<td>${l.scheduleMemo}</td>
				<td>${l.scheduleDate}</td>
			</tr>
		</c:forEach>
	</table>
	<form method="get" action="${pageContext.request.contextPath}/scheduleListByDate">
		<label for="year"></label>
		<select name="year" id="year">
			<option value="">년</option>
			<c:forEach var="year" begin="${maxMinMap.minYear}" end="${maxMinMap.maxYear}" step="1">
				<option value="${year}">${year}</option>
			</c:forEach>
		</select>년
		<label for="month"></label>
		<select name="month" id="month">
			<option value="">월</option>
			<c:forEach var="month" begin="1" end="12" step="1">
				<option value="${month}">${month}</option>
			</c:forEach>
		</select>월
		<label for="day"></label>
		<select name="day" id="day">
			<option value="">일</option>
			<c:forEach var="day" begin="1" end="31" step="1">
				<option value="${day}">${day}</option>
			</c:forEach>
		</select>일
		<button>전송</button>
	</form>
</body>
</html>