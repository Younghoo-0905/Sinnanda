<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- plugins:css -->
	<link rel="stylesheet" href="/skydash/vendors/feather/feather.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="/skydash/vendors/css/vendor.bundle.base.css">
	
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<link rel="stylesheet" href="/skydash/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="/skydash/js/select.dataTables.min.css">
	
	<!-- End plugin css for this page -->
	
	<!-- inject:css -->
	<link rel="stylesheet" href="/skydash/css/vertical-layout-light/style.css">
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
		
	<!-- 지도 API 관련 태그 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=882ef0b6751c864ad60f045a82f613ae&libraries=services"></script>	
	<!-- 지도 API 관련 태그 -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<style>
		.PwOk, .newPwOk{
			color: #6A82FB; 
			display: none;
		}
		.PwNo, .newPwNo{
			color: red; 
			display: none;
		}
	</style>
	
	<title>사업자 정보수정</title>
</head>

<body>
	
	<div class="container-scroller">
	
		<!-- [이승준] 호스트 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 호스트 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 호스트 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/hostPageSidebar.jsp" %>
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - END -->
			
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading">
										<a href="/host/hostPage?hostNo=${loginUser.host.hostNo}">메인</a> > 
										<a href="/host/myHostInfo?hostNo=${loginUser.host.hostNo}">내 정보</a> > 
										사업자 정보수정
									</span>
									
									<h1 style="margin-top: 10px;"><strong>내 사업자 정보</strong></h1>
									
									<!-- 본문 -->
									<div class="container">
					    				<form class="pt-3" method="post" action="modifyHost" id="modifyHostForm">
											<table class="table table-myPage">
												<tr>
													<th style="width: 5%; text-align:center;">사업자 번호</th>
													<td>${host.hostNo}</td>
												</tr>
												<tr>
													<th style="text-align:center;">사업자 ID</th>
													<td>${host.hostId}</td>
												</tr>
												<tr>
													<th style="text-align:center;">사업자 이름</th>
													<td><input type="text" id="hostName" name="hostName" class="form-control" value="${host.hostName}"></td>
												</tr>
												<tr>
													<th style="text-align:center;">전화번호</th>
													<td><input type="text" id="hostTel" name="hostTel" class="form-control" value="${host.hostTel}"></td>
												</tr>
												<tr>
													<th>주소</th>
													<td><input type="text" id="addressInfo" name="addressInfo" class="form-control" value="${host.hostAddress.addressInfo}" onclick="execDaumPostcode()"></td>
												</tr>
												<tr>
													<td colspan="2">
														<div id="map" style="width:length;height:300px;margin-top:10px;display:none"></div>
													</td>
												</tr>
												<tr>
													<th>상세 주소</th>
													<td><input type="text" id="addressDetail" name="addressDetail" class="form-control" value="${host.hostAddress.addressDetail}"></td>
												</tr>
												<tr>
													<th style="width: 5%; text-align:center;">비밀번호 확인</th>
													<td>
														<input type="password" id="hostPw" name="hostPw" class="form-control" placeholder="확인용 비밀번호">
														<div style="line-height: 40px;">
															&nbsp; <span class="PwOk">PW 확인 완료</span>
															&nbsp; <span class="PwNo">PW를 정확히 입력하세요.</span>
														</div>
													</td>
												</tr>
												<tr>
													<th style="text-align:center;">가입일</th>
													<td>${host.createDate}</td>
												</tr>
											</table>
											
											<div style="text-align:center; margin-top: 30px;">
												<a class="btn btn-primary" onclick="return check_form()">변경하기</a>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/myPageFooter.jsp" %>
	<!-- [이승준] 하단 Footer - END -->

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		    mapOption = {
		        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.537187, 127.005476),
		    map: map
		});
		
		
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            var addr = data.address; // 최종 주소 변수
		
		            // 주소 정보를 해당 필드에 넣는다.
		            document.getElementById("addressInfo").value = addr;
		            // 주소로 상세 정보를 검색
		            geocoder.addressSearch(data.address, function(results, status) {
		                // 정상적으로 검색이 완료됐으면
		                if (status === daum.maps.services.Status.OK) {
		
		                    var result = results[0]; //첫번째 결과의 값을 활용
		
		                    // 해당 주소에 대한 좌표를 받아서
		                    var coords = new daum.maps.LatLng(result.y, result.x);
		                    // 지도를 보여준다.
		                    mapContainer.style.display = "block";
		                    map.relayout();
		                    // 지도 중심을 변경한다.
		                    map.setCenter(coords);
		                    // 마커를 결과값으로 받은 위치로 옮긴다.
		                    marker.setPosition(coords)
		                }
		            });
		        }
		    }).open();
		}
		
		//	중복검사 여부 표시
		var checkedPw = false;
		
		$('#hostPw').focusout(function() {
			let hostPw = $('#hostPw').val();
			if(hostPw != '') {
	  			$.ajax({
	  				type: 'get', 
	  				url: '/checkHostPw?hostPw=' + hostPw, 
	  				success: function(checkResult) {
	  					if(checkResult != "1") {	//	ID가 중복된 경우 (가입불가)
	  						//	중복된 ID 표시
	  						$('.PwOk').css("display", "none");
	  						$('.PwNo').css("display", "inline-block");
	  						checkedPw = false;
	  					}		
	  					if(checkResult == "1") {	//	ID가 중복되지 않은 경우 (가입가능)
	  						//	사용 가능한 ID 표시
	  						$('.PwOk').css("display", "inline-block");
	  						$('.PwNo').css("display", "none");
	  						checkedPw = true;
						}
					}
				})
			}
		})
  		
		function check_form() {
			if(checkedPw == false) {
				alert("PW를 입력해주세요.");
				return false;
			}
			if($('#hostName').val()==''){
				alert("이름을 입력하세요.");
				return false;
			}
			if($('#hostTel').val()==''){
				alert("번호를 입력하세요.");
				return false;
			}
			if($('#addressInfo').val()==''){
				alert("주소를 입력하세요.");
				return false;
			}
			if($('#addressDetail').val()==''){
				alert("상세주소를 입력하세요.");
				return false;
			}
			
			$('#modifyHostForm').submit();
		}
	</script>
	

	<!-- plugins:js -->
	<script src="/vendors/js/vendor.bundle.base.js"></script>
	
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="/vendors/chart.js/Chart.min.js"></script>
	<script src="/vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="/js/dataTables.select.min.js"></script>
	
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="/js/off-canvas.js"></script>
	<script src="/js/hoverable-collapse.js"></script>
	<script src="/js/template.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/todolist.js"></script>
	
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="/js/dashboard.js"></script>
	<script src="/js/Chart.roundedBarCharts.js"></script>
</body>
</html>