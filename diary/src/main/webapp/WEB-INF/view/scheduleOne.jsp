<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            display: none;
        }
        #modal .modal-window {
            background: white;
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            color: black;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            color: black;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            color: black;
        }
</style>
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
	<div id="container1">
        <h2>Lorem Ipsum</h2>
        <button id="btn-modal">모달 창 열기 버튼</button>
    </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>정보 수정</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
				<form id="addForm" method="post" action="${pageContext.request.contextPath}/scheduleUpdate">
					<input type="hidden" id="scheduleNo" value="">
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
        </div>
    </div>
	
	
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
<script>        
       const modal = document.getElementById("modal")
       const btnModal = document.getElementById("btn-modal")
       btnModal.addEventListener("click", e => {
    	  modal.style.display = "flex" 
    	  $('#scheduleNo').val('${s.scheduleNo}');
       });
        
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        })
        
		modal.addEventListener("click", e => {
		    const evTarget = e.target
		    if(evTarget.classList.contains("modal-overlay")) {
		        modal.style.display = "none"
		    }
		})
		
		window.addEventListener("keyup", e => {
		    if(modal.style.display === "flex" && e.key === "Escape") {
		        modal.style.display = "none"
		    }
		})
		
		
 </script>

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