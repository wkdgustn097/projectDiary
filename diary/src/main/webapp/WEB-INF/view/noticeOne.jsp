<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h1>상세정보</h1>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>만든 날짜</th>
		</tr>
		<tr>
			<td>${resultNotice.noticeNo} </td>
			<td>${resultNotice.noticeTitle} </td>
			<td>${resultNotice.noticeContent} </td>
			<td>${resultNotice.createdate} </td>
		</tr>
	</table>
	<c:if test="${loginMember.memberLevel > 0}"> <!-- 매니저가 아니면 볼 수 없음 -->
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/updateNotice?noticeNo=${resultNotice.noticeNo}">수정</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${resultNotice.noticeNo}">삭제</a>	
	</c:if>
	<br>
	<h3>댓글</h3>
	현재 페이지 : ${currentPage}
	<br>
	<table class="table table-bordered">
		<tr>
			<c:forEach var="c" items="${list}">
				<tr>
					<th class="table-primary">작성자</th>
					<th class="table-primary">댓글내용</th>
					<c:if test="${memberId eq c.memberId}">
						<th class="table-primary">수정</th>
					</c:if>
					<c:if test="${memberId eq c.memberId || memberCheckLevel > 0 }">
						<th class="table-primary">삭제</th>
					</c:if>
				</tr>
				<tr>	
					<td>${c.memberId}</td>
					<td>
					<c:if test="${c.isSecret == false}">
						${c.comment}
					</c:if>
					<c:if test="${c.isSecret == true}">
						비밀글입니다.
					</c:if>
					</td>
					<c:if test="${memberId eq c.memberId}">
						<td><a href="${pageContext.request.contextPath}/updateComment?commentNo=${c.commentNo}&writer=${c.memberId}&noticeNo=${c.noticeNo}">수정</a></td>
					</c:if>
					<c:if test="${memberId eq c.memberId || memberCheckLevel  > 0}">
						<td><a href="${pageContext.request.contextPath}/removeComment?commentNo=${c.commentNo}&writer=${c.memberId}&noticeNo=${c.noticeNo}">삭제</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</tr>
	</table>
		<div>
	<a href="${pageContext.request.contextPath}/addComment?noticeNo=${resultNotice.noticeNo}" class="btn btn-primary">댓글 쓰기</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/notice/noticeOne?currentPage=1&noticeNo=${resultNotice.noticeNo}">
		처음으로
	</a>
	<c:if test="${currentPage > 1}">
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/notice/noticeOne?currentPage=${currentPage-1}&noticeNo=${resultNotice.noticeNo}">
				이전
			</a>
	</c:if>
	<c:if test="${currentPage < lastPage}">
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/notice/noticeOne?currentPage=${currentPage+1}&noticeNo=${resultNotice.noticeNo}">
				다음
			</a>
	</c:if>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/notice/noticeOne?currentPage=${lastPage}&noticeNo=${resultNotice.noticeNo}">
		마지막으로
	</a>
	</div>
</div>
</body>
</html>