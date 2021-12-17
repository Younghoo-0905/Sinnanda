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
    
	<title>회원 리스트</title>
</head>
<body>
	<!-- [이승준] 상단 내비바 - START -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="adminPage?adminNo=${loginUser.admin.adminNo}">신난다</a>
			
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
	<!-- [이승준] 상단 내비바 - END -->
	
	<!-- [이승준] 상단 이미지 배너 - START -->
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>회원 정보<br></strong> </h1>
					<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"></p>
				</div>
			</div>
		</div>
	</div>
    <!-- [이승준] 상단 이미지 배너 - END -->
    
    <!-- [이승준] 본문 QnA 목록 부분 - START -->
    <section class="ftco-section testimony-section bg-light">
	    <div class="container">

			<h1><strong>회원 리스트</strong></h1>
			<div class="container2">
				<select id="memberActive" name="memberActive" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px;">
					<option value="">선택</option>
					<option value="memberList?memberActive=1">활성</option>
					<option value="memberList?memberActive=0">비활성</option>
				</select>
			</div>
			
			<table class="table table-board" style="width: 100%;">
				<tr style="text-align:center">
					<th width="5%">번호</th>
					<th width="10%">아이디</th>
					<th width="10%">비번</th>
					<th width="10%">회원 이름</th>
					<th width="10%">회원 나이</th>
					<th width="10%">회원 번호</th>
					<th width="10%">회원 이메일</th>
					<th width="10%">활성 여부</th>
					<th width="15%" >수정일</th>
				</tr>
				<c:forEach items="${memberList}" var="member">
					<tr>
						<td style="text-align:center">${member.memberNo}</td>
						<td>
							<a href="admin/adminOne?adminNo=${member.memberNo}">${member.memberId}</a>
						</td>
						<td style="text-align:center">${member.memberPw}</td>
						<td style="text-align:center">${member.memberName}</td>
						<td style="text-align:center">${member.memberAge}</td>
						<td style="text-align:center">${member.memberTel}</td>
						<td style="text-align:center">${member.memberEmail}</td>
						<c:choose>
							<c:when test="${member.memberActive == 0}"> 
								
								<td style="text-align:center">
									<button type="button" class="btn btn-primary" style="float: right; margin-top: auto;"  onclick="return chk_form()">활성화 전환</button>
								</td>
								
							</c:when>
							<c:when test="${member.memberActive == 1}">
								<td style="text-align:center">
									<input type ="hidden" readonly>
								</td>
							</c:when>
						</c:choose>
						<td style="text-align:center">
							<fmt:parseDate value="${member.updateDate}" var="updateDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${updateDate}" pattern="yy/MM/dd HH:mm"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			
			<!-- [윤경환] 본문 - 내용 - 페이징 부분 -->
			<!-- Paging -->			
			<div class="row mt-5">
		    	<div class="col text-center">
		            <div class="block-27">
						<ul>
							<!-- '이전' 버튼 -->
							<c:if test="${beginRow > (ROW_PER_PAGE * 10)}">
								<li><a href="memberList?currentPage=${pageNo-1}&memberActive=${memberActive}">&lt;</a></li>
							</c:if>
							
							<!-- Page 번호 -->
							<c:set var="doneLoop" value="false"></c:set>
							<c:forEach var="i" begin="${pageNo}" end="${pageNo + 9}">
							
								<!-- Page 숫자 10개 출력 -->
								<c:if test="${not doneLoop}">
									<c:choose>
										<c:when test="${currentPage == i}">				
											<li class="active"><span>${i}</span></li>
										</c:when>
					    				<c:otherwise>
											<li><a href="memberList?currentPage=${i}&memberActive=${memberActive}">${i}</a></li>	
										</c:otherwise>		
									</c:choose>
									<!-- LastPage이면 다음 페이지 번호를 출력하지 않는다 -->
									<c:if test="${i == lastPage}">
										<c:set var="doneLoop" value="true"></c:set>
									</c:if>
								</c:if>
							</c:forEach>
							
							<!-- '다음' 버튼 -->
							<c:if test="${currentPage + 10 <= lastPage}">
								<li><a href="memberList?currentPage=${pageNo+10}&memberActive=${memberActive}">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- Paging -->
		</div>
	</section>
	<!-- [이승준] 본문 QnA 목록 부분 - END -->
	
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
	
	<!--버튼을 누르면 활성화 시킬지 물어본후 확인 누르면 확인   -->
	<script>

	function chk_form() {
  		alert("활성화 시키겠습니까?");
  		
	
	}	
		
}
	</script>
</body>
</html>