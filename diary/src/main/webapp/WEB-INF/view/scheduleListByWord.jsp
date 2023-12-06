<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>no</td>
			<td>memo</td>
		</tr>
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.scheduleNo}</td>
				<td>${s.scheduleMemo}</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${currentPage > 1}">
		<a href="${pageContext.request.contextPath}/scheduleListByWord?currentPage=${currentPage - 1}">이전</a>
	</c:if>
	<a href="${pageContext.request.contextPath}/scheduleListByWord?currentPage=${currentPage + 1}">다음</a>
</div>
	<div>
		<form action="${pageContext.request.contextPath}/scheduleListByWord" method="get">
			<input type="text" name="word">
			<button type="submit">검색</button>
		</form>
	</div>
</body>
</html>