<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Skydash Admin</title>
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
              <form class="pt-3" method="post" action="/insertMember" id="insertMemberForm">
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
                <div class="mb-4">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      I agree to all Terms & Conditions
                    </label>
                  </div>
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="return chkForm()">SIGN UP</a>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Already have an account? <a href="login.html" class="text-primary">Login</a>
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
  
  <!-- 유효성 검사 -->
  	<script>
  		$('#memberId').focusout(function(memberId) {
  			$.ajax({
  				type: 'get', 
  				url: '/chkId?memberId=' + memberId, 
  				success: function(checkResult) {  					
  					if(checkResult == 1) {	//	ID가 중복된 경우
  						$('.idOk').css("display", "inline-block");
  						$('.idUsed').css("display", "none");
  					}		
  					if(checkResult != 1) {	//	ID가 중복되지 않은 경우
  						$('.idOk').css("display", "none");
  						$('.idUsed').css("display", "inline-block");
  					}
  				}
			})
  		})
  		
		function chkForm() {
		if(document.getElementById("memberId").value==''){
			alert("ID를 입력하세요.");
			return false;
		}
		if(document.getElementById("memberPw").value==''){
			alert("Password를 입력하세요.");
			return false;
		}
		if(document.getElementById("memberPw").value!=document.getElementById("memberPw2").value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}		
		if(document.getElementById("memberName").value==''){
			alert("Nickname을 입력하세요.");
			return false;
		}
		if(document.getElementById("memberAge").value==''){
			alert("Age를 입력하세요.");
			return false;
		}
		if(document.getElementById("memberTel").value==''){
			alert("Phone number를 입력하세요.");
			return false;
		}
		if(document.getElementById("memberEmail").value==''){
			alert("Email을 입력하세요.");
			return false;
		}
		
		document.getElementById("insertMemberForm").submit();
		}
	</script>
</body>
</html>