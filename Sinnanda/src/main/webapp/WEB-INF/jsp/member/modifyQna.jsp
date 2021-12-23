<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
	
	<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	
	<link rel="stylesheet" href="css/aos.css">
	
	<link rel="stylesheet" href="css/ionicons.min.css">
	
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">
	
	
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/style.css">
	
	<title>회원 문의사항 수정</title>
</head>
<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery 실행 -->
<body onload="toBoardScroll()">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>
		// [이승준] 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
		}
		
		// [이승준] 답변이 있는 게시글의 수정을 막아주는 JQuery
		var qnaComments = "${qna.qnaComments}";
		$(document).ready(function(){
			if(qnaComments != ""){
				$('input').prop('readonly', true);
				$('textarea').prop('readonly', true);
				$('#qnaSecret').attr('disabled', true);
				$('select').prop('disabled', true);
				$('button').prop('disabled', true);
				alert('답변이 작성된 글은 수정이 불가능합니다.');
			}
		});
		
		// [이승준] Qna 내용 입력 여부 확인
		function formCheck(){
			// 제목
			if($("#qnaTitle").val() == ""){
				alert("제목을 입력해주세요.");
				$("#qnaTitle").focus();
				return false;
			}
			// 내용
			if($("#qnaContent").val() == ""){
				alert("내용을 입력해주세요.");
				$("#qnaContent").focus();
				return false;
			}
		}
	</script>
	
	<!-- [이승준] 상단 내비바 - START -->
	<%@ include file="/WEB-INF/partials/navbar.jsp" %>
	<!-- [이승준] 상단 내비바 - END -->
	
	<!-- [이승준] 상단 이미지 배너 - START -->
	<%@ include file="/WEB-INF/partials/qnaBackground.jsp" %>
	<!-- [이승준] 상단 이미지 배너 - END -->
	
	<!-- [이승준] 회원 QnA 수정 폼 -->
	<section id="startBoard" class="ftco-section testimony-section bg-light">
		<div class="container">
			<span class="subheading"><a href="qnaList">회원 Q&A</a> > 문의수정</span>
			<h1><strong>회원문의 수정</strong></h1>
			
			<form onsubmit="return formCheck()" id="modifyQnaForm" action="/member/modifyQna" method="post">
				<input id="qnaNo" name="qnaNo" type="hidden" value="${qna.qnaNo}">
				<input id="memberNo" name="memberNo" type="hidden" value="${qna.memberNo}">
				
				<table class="table table-board" style="width: 100%;">
					<tr>
						<th style="width:10%;">제목</th>
						<td style="text-align:left;">
							<input id="qnaTitle" name="qnaTitle" type="text" value="${qna.qnaTitle}" style="width: 90%;">
						</td>
						<th>작성일</th>
						<td>
							<fmt:parseDate value="${qna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
						</td>
					</tr>
					<tr>
						<th>비밀글 여부</th>
						<td>
							<c:if test="${qna.qnaSecret == '일반문의'}">
								<input id="qnaSecret" name="qnaSecret" type="checkbox">
							</c:if>
							<c:if test="${qna.qnaSecret == '비밀문의'}">
								<input id="qnaSecret" name="qnaSecret" type="checkbox" checked="checked">
							</c:if>
						</td>
						<th>카테고리</th>
						<td>${qna.qnaCategory}</td>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td>
							<textarea id="qnaContent" name="qnaContent" cols="100%" rows="5">${qna.qnaContent}</textarea>
						</td>
					</tr>
				</table>
				<button id="" class="btn btn-primary" type="submit">문의 수정</button>
			</form>
		</div>
	</section>
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->
	
	<!-- [이승준] js 소스코드 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="direngine-master/js/google-map.js"></script>
	<script src="direngine-master/js/main.js"></script>
</body>
</html>