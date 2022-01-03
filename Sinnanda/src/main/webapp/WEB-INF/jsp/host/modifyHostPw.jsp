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
	
	<title>사업자 정보 페이지</title>
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
										<a href="hostPage?hostNo=${loginUser.host.hostNo}">메인</a> > 
										<a href="myHostInfo?hostNo=${loginUser.host.hostNo}">내 정보</a> > 
										비밀번호 변경
									</span>
									
									<h1 style="margin-top: 10px;"><strong>비밀번호 변경</strong></h1>
									
									<!-- 본문 -->
									<div class="container">
										<form class="pt-3" method="post" action="modifyHostPw" id="modifyHostPwForm">
											<table class="table table-myPage">
												<tr>
													<th style="width: 15%; text-align:center;">기존 비밀번호</th>
													<td>
														<input type="password" id="hostPw" class="form-control" placeholder="현재 비밀번호">
														<div style="line-height: 40px;">
															&nbsp; <span class="PwOk">PW 확인 완료</span>
															&nbsp; <span class="PwNo">PW를 정확히 입력하세요.</span>
														</div>
													</td>
												</tr>
												<tr>
													<th style="text-align:center;">새 비밀번호</th>
													<td><input type="password" id="newHostPw1" name="newHostPw1" class="form-control" placeholder="새 비밀번호"></td>
												</tr>
												<tr>
													<th style="text-align:center;">비밀번호 확인</th>
													<td>
														<input type="password" id="newHostPw2" name="newHostPw2" class="form-control" placeholder="새 비밀번호 확인">
														<div style="line-height: 40px;">
															&nbsp; <span class="newPwOk">PW가 일치합니다.</span>
															&nbsp; <span class="newPwNo">PW가 일치하지 않습니다.</span>
														</div>
													</td>
												</tr>
											</table>
											
											<div style="text-align:center; margin-top: 30px;">
												<a class="btn btn-primary" onclick="return check_form()">비밀번호 변경</a>
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
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->
	
	<script type="text/javascript">
		//	중복검사 여부 표시
		var checkedId = false;
		
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
	  						checkedId = false;
	  					}		
	  					if(checkResult == "1") {	//	ID가 중복되지 않은 경우 (가입가능)
	  						//	사용 가능한 ID 표시
	  						$('.PwOk').css("display", "inline-block");
	  						$('.PwNo').css("display", "none");
	  						checkedId = true;
						}
					}
				})
			}
		})
		
		// PW 일치 여부 표시
  		$('#newHostPw2').focusout(function() {
  			if(($('#newHostPw1').val() == '') || ($('#newHostPw1').val() != $('#newHostPw2').val())){
				$('.newPwOk').css("display", "none");
				$('.newPwNo').css("display", "inline-block");
				return false;
			} else {
				$('.newPwOk').css("display", "inline-block");
				$('.newPwNo').css("display", "none");
			}
  		})
		
  		function check_form() {
			if(checkedId == false) {
				alert("기존 PW 확인하세요.");
				return false;
			}
			if($('#hostPw').val()==''){
				alert("기존 PW를 입력하세요.");
				return false;
			}
			if($('#newHostPw1').val()==''){
				alert("새로운 PW를 입력하세요.");
				return false;
			}
			if($('#newHostPw2').val()==''){
				alert("확인용 새로운 PW를 입력하세요.");
				return false;
			}
			if($('#newHostPw1').val() != $('#newHostPw2').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			if($('#newHostPw1').val() == $('#newHostPw2').val()){
				$('#modifyHostPwForm').submit();
			}
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