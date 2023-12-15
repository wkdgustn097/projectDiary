<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#circle{
  background-color: red;
  width:10px;
  height:10px;
  border-radius: 7px;
}

table, th, td {border: 1px solid black; border-collapse: collapse;}

td:hover{background-color: lightblue;}

th{font-weight: bold; height: 50px;}

td{text-align: left; vertical-align: text-top; width: 200px; height: 100px; padding: 10px}
li a{
	display: block;
	color:#000;
	padding: 8px 16px;
	text-decoration: none;
}

li a.active{
	background-color:#04AA6D;
	color:white;
}

li a:hover:not(.active){
	background-color:#555;
	color:white;
}
ul{
	list-style: none; 
	margin:0; 
	padding:0;
	width:10%;
	background-color:#f1f1f1;
	position:fixed;
	height:100%;
	overflow:auto;
}
a{color: inherit; text-decoration: none;}
</style>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div id="wrap">
<nav id="nav">
        <ul>
          <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
          <li><a href="${pageContext.request.contextPath}/noticeList">공지사항</a></li>
          <li><a href="${pageContext.request.contextPath}/updateMember?memberNo=${loginMember.memberNo}">정보수정</a></li>
          <li><a href="${pageContext.request.contextPath}/deleteMember?memberNo=${loginMember.memberNo}">회원탈퇴</a></li>
        </ul>
     </nav>
     <div style="margin-left:10%; padding: 1px 16px; height:1000px">
	<br>
	<!-- 캘린더 -->
	
	<!--${fn:substring(sn, 0, 3) } jstl로 jsp에서 substr쓰기 -->
	<p style="color:pink;">${loginMember.memberId}</p>님 반갑습니다.
	<div align="center">
		<h1>${calendarMap.targetMonth + 1} 월</h1>
	</div>
	<div style="text-align: left; position: relative;">
	    <p style="margin-top:50px;">${calendarMap.targetYear} 년</p>
	    <div style="position: absolute;  bottom:10%; left: 50%; transform: translateX(-50%);" class="d-flex justify-content-center" align="center">
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth - 1}">&#60;&nbsp;이전달</a>&nbsp;
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth + 1}">다음달&nbsp;&#62;</a>
	    </div>
	</div>

	<br>
	<br>
	<table class="table table-bordered">
		<tr>
			<th style="text-align:center;">SUN</th> 
			<th style="text-align:center;">MON</th>
			<th style="text-align:center;">TUE</th>
			<th style="text-align:center;">WED</th>
			<th style="text-align:center;">THU</th>
			<th style="text-align:center;">FRI</th>
			<th style="text-align:center;">SAT</th>
		</tr>
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
									<div>
										<c:if test="${m.cnt == 1}">
											<div style="float:right; background-color:blue;" id="circle"></div>
										</c:if>
										<c:if test="${m.cnt >= 2 && m.cnt <= 4}">
											<div style="float:right; background-color:green;" id="circle"></div>
										</c:if>
										<c:if test="${m.cnt > 4}">
											<div style="float:right;" id="circle"></div>
										</c:if>
									</div>
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
										<div>
											<div style="float:left;">${m.scheduleEmoji}</div>
											<c:if test="${m.cnt == 1}">
												<div data-bs-toggle="tooltip" title="${m.cnt}개의 일정" style="float:right; background-color:blue;" id="circle"></div>
											</c:if>
											<c:if test="${m.cnt >= 2 && m.cnt <= 4}">
												<div data-bs-toggle="tooltip" title="${m.cnt}개의 일정" style="float:right; background-color:green;" id="circle"></div>
											</c:if>
											<c:if test="${m.cnt > 4}">
												<div data-bs-toggle="tooltip" title="${m.cnt}개의 일정" style="float:right;" id="circle"></div>
											</c:if>
										</div>
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
</div>
</div>

</body>
</html>