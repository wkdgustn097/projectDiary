<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<h1>안녕하세요.</h1>
	<div><a style="color:pink;">${loginMember.memberId}</a>님 반갑습니다.</div>
	<br>
	<div>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">로그아웃</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList">공지사항</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/updateMember?memberNo=${loginMember.memberNo}">정보수정</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/deleteMember?memberNo=${loginMember.memberNo}">회원탈퇴</a>
	</div>
	
	<!-- 캘린더 -->
	
	<!--${fn:substring(sn, 0, 3) } jstl로 jsp에서 substr쓰기 -->
	<div>
		${calendarMap.targetYear} 년
		${calendarMap.targetMonth + 1} 월
	</div>
	<div>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth - 1}">이전달</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth + 1}">다음달</a>
	</div>
	
	<table class="table table-bordered">
		<tr>
			<c:forEach var="i" begin="1" end="${calendarMap.totalTd}">
				<c:set var="d" value="${i - calendarMap.beginBlank}"></c:set>
				<td>
					<c:if test="${d < 1 || d > calendarMap.lastDate}">
						&nbsp;
					</c:if>
					<c:if test="${!(d < 1 || d > calendarMap.lastDate)}">
						<c:if test="${(i%7-1)==0}">
							<a href="${pageContext.request.contextPath}/scheduleOne?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth}&targetDay=${d}" class="text-danger">${d}</a>
							<div>
								<c:forEach var="m" items="${list}">
									<c:if test="${m.scheduleDay == d}">
										<div>${m.cnt} 개의 일정</div>
										<div>${m.memo}</div>
									</c:if>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${!((i%7-1)==0)}">
								<a href="${pageContext.request.contextPath}/scheduleOne?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth}&targetDay=${d}">
							 		${d}
								</a>
								<div>
									<c:forEach var="m" items="${list}">
										<c:if test="${m.scheduleDay == d}">
											<div>${m.scheduleEmoji}</div>
											<div>${m.cnt} 개의 일정</div>
											<div>${m.memo}</div>
										</c:if>
									</c:forEach>
								</div>
						</c:if>
					</c:if>
					
					<!-- 한행에 7열씩.. -->
					<c:if test="${i < calendarMap.totalTd && i%7 == 0}">
						</tr><tr>
					</c:if>
				</td>
			</c:forEach>
		</tr>
	</table>
	
	
	</div>
</body>
</html>