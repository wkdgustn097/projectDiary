<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js">
</script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
	<h1>내용 수정</h1>
	<br>
	<form id="addForm" method="post" action="${pageContext.request.contextPath}/scheduleUpdate">
		<input type="hidden" name="scheduleNo" value="${scheduleNo}">
		<div>
			<input type="radio" name="emoji" value="&#1F4DD;"><span>&#128110;</span>
			<input type="radio" name="emoji" value="&#128186;">&#128186;
			<input type="radio" name="emoji" value="&#127981;">&#127981;
			<input type="radio" name="emoji" value="&#127863;">&#127863;
			<input type="radio" name="emoji" value="&#127834;">&#127834;
		</div>
		<table border="1">
			<tr>
				<td>새로운 내용</td>
				<td><textarea  id="scheduleMemo" name="scheduleMemo" cols="30" rows="6"></textarea></td>
			</tr>
		</table>
		<br>
		<button class="btn btn-primary" id="addbtn">정보 수정</button>
	</form>
	</div>
</body>

<script type="text/javascript">
	$('#addbtn').click(function(){
		if($('#scheduleMemo').val().length < 1) {
			alert('내용을 입력하세요.');
		} else {
			$('#addbtn').submit();
		}
	});
</script>
</html>