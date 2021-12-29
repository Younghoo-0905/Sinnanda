<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
 <head>
    <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
  </head>
  <body>
    
 <!--[이원희] nav start -->
  <%@ include file="/WEB-INF/partials/navbar.jsp" %>
    <!-- END nav -->
    
    <!-- [이원희] 뷰 배경사진-->
    
    <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_5.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="hotel.html">Hotel</a></span> <span>Hotel Single</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">객실 정보</h1>
          </div>
        </div>
      </div>
    </div>
	
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
	        <div class="col-lg-3 sidebar">
	        </div>
	        
	        <div class="col-lg-6">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(images/${room.roomMainImg});"></div>
          				</div>
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(images/hotel-3.jpg);"></div>
          				</div>
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(images/hotel-4.jpg);"></div>
          				</div>
          			</div>
          		</div>
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			<span>Room name</span>
          			<!--[이원희] 객실이름 -->
          			<h2>${room.roomName}</h2>
          			<p class="rate mb-5">
          				<span class="loc"><a href="#"><i class="icon-map"></i> 291 South 21th Street, Suite 721 New York NY 10016</a></span>
          				<p>${room.roomDescription}</p>
          		</div>
          		
          		<!-- 예약 Form -->
          		<form action="/member/addReserve" id="reserveForm" method="post">
          		
          			<!-- member, room 정보 -->
          			<input type="hidden" name="memberNo" value="${loginUser.member.memberNo}">
          			<input type="hidden" name="roomNo" value="${room.roomNo}">
          			
	          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
	          			<h4 class="mb-5">예약 정보</h4>
	          			<div class="fields">
	          				<div class="row">
	          					<!-- 예약 관련 데이터 -->
				              <div class="col-md-6">
					              <div class="form-group">
					                <input type="text" id="checkin_date" name="reserveCheckIn" class="form-control" placeholder="체크인 날짜">
					              </div>
				              </div>
				              <div class="col-md-6">
					              <div class="form-group">
					                <input type="text" id="checkout_date" name="reserveCheckOut" class="form-control" placeholder="체크아웃 날짜">				                
					              </div>
					            </div>
					            <div class="col-md-6">
						            <div class="form-group">
					                <div class="select-wrap one-third">
				                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
				                    <select name="reservePersonnel" id="reservePersonnel" class="form-control">
				                    	<option value="">인원 선택</option>
				                    	<c:forEach var="i" begin="1" end="${room.roomPerson}">
					                      <option value="${i}">${i}</option>
				                    	</c:forEach>
				                    </select>
				                  </div>
					              </div>
				              </div>
				              <div class="col-md-6">
					              <div class="form-group">
					                <input type="text" class="form-control" placeholder="요청사항">
					              </div>
				              </div>
				              
				              <!-- 결제 관련 데이터 -->
				              
					          <div class="col-md-6">
						          <div class="form-group">
					              <div class="select-wrap one-third">
				                  	<div class="icon"><span class="ion-ios-arrow-down"></span></div>
					                  <select name="paymentMethod" id="paymentMethod" class="form-control">
					                  	<option value="">결제 방법 선택</option>
						                <option value="카드">카드</option>
						                <option value="현장 결제">현장 결제</option>
						                <option value="무통장 입금">무통장 입금</option>
					                  </select>
				                  </div>
					              </div>
				              </div>				              
				              <div class="col-md-6">
					              <div class="form-group">
					                <input type="hidden" name="paymentPrice" class="form-control" value="${room.roomPrice}">
					                <input type="text" class="form-control" value="${room.roomPrice} ₩" readonly="readonly">
					              </div>
				              </div>        
					            <div class="col-md-12">
					              <div class="form-group">
					                <button type="button" id="reserveBtn" class="btn btn-primary py-3">예약</button>
					              </div>
				              </div>
			              </div>
			            </div>
	          		</div>
          		</form>
          		<!-- 예약 Form End -->
          		
          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">dirEngine</h2>
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
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  
	<!-- [김영후] 예약 입력 폼 유효성 검사 -->
	<script>
		$('#reserveBtn').click(function(){
			if($('#checkin_date').val() == '' || $('#checkout_date').val() == '') {
				alert("예약 날짜를 선택하세요");
				return false;
			}
		  	if($('#reservePersonnel').val() == '') {
		  		alert("인원을 선택하세요");
		  		return false;
		  	}
		  	$('#reserveForm').submit();
		})
	</script>
  
</body>
</html>