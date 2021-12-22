<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Sinnanda 회원가입</title>
	<!-- plugins:css -->
	<link rel="stylesheet" href="../../vendors/feather/feather.css">
	<link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
	<!-- endinject -->
	<link rel="shortcut icon" href="../../images/favicon.png" />
	<!-- 지도 API 관련 태그 -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=882ef0b6751c864ad60f045a82f613ae&libraries=services"></script>	
	<!-- 지도 API 관련 태그 -->
	<style>
		.idOk
		{
			color: #6A82FB; 
			display: none;
		}
		.idUsed
		{
			color: red; 
			display: none;
		}
	</style>	
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
              </div>
              <h4>New here?</h4>
              <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
          <!-- 회원 가입 폼 -->
              <form class="pt-3" method="post" action="insertMember" id="insertMemberForm">
                <div class="form-group text-center">
                  <input type="text" class="form-control form-control-lg" name="memberId" id="memberId" placeholder="UserID">
                  <span class="idOk">사용 가능한 ID입니다</span>
                  <span class="idUsed">중복된 ID입니다</span>
                </div>
               <div class="form-group">
                  <input type="password" class="form-control form-control-lg" name="memberPw" id="memberPw" placeholder="Password">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="memberPw2" placeholder="Repeat Password">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="memberName" id="memberName" placeholder="Nickname">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="memberAge" id="memberAge" placeholder="Age">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="memberTel" id="memberTel" placeholder="Phone number  ex) 010-0000-0000">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" name="memberEmail" id="memberEmail" placeholder="Email">
                </div>                
                <div class="form-group">
	                <input type="text" class="form-control form-control-lg" name="addressDetail" id="address" placeholder="Search address" onclick="execDaumPostcode()">
					<div id="map" style="width:length;height:300px;margin-top:10px;display:none"></div>
                </div>
            <!-- 회원 가입 값 입력 END -->
                <div class="mb-4">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      I agree to all Terms & Conditions
                    </label>
                  </div>
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="return check_form()">SIGN IN</a>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Already have an account? <a href="login" class="text-primary">Login</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->
  
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
		                document.getElementById("address").value = addr;
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
  		
  		$('#memberId').focusout(function() {
  			let memberId = $('#memberId').val();
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
  		
		function check_form() {
			if($('#memberId').val()==''){
				alert("ID를 입력하세요.");
				return false;
			}
			if(checkedId == false) {
				alert("ID 중복을 확인하세요.")
				return false;
			}
			if($('#memberPw').val()==''){
				alert("Password를 입력하세요.");
				return false;
			}
			if($('#memberPw').val() != $('#memberPw2').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}		
			if($('#memberName').val()==''){
				alert("Nickname을 입력하세요.");
				return false;
			}
			if($('#memberAge').val()==''){
				alert("Age를 입력하세요.");
				return false;
			}
			if($('#memberTel').val()==''){
				alert("Phone number를 입력하세요.");
				return false;
			}
			if($('#memberEmail').val()==''){
				alert("Email을 입력하세요.");
				return false;
			}
		
			$('#insertMemberForm').submit();
		}
	</script>
</body>
</html>