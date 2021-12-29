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

<title>공지사항 상세조회</title>
</head>
<body onload="toBoardScroll()">

	<!-- 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>
		// 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 200);
		}
	</script>
	
	<!-- 상단 내비바 - START -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index">신난다</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item cta"><a href="/qnaList" class="nav-link">Q&A</a></li>
					<li class="nav-item active"><a href="/noticeList" class="nav-link">공지사항</a></li>
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
	<!-- 상단 내비바 - END -->
	
	<!-- 상단 이미지 배너 - START -->
	<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>공지<br></strong> 새로운 소식들</h1>
					<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">신난다 소식은 여기서 확인하세요</p>
				</div>
			</div>
		</div>
	</div>
    <!-- 상단 이미지 배너 - END -->
    
    <!-- [김영후] 공지 상세보기 -->
	<section id="startBoard" class="ftco-section testimony-section bg-light">
		 <div class="container">
			<h1><strong>공지 상세보기</strong></h1>
						
			<table class="table table-board" style="width: 100%;">
				<tr>
					<th style="width: 100px; font-size: 20px; text-align:center;">제목</th>
					<td style="font-size: 20px;">${notice.noticeTitle}</td>
					<th style="width: 100px; padding-top: 20px; text-align:center;">공지유형</th>
					<td style="padding-top: 20px;">${notice.noticeCategory}</td>
				</tr>
				<tr>
					<th style="text-align:center;">작성자</th>
					<td style="width: 60%;">${notice.adminName}</td>
					<th style="width: 100px; text-align:center;">작성일</th>
					<td>
						<fmt:parseDate value="${notice.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
						<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
					</td>	
				</tr>
				<tr>
					<th style="padding-top: 150px;padding-bottom: 150px;" width="10%">내용</th>
					<td>${notice.noticeContent}</td>
				</tr>
			</table>
			
			
		</div>			
	</section>
	<!-- [김영후] 공지 상세보기 END -->	
	
	<!-- 하단 Footer - SATRT -->
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
	<!-- 하단 Footer -->
	
	<!-- js 소스코드 -->
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