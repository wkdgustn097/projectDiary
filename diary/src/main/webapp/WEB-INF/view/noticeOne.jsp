<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.jb-division-line {
  border-top: 1px solid #b2bec3;
  margin: 30px auto;
  width: 300px;        
}
</style>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
<br>
	<h1 align="center">공지사항 상세정보</h1>
	<div>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList">돌아가기</a>
	</div><br>
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
	<div style="text-align:center;">
		<c:if test="${loginMember.memberLevel > 0}"> <!-- 매니저가 아니면 볼 수 없음 -->
			<a style="display :inline-block;"  class="btn btn-primary" href="${pageContext.request.contextPath}/updateNotice?noticeNo=${resultNotice.noticeNo}">수정</a>
			<a style="display :inline-block;" class="btn btn-primary" href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${resultNotice.noticeNo}">삭제</a>	
		</c:if>
	</div>
	<br>
	<div class="jb-division-line"></div>
	<p style="font-size:20px;">댓글</p>
		<br>
	<table class="table table-bordered">
		<tr>	
			<c:if test="${list.size() != 0}">
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
			</c:if>
			<c:forEach var="c" items="${list}">
				<tr>	
					<td>${c.memberId}</td>
					<td>
					<c:if test="${c.isSecret == false}">
						${c.comment}
					</c:if>
					<c:if test="${c.isSecret == true}">
						&#128274;
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
	<!-- 페이징 -->
	
	
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=1&noticeNo=${resultNotice.noticeNo}">처음으로</a></li>
		
		
		<c:if test="${currentPage > 1}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${currentPage - 1}&noticeNo=${resultNotice.noticeNo}">이전</a></li>
			<c:if test="${currentPage > 2}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${currentPage - 2}&noticeNo=${resultNotice.noticeNo}">${currentPage - 2}</a></li>
			</c:if>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${currentPage - 1}&noticeNo=${resultNotice.noticeNo}">${currentPage - 1}</a></li>
		</c:if>
		
		
		<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${currentPage}&noticeNo=${resultNotice.noticeNo}">${currentPage}</a></li>
		
		
		<c:if test="${currentPage < lastPage}">
			<c:if test="${currentPage + 1 <= lastPage}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${currentPage+1}&noticeNo=${resultNotice.noticeNo}">${currentPage + 1}</a></li>
			</c:if>
			<c:if test="${currentPage + 2 <= lastPage}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${currentPage+2}&noticeNo=${resultNotice.noticeNo}">${currentPage + 2}</a></li>
			</c:if>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${currentPage+1}&noticeNo=${resultNotice.noticeNo}">다음</a></li>
		</c:if>
		
		
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noticeOne?currentPage=${lastPage}&noticeNo=${resultNotice.noticeNo}">마지막으로</a></li>
	</ul>
</div>
</body>
</html>