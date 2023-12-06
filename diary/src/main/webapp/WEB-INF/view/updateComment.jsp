<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
	<h1>댓글 수정</h1>
	<form id="addForm" method="post" action="${pageContext.request.contextPath}/updateComment">
	<input type="hidden" name="writer" value="${writer}">
	<input type="hidden" name="commentNo" value="${commentNo}">
	<input type="hidden" name="noticeNo" value="${noticeNo}">
		<table class="table table-bordered">
			<tr>
				<td>새로운 댓글</td>
				<td><textarea cols="25" rows="4" id="comment" name="comment"></textarea></td>
			</tr>
		</table>
		<button id="addbtn" class="btn btn-primary">댓글 수정</button>
	</form>
	</div>
</body>

<script type="text/javascript">
	$('#addbtn').click(function(){
		if($('#comment').val().length < 1) {
			alert('내용을 작성해주세요');
		}  else {
			$('#addbtn').submit();
		}
	});
</script>
</html>