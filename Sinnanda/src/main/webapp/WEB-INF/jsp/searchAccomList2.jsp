<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
    <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="UTF-8">
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
    
    <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_5.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>숙소</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">숙소</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">숙소 유형</h3>
        			
        			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
					<c:if test="${accomCategoryName eq '호텔'}">
						<input type="checkbox" name="accomCategory" value="호텔" checked onclick="getCheckboxValue()"/>호텔<br>
						<input type="checkbox" name="accomCategory" value="모텔" onclick="getCheckboxValue()"/>모텔<br>
						<input type="checkbox" name="accomCategory" value="펜션" onclick="getCheckboxValue()"/>펜션<br>
						<input type="checkbox" name="accomCategory" value="풀빌라" onclick="getCheckboxValue()"/>풀빌라<br>
						<input type="checkbox" name="accomCategory" value="게스트하우스" onclick="getCheckboxValue()"/>게스트하우스<br>
					</c:if>
					
					<c:if test="${accomCategoryName eq '모텔'}">
						<input type="checkbox" name="accomCategory" value="호텔" onclick="getCheckboxValue()"/>호텔<br>
						<input type="checkbox" name="accomCategory" value="모텔" checked onclick="getCheckboxValue()"/>모텔<br>
						<input type="checkbox" name="accomCategory" value="펜션" onclick="getCheckboxValue()"/>펜션<br>
						<input type="checkbox" name="accomCategory" value="풀빌라" onclick="getCheckboxValue()"/>풀빌라<br>
						<input type="checkbox" name="accomCategory" value="게스트하우스" onclick="getCheckboxValue()"/>게스트하우스<br>
					</c:if>
					
					<c:if test="${accomCategoryName eq '펜션'}">
						<input type="checkbox" name="accomCategory" value="호텔" onclick="getCheckboxValue()"/>호텔<br>
						<input type="checkbox" name="accomCategory" value="모텔" onclick="getCheckboxValue()"/>모텔<br>
						<input type="checkbox" name="accomCategory" value="펜션" checked onclick="getCheckboxValue()"/>펜션<br>
						<input type="checkbox" name="accomCategory" value="풀빌라" onclick="getCheckboxValue()"/>풀빌라<br>
						<input type="checkbox" name="accomCategory" value="게스트하우스" onclick="getCheckboxValue()"/>게스트하우스<br>
					</c:if>
					
					<c:if test="${accomCategoryName eq '풀빌라'}">
						<input type="checkbox" name="accomCategory" value="호텔" onclick="getCheckboxValue()"/>호텔<br>
						<input type="checkbox" name="accomCategory" value="모텔" onclick="getCheckboxValue()"/>모텔<br>
						<input type="checkbox" name="accomCategory" value="펜션" onclick="getCheckboxValue()"/>펜션<br>
						<input type="checkbox" name="accomCategory" value="풀빌라" checked onclick="getCheckboxValue()"/>풀빌라<br>
						<input type="checkbox" name="accomCategory" value="게스트하우스" onclick="getCheckboxValue()"/>게스트하우스<br>
					</c:if>
					
					<c:if test="${accomCategoryName eq '게스트하우스'}">
						<input type="checkbox" name="accomCategory" value="호텔" onclick="getCheckboxValue()"/>호텔<br>
						<input type="checkbox" name="accomCategory" value="모텔" onclick="getCheckboxValue()"/>모텔<br>
						<input type="checkbox" name="accomCategory" value="펜션" onclick="getCheckboxValue()"/>펜션<br>
						<input type="checkbox" name="accomCategory" value="풀빌라" onclick="getCheckboxValue()"/>풀빌라<br>
						<input type="checkbox" name="accomCategory" value="게스트하우스" checked onclick="getCheckboxValue()"/>게스트하우스<br>
					</c:if>
					
					<script type="text/javascript" language=javascript>
						function getCheckboxValue()  {
							  // 선택된 목록 가져오기
							  const query = 'input[name="accomCategory"]:checked';
							  const selectedEls = 
							      document.querySelectorAll(query);
							  
							  // 선택된 목록에서 value 찾기
							  let result = '';
							  selectedEls.forEach((el) => {
								  result += el.value + ' ';
							  });
							  
							  // 출력
							  document.getElementById('result').innerText
							    = result;
							}
						
						$(document).ready(function(){
						    $('input[name="accomCategory"]').change(function(){
						        if($('input[name="accomCategory"]').is(":checked")){
						            alert("체크박스 체크했음!");
						        }else{
						            alert("체크박스 체크 해제!");
						        }
						    });
						});
						
					</script>
					
					<div id="result"></div>
					
		             <!-- [이원희] 검색리스트뷰 검색바-->
        			<h3 class="heading mb-4">숙소 상세검색</h3>
        			 <form action="searchList" method="post" class="d-block d-flex" id="searchForm">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" name="accomName" class="form-control" placeholder="숙소아름">
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="" id="" class="form-control" placeholder="Keyword search">
	                      <option value="">지역</option>
	                      <option value="">San Francisco USA</option>
	                      <option value="">Berlin Germany</option>
	                      <option value="">Lodon United Kingdom</option>
	                      <option value="">Paris Italy</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="체크인 날짜">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="체크아웃 날짜">
		              </div>
					<div class="form-group">
		              	
		              	<div class="range-slider">
		              		<div>요금 범위(1박당)</div>
		              		
							<input value="10000" min="0" max="10000000" step="500" type="range"/>
							<input value="5000000" min="5000000" max="10000000" step="500" type="range"/>
								
						</div>
						
						<span>
						
							<input type="number" value="10000" min="0" max="10000000"/>-
							<input type="number" value="5000000" min="5000000" max="10000000"/>
						
						</span>
					</div>
		              <div class="form-group">                                                             
		                <button type="submit" class="search-submit btn btn-primary">검색</button>
		              </div>
		            </div>
	            </form>
        		</div>
        		<!-- 검색바 끝 -->
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">별점 등급</h3>
        			<form method="post" class="star-rating">
							  <div class="form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1">
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
							</form>
        		</div>
          </div>
          <div class="col-lg-9">
          	<div class="row">
          	<c:choose>
	          	<c:when test="${empty accomList}">
			    	검색결과가 없슴.
			    </c:when>
			    <c:otherwise>
		    		<c:forEach items="${accomList}" var="ac" varStatus="status">
						<c:if test="${ac.accomCategoryName eq '모텔'}">
						<div class="col-md-4 ftco-animate">
		    				<div class="destination">
		    					<a href="searchAccomOne?accomNo=${ac.accomNo}" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/${ac.accomImg});">
		    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						
    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<div class="d-flex">
		    							<div class="one">
		    								<!--[이원희] 숙소 이름 -->
		    								<div>
				    							<a href="searchAccomOne?accomNo=${ac.accomNo}">${ac.accomName}</a>
		    								</div>
				    						<!--[이원희] 별 개수  -->
				    						<div style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
 												<c:choose>
	 												<c:when test="${empty accomRankList[status.index]}">
		 												<p style="WIDTH: 0%; PADDING-RIGHT:0px; PADDING-LEFT:0px; BACKGROUND: url(icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
		 												</p>
	 												</c:when>
	 												<c:otherwise>
	 													<p style="WIDTH:${accomRankList[status.index]}%; PADDING-RIGHT:0px; PADDING-LEFT:0px; BACKGROUND: url(icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
		 												</p>
	 												</c:otherwise>
 												</c:choose>
 											</div>
			    						</div>
			    						<div class="two">
			    							<span class="price per-price">$40</span>
		    							</div>
		    						</div>
		    						<p>${ac.accomDescription}</p>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
		    						</p>
		    					</div>
		    				</div>
		    			</div>
		    			</c:if>
					</c:forEach>	
		    	</c:otherwise>
		    </c:choose>
          	</div>
          	<!-- [이원희] 숙소리스트 네비게이션바-->
          	<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		              	<c:choose>
		              		<c:when test="${currentPage eq 1}">
		              			<li><a>&lt;</a></li>
		              		</c:when>
		              		<c:otherwise>
		              			<li><a href="searchAccomList?accomName=${accomName}&accomCategoryName=${accomCategoryName}&currentPage=${currentPage-1}">&lt;</a></li>
		              		</c:otherwise>
		              	</c:choose>
		              	<c:forEach var="page" begin = "1" end="${lastPage}" step="1">
		              		<c:choose>
		              		<c:when test="${currentPage eq page}">
		              			 <li class="active"><span>${page}</span></li>
		              		</c:when>
		              		<c:otherwise>
		              			<li><a href="searchAccomList?accomName=${accomName}&accomCategoryName=${accomCategoryName}&currentPage=${page}">${page}</a></li>
		              		</c:otherwise>
		              	</c:choose>
		              	</c:forEach>
		              	<c:choose>
		              		<c:when test="${currentPage eq lastPage}">
		              			<li><a>&gt;</a></li>
		              		</c:when>
		              		<c:otherwise>
		              			<li><a href="searchAccomList?accomName=${accomName}&accomCategoryName=${accomCategoryName}&currentPage=${currentPage+1}">&gt;</a></li>
		              		</c:otherwise>
		              	</c:choose>
		               
		              </ul>
		            </div>
		          </div>
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
    
  </body>
</html>