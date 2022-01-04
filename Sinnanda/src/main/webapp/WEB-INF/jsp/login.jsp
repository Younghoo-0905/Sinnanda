<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>로그인</title>
	<!-- plugins:css -->
	<link rel="stylesheet" href="/skydash/vendors/feather/feather.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="/skydash/vendors/css/vendor.bundle.base.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<link rel="stylesheet" href="/skydash/css/vertical-layout-light/style.css">
	<!-- endinject -->
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
</head>

<!-- 해당 페이지에서 Enter 키를 입력 시 로그인 -->
<body onkeydown="javascript:onEnterLogin();">
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<!-- [이승준] 로그인 본문 - 브랜드 로고 부분 -->
							<div class="brand-logo" style="text-align: center;">
								<a href="index"><img src="/images/logo/logo_myPage.svg" alt="logo"></a>
							</div>
							
							<h4 style="text-align: center; margin-bottom: 20px;">신난다에 오신 것을 환영합니다!</h4>
							<h6 class="font-weight-light">ID와 PW를 입력해주세요.</h6>
							
							<!-- [이승준] 로그인 본문 - 로그인 입력 폼 -->
							<form class="pt-3" id="loginForm" action="login" method="post">
								<div class="form-group">
									<input type="email" class="form-control form-control-lg" name ="userId" id="userId" placeholder="Username">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg" name="userPw" id="userPw" placeholder="Password">
								</div>
								<div class="mt-3">
									<button  onclick="return chk_form()" type="button" class="btn btn-block btn-primary btn-lg" style="font-size: 18px;">로그인</button>
									<!-- <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="return chk_form()">로그인</a> -->
								</div>
								<div class="my-2 d-flex justify-content-between align-items-center">
									<div class="form-check">
										<label class="form-check-label text-muted">
										<input type="checkbox" class="form-check-input">
										로그인 상태 유지
										</label>
									</div>
								</div>
								<div class="text-center mt-4 font-weight-light">
									<a href="#" class="auth-link text-black">비밀번호 찾기</a>
									|
									<a href="insertMemberForm" class="text-primary">회원가입</a>
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
	<script src="/skydash/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="/skydash/js/off-canvas.js"></script>
	<script src="/skydash/js/hoverable-collapse.js"></script>
	<script src="/skydash/js/template.js"></script>
	<script src="/skydash/js/settings.js"></script>
	<script src="/skydash/js/todolist.js"></script>
  <!-- endinject -->
	<script>
		// 입력사항 확인
		function chk_form() {
			if(document.getElementById("userId").value==''){
				alert("아이디를 입력해주십시오.");
				return false;
			}
			if(document.getElementById("userPw").value==''){
				alert("비밀번호를 입력해주십시오.");
				return false;
			}
			
			document.getElementById("loginForm").submit();
		}
		
		// Enter 키 로그인
		function onEnterLogin(){
			var keyCode = window.event.keyCode;
			
			if (keyCode == 13) {
				loginForm.submit();
			}
		}
	</script>
</body>
</html>