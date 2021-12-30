<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
	
	<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="/css/animate.css">
	
	<link rel="stylesheet" href="/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/css/magnific-popup.css">
	
	<link rel="stylesheet" href="/css/aos.css">
	
	<link rel="stylesheet" href="/css/ionicons.min.css">
	
	<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/css/jquery.timepicker.css">
	
	
	<link rel="stylesheet" href="/css/flaticon.css">
	<link rel="stylesheet" href="/css/icomoon.css">
	<link rel="stylesheet" href="/css/style.css">
	
<title>회원 문의사항 추가</title>
</head>
<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery 실행 -->
<body onload="toBoardScroll()">

	<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>
		// [이승준] 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
		}
		
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
	
    <!-- [이승준] 회원 QnA 입력폼 -->
    <section id="startBoard" class="ftco-section testimony-section bg-light">
		<div class="container">
			<span class="subheading"><a href="qnaList">회원 Q&A</a> > 문의작성</span>
			<h1><strong>회원문의 작성</strong></h1>
			
			<form onsubmit="return formCheck()" id="addQnaForm" action="addQna" method="post">
				<input id="memberNo" name="memberNo" type="hidden" value="${loginUser.member.memberNo}">
				<table class="table table-board" style="width: 100%;">
					<tr>
						<th style="width:10%;">제목</th>
						<td style="text-align:left;">
							<input id="qnaTitle" name="qnaTitle" type="text" style="width: 90%;">
						</td>
					</tr>
					<tr>
						<th>비밀글 여부</th>
						<td>
							<input id="qnaSecret" name="qnaSecret" type="checkbox">
						</td>
					</tr>
					<tr>
						<th>문의유형</th>
						<td style="width:40%;">
							<select id="qnaCategory" name="qnaCategory">
								<option value="기타문의">기타문의</option>
								<option value="결제문의">결제문의</option>
								<option value="이용문의">이용문의</option>
								<option value="예약문의">예약문의</option>
								<option value="숙소문의">숙소문의</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td><textarea id="qnaContent" name="qnaContent" cols="100%" rows="5"></textarea></td>
					</tr>
				</table>
				<button id="" class="btn btn-primary" type="submit">문의 추가</button>
			</form>
		</div>
	</section>
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->
	
	<!-- [이승준] js 소스코드 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.easing.1.3.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>
	<script src="/js/jquery.stellar.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/aos.js"></script>
	<script src="/js/jquery.animateNumber.min.js"></script>
	<script src="/js/bootstrap-datepicker.js"></script>
	<script src="/js/jquery.timepicker.min.js"></script>
	<script src="/js/scrollax.min.js"></script>
	<script src="/direngine-master/js/google-map.js"></script>
	<script src="/direngine-master/js/main.js"></script>
</body>
</html>