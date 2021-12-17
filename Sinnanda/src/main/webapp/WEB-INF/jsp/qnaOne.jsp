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
<body>
	<!-- [이승준] 상단 내비바 - START -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index">신난다</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="/qnaList" class="nav-link">Q&A</a></li>
					<li class="nav-item cta"><a href="/noticeList" class="nav-link">공지사항</a></li>
					<li class="nav-item cta"><a href="/noticeList" class="nav-link">신난다 소개</a></li>
					
				</ul>
				<ul class="navbar-nav mj-auto">
					<!--memberId가 없을때--> 
					<c:if test ="${loginUser == null}">
						<li class="nav-item member"><a href="login" class="nav-link">로그인</a></li>
						<li class="nav-item member"><a href="insertMemberForm" class="nav-link">회원가입</a></li>
					</c:if>
					
					<!--memberId가 있을떄  -->
					<c:if test = "${loginUser != null}">
						<c:if test="${loginUser.userLevel == 1}">
							<li class="nav-item member"><a href="myPage?memberNo=${loginUser.member.memberNo}" class="nav-link">${loginUser.member.memberName}</a></li>
						</c:if>
						<c:if test="${loginUser.userLevel == 2}">
							<li class="nav-item member"><a href="myPage?hostNo=${loginUser.host.hostNo}" class="nav-link">${loginUser.host.hostName}</a></li>
						</c:if>
						<c:if test="${loginUser.userLevel == 3}">
							<li class="nav-item member">
							<a href="myPage?memberNo=${loginUser.admin.adminNo}" class="nav-link">
									<img src="/images/jun_test/adminImg.png" width="20px" height="20px">
									${loginUser.admin.adminName}&nbsp;관리자
								</a>
							</li>
						</c:if>
						<li class="nav-item member"><a href="logout" class="nav-link">로그아웃</a></li>		
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- [이승준] 상단 내비바 - END -->
	
	<!-- [이승준] 상단 이미지 배너 - START -->
	<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>고객지원<br></strong> 최상의 서비스를 위해</h1>
					<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">궁금하신게 있으면 무엇이든 물어봐주세요.</p>
				</div>
			</div>
		</div>
	</div>
    <!-- [이승준] 상단 이미지 배너 - END -->
	
	<!-- [이승준] 본문 QnA One 부분 - START -->
	<section class="ftco-section testimony-section bg-light">
		 <div class="container">
	    	<span class="subheading">Q&A > 상세보기</span>
			<h1><strong>고객문의 상세보기</strong></h1>
			
			<!-- 글작성자의 수정, 삭제 버튼 -->
			<div style="text-align:right;">
				<c:if test="${qna.memberNo == loginUser.member.memberNo}">
					<a class="btn btn-primary" href="modifyQna?qnaNo=${qna.qnaNo}">문의 수정</a>
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
						<table border="1">
							<tr>
								<td>문의 답변하기</td>
							</tr>
							<tr>
								<td><textarea id="qnaCommentContent" name="qnaCommentContent" cols="30" rows="5"></textarea></td>
							</tr>
						</table>
						<button id="addQnaCommentBtn" type="submit">답변하기</button>
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
								<td class="btn btn-primary" style="text-align:center; color: white;"><a href="removeQnaComment?qnaNo=${qna.qnaNo}">삭제</a></td>
							</c:if>
						</tr>
				</c:if>
			</table>
		</div>
	</section>
	<!-- [이승준] 본문 QnA One 답변 부분 - END -->
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">신난다</h2>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
					<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Service</a></li>
							<li><a href="#" class="py-2 d-block">Terms and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Become a partner</a></li>
							<li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
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