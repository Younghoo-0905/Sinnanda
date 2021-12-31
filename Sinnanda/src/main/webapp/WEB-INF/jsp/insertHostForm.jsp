<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- plugins:css -->
	<link rel="stylesheet" href="/skydash/vendors/feather/feather.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="/skydash/vendors/css/vendor.bundle.base.css">
	
	<!-- inject:css -->
	<link rel="stylesheet" href="/skydash/css/vertical-layout-light/style.css">
	
	<!-- endinject -->
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
	
	<!-- 지도 API 관련 태그 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=882ef0b6751c864ad60f045a82f613ae&libraries=services"></script>	
	<!-- 지도 API 관련 태그 -->
	
	<style>
		.idOk{
			color: #6A82FB; 
			display: none;
		}
		.idUsed{
			color: red; 
			display: none;
		}
		.PwOk{
			color: #6A82FB; 
			display: none;
		}
		.PwNo{
			color: red; 
			display: none;
		}
	</style>
	
	<title>사업자 회원가입</title>
</head>

<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							
							<div class="brand-logo">
								<a href="/index"><img src="/skydash/images/logo.svg" alt="logo"></a>
							</div>
							
							<h4 style="font-weight: bold;">사업자 회원가입</h4>
							
							<!-- 회원 가입 폼 -->
							<form class="pt-3" method="post" action="insertHost" id="insertHostForm">
								<div class="form-group text-center">
									<!-- ID -->
									<div class="input-group mb-3 input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" style="width: 80px;">ID</span>
										</div>
										<input type="text" class="form-control" name="hostId" id="hostId" placeholder="ID">
										<div style="line-height: 40px;">
											&nbsp; <span class="idOk">사용 가능한 ID입니다.</span>
											&nbsp; <span class="idUsed">사용 불가능한 ID입니다.</span>
										</div>
									</div>
									<!-- PW -->
									<div class="input-group mb-3 input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" style="width: 80px;">PW</span>
										</div>
										<input type="password" class="form-control" name="hostPw" id="hostPw" placeholder="비밀번호">
									</div>
									<!-- PW 확인 -->
									<div class="input-group mb-3 input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" style="width: 80px;">PW 확인</span>
										</div>
										<input type="password" class="form-control" name="hostPw2" id="hostPw2" placeholder="비밀번호 확인">
										<div style="line-height: 40px;">
											&nbsp; <span class="PwOk">PW가 일치합니다.</span>
											&nbsp; <span class="PwNo">PW가 일치하지 않습니다.</span>
										</div>
									</div>
									<!-- 사업자 이름 -->
									<div class="input-group mb-3 input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" style="width: 80px;">이름</span>
										</div>
										<input type="text" class="form-control" name="hostName" id="hostName" placeholder="사업자 이름">
									</div>
									<!-- 사업자 전화번호 -->
									<div class="input-group mb-3 input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" style="width: 80px;">전화번호</span>
										</div>
										<input type="text" class="form-control" name="hostTel" id="hostTel" placeholder="전화번호">
									</div>
									<!-- 사업자 주소 -->
									<div class="input-group mb-3 input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" style="width: 80px;">주소</span>
										</div>
										<input type="text" class="form-control" name="addressInfo" id="addressInfo" placeholder="주소 검색" onclick="execDaumPostcode()">
									</div>
									<!-- 사업자 상세주소 -->
									<div class="input-group mb-3 input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" style="width: 80px;">상세주소</span>
										</div>
										<input type="text" class="form-control" name="addressDetail" id="addressDetail" placeholder="상세주소">
									</div>
									
									<div id="map" style="width:length;height:300px;margin-top:10px;display:none"></div>
									
								</div>
								<!-- 사업자 회원 가입 값 입력 END -->
								
								<div class="mt-3">
									<a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="return check_form()">회원가입 완료</a>
								</div>
								<div class="text-center mt-4 font-weight-light">
									아이디를 가지고 계신가요? <a href="/login" class="text-primary">로그인 하기</a>
								</div>
								<br>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- plugins:js -->
	<script src="/skydash/vendors/js/vendor.bundle.base.js"></script>
	<!-- inject:js -->
	<script src="/skydash/js/off-canvas.js"></script>
	<script src="/skydash/js/hoverable-collapse.js"></script>
	<script src="/skydash/js/template.js"></script>
	<script src="/skydash/js/settings.js"></script>
	<script src="/skydash/js/todolist.js"></script>
  
	<!-- [김영후] 유효성 검사 -->
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
		 
  	
  	
  		//	ID칸 focusout 이벤트 -> DB에서 ID 중복검사 후 표시
  		
  		//	중복검사 여부 표시
  		var checkedId = false;
  		
  		$('#hostId').focusout(function() {
  			let memberId = $('#hostId').val();
  			if(memberId != '') {
	  			$.ajax({
	  				type: 'get', 
	  				url: '/chkId?memberId=' + memberId, 
	  				success: function(checkResult) {  					
	  					if(checkResult == "1") {	//	ID가 중복된 경우 (가입불가)
	  						//	중복된 ID 표시
	  						$('.idOk').css("display", "none");
	  						$('.idUsed').css("display", "inline-block");
	  						checkedId = false;
	  					}		
	  					if(checkResult != "1") {	//	ID가 중복되지 않은 경우 (가입가능)
	  						//	사용 가능한 ID 표시
	  						$('.idOk').css("display", "inline-block");
	  						$('.idUsed').css("display", "none");
	  						checkedId = true;
	  					}
	  				}
				})
  			}
  		})
  		
  		// PW 일치 여부
  		$('#hostPw2').focusout(function() {
  			if($('#hostPw').val() != $('#hostPw2').val()){
				$('.PwOk').css("display", "none");
				$('.PwNo').css("display", "inline-block");
				return false;
			} else {
				$('.PwOk').css("display", "inline-block");
				$('.PwNo').css("display", "none");
			}
  		})
  		
		function check_form() {
			if($('#hostId').val()==''){
				alert("ID를 입력하세요.");
				return false;
			}
			if(checkedId == false) {
				alert("ID 중복을 확인하세요.");
				return false;
			}
			if($('#hostPw').val()==''){
				alert("PW를 입력하세요.");
				return false;
			}
			if($('#hostPw').val() != $('#hostPw2').val()){
				alert("PW가 일치하지 않습니다.");
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
		
			$('#insertHostForm').submit();
		}
	</script>
</body>
</html>