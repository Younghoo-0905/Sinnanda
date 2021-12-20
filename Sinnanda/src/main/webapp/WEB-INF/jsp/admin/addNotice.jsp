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

<title>공지사항 등록</title>
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
	<div class="hero-wrap js-fullheight" style="background-image: url('/images/bg_1.jpg');">
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
    
    <!-- [김영후] 공지 등록 폼 -->
	<section id="startBoard" class="ftco-section testimony-section bg-light">
		<div class="container">
			<h1><strong>공지 등록</strong></h1>
			<form id="addNoticeForm" action="addNotice" method="post">
			
				<!-- 공지 등록 관리자 정보 -->
				<input id="adminNo" name="adminNo" type="hidden" value="${loginUser.admin.adminNo}">
				
				<table class="table table-board" style="width: 100%;">
					<tr>
						<th style="width: 100px; font-size: 20px; text-align:center;">제목</th>
						<td style="font-size: 20px;"><input id="noticeTitle" name="noticeTitle" type="text"></td>
					</tr>
					<tr>
						<th style="text-align:center;">상단 고정</th>
						<td>
							<select id="noticePin" name="noticePin">
								<option value="no">No</option>
								<option value="yes">Yes</option>
							</select>
						</td>
					</tr>
					<tr>
						<th style="text-align:center;">공지 유형</th>
						<td>
							<select id="noticeCategory" name="noticeCategory">
								<option value="기타" selected>기타</option>
								<option value="정보">정보</option>
								<option value="시스템">시스템</option>
								<option value="이벤트">이벤트</option>
								<option value="뉴스">뉴스</option>
							</select>
						</td>
					</tr>
					<tr>
						<th style="padding-top: 150px;padding-bottom: 150px;" width="10%">내용</th>
						<td><textarea id="noticeContent" name="noticeContent" cols="130" rows="11">${notice.noticeContent}</textarea></td>
					</tr>
				</table>
				<button class="btn btn-primary" type="submit" style="float: right; margin-top: auto;">공지 등록</button>
			</form>
	
	<!-- js 소스코드 -->	
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