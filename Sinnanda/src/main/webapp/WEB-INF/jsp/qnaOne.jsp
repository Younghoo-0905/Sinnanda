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
    
	<title>문의사항 상세보기</title>
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
	</script>
	
	<!-- [이승준] 상단 내비바 - START -->
	<%@ include file="/WEB-INF/partials/navbar.jsp" %>
	<!-- [이승준] 상단 내비바 - END -->
	
	<!-- [이승준] 상단 이미지 배너 - START -->
	<%@ include file="/WEB-INF/partials/qnaBackground.jsp" %>
	<!-- [이승준] 상단 이미지 배너 - END -->
	
	<!-- [이승준] 본문 QnA One 부분 - START -->
	<section id="startBoard" class="ftco-section testimony-section bg-light">
		 <div class="container">
	    	<span class="subheading"><a href="qnaList">회원 Q&A</a> > 상세보기</span>
			<h1><strong>회원문의 상세보기</strong></h1>
			
			<!-- 글작성자의 수정, 삭제 버튼 -->
			<div style="text-align:right;">
				<c:if test="${qna.memberNo == loginUser.member.memberNo}">
					<a class="btn btn-primary" href="/member/modifyQna?qnaNo=${qna.qnaNo}">문의 수정</a>
					<a class="btn btn-primary" href="removeQna?qnaNo=${qna.qnaNo}">문의 삭제</a>
				</c:if>
			</div>
			
			<table class="table table-board" style="width: 100%;">
				<tr>
					<th style="width: 100px; font-size: 20px; text-align:center;">제목</th>
					<td colspan="3" style="font-size: 20px;">
						${qna.qnaTitle}
						<c:if test="${qna.qnaSecret == '비밀문의'}">
							<img src="/images/qna/lockImg.png" width="20px" height="20px">
						</c:if>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;">작성자</th>
					<td style="width: 60%;">${qna.memberName}</td>
					<th style="width: 100px; text-align:center;">작성일</th>
					<td>
						<fmt:parseDate value="${qna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
						<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;">내용</th>
					<td colspan="3">${qna.qnaContent}</td>
				</tr>
			</table>
		</div>
	</section>
	<!-- [이승준] 본문 QnA One 부분 - END -->
	
	<!-- [이승준] 본문 QnA One 답변 부분 - START -->
	<section class="ftco-section services-section bg-light">
		<div class="container">
			<h2><strong>관리자 답변</strong></h2>
			
			<table class="table table-board" style="width: 100%;">
				<!-- [이승준] 비회원 or 회원, 답변이 없을 때 -->
				<c:if test="${qna.qnaComments == null}">
					<th style="text-align:center; font-size: 30px;">답변 없음</th>
				</c:if>
				
				<!-- [이승준] 관리자, 답변이 없을 때 -->
				<c:if test="${loginUser != null}">
					<c:if test="${(qna.qnaComments == null) && (loginUser.userLevel == 3)}">
						<form id="addQnaCommentForm" action="addQnaComment" method="post">
						<input id="qnaNo" name="qnaNo" type="hidden" value="${qna.qnaNo}">
						<input id="adminNo" name="adminNo" type="hidden" value="${loginUser.admin.adminNo}">
						<table class="table table-board" style="width: 100%;">
							<tr>
								<th style="width: 150px; font-size: 20px; text-align:center;">
									문의 답변하기<br><br>
									<button id="addQnaCommentBtn" type="submit"class="btn btn-primary">답변하기</button>
								</th>
								<td><textarea id="qnaCommentContent" name="qnaCommentContent" cols="100" rows="5"></textarea></td>
							</tr>
						</table>
					</form>
					</c:if>
				</c:if>
				
				<!-- [이승준] 공통, 답변이 있을 때 -->
				<c:if test="${qna.qnaComments != null}">
						<tr>
							<th style="width: 100px; text-align:center;">답변자</th>
							<th style="text-align:center;">답변 내용</th>
							<th style="width: 150px; text-align:center;">작성일</th>
							<!-- [이승준] 관리자, 답변이 있을 때, 삭제 기능 사용가능 -->
							<c:if test="${(loginUser.userLevel == 3)}">
								<th style="width: 70px; text-align:center;">삭제</th>
							</c:if>
						</tr>
						<tr>
							<td style="text-align:center;">${qna.adminName}</td>
							<td>${qna.qnaComments.qnaCommentContent}</td>
							<td style="text-align:center;">
								<fmt:parseDate value="${qna.qnaComments.commentDate}" var="commentDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
								<fmt:formatDate value="${commentDate}" pattern="yy/MM/dd HH:mm"/>
							</td>
							<!-- [이승준] 관리자, 답변이 있을 때, 삭제 기능 사용가능 -->
							<c:if test="${(loginUser.userLevel == 3)}">
								<td style="text-align:center;"><a class="btn btn-primary"  href="removeQnaComment?qnaNo=${qna.qnaNo}">삭제</a></td>
							</c:if>
						</tr>
				</c:if>
			</table>
		</div>
	</section>
	<!-- [이승준] 본문 QnA One 답변 부분 - END -->
	
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