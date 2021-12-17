<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
<title>관리자 세부사항</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="adminPage?adminNo=${loginUser.admin.adminNo }">신난다</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			
			<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
			
			</ul>
				<ul class="navbar-nav mj-auto">

					<!--memberId가 있을떄  -->
					<c:if test = "${loginUser != null}">
						<c:if test="${loginUser.userLevel == 3}">
							<li class="nav-item member">
							<a class="nav-link">
									<img src="../images/jun_test/adminImg.png" width="20px" height="20px">
									${loginUser.admin.adminName}&nbsp;관리자
								</a>
							</li>
						</c:if>
						<li class="nav-item member"><a href="../logout" class="nav-link">로그아웃</a></li>		
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
		
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>관리자<br></strong>세부 사항</h1>
					<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"></p>
				</div>
			</div>
		</div>
	</div>
		
	
	
	<section class="ftco-section testimony-section bg-light">
	    <div class="container">
	<span class="subheading">관리자 > 관리자 세부보기</span>
	
	
	<h1><strong>관리자 세부사항</strong></h1>
	<table  class="table table-board" style="width: 100%;">
		<tr>
			<td  style="width: 200px; font-size: 20px; text-align:center;">관리자 아이디 :</td>
			<td colspan="3" style="font-size: 20px; text-align:center;">${admin.adminId}</td>
		</tr>
		<tr>
			<td  style="width: 200px; font-size: 20px; text-align:center;">관리자 이름 :</td>
			<td colspan="3" style="font-size: 20px; text-align:center;"> ${admin.adminName}</td>
		</tr>
		<tr>
			<td  style="width: 200px; font-size: 20px; text-align:center;">관리자 직급 :</td>
			<td colspan="3" style="font-size: 20px; text-align:center;" >${admin.adminPosition}</td>
		</tr>
		<tr>
			<td  style="width: 200px; font-size: 20px; text-align:center;">관리자 레벨 :</td>
			<td colspan="3" style="font-size: 20px; text-align:center;">${admin.adminLevel}</td>
		</tr>
		<tr>
			<td  style="width: 200px; font-size: 20px; text-align:center;">수정 날짜 :</td>
			<td colspan="3" style="font-size: 20px; text-align:center;">${admin.updateDate}</td>
		</tr>	
	</table>
	<a class="navbar-brand brand-logo mr-5" href="adminPage?adminNo=${loginUser.admin.adminNo }">메인페이지</a>
	<a class="navbar-brand brand-logo mr-5" href="modifyAdminOne?adminNo=${loginUser.admin.adminNo}">수정페이지</a>
	</div>
</section>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/jquery.timepicker.min.js"></script>
	<script src="../js/scrollax.min.js"></script>
	<script src="../direngine-master/js/google-map.js"></script>
	<script src="../direngine-master/js/main.js"></script>


</body>
</html>