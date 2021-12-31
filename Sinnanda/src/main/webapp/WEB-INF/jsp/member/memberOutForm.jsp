<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- plugins:css -->
		<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/animate.css">
	
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
	<!-- endinject -->
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<title>탈퇴 페이지</title>

</head>
<body>
	<div class="container-scroller">
	
		<!-- [이승준] 마이 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 마이 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 마이 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 마이 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/myPageSidebar.jsp" %>
			<!-- [이승준] 마이 페이지 좌측 사이드바 - END -->
			
			<!-- [이승준] 마이 페이지 본문 - END -->
		      <!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row">
						<h2>회원탈퇴</h2>
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<form id="memberOut" method="post" action="/member/memberOutForm">
		<table class="table table-hover" style="width: 100%;">
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" value = "${loginUser.member.memberId}" readonly></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="memberPw" id="memberPw" placeholder="비밀번호 입력"></td>
			</tr>
			<tr>
				<td>탈퇴 사유</td>
				<td>
					<select id="outReason" name="outReason">
						<option value="기타" selected>기타</option>
						<option value="서비스 불친절">서비스 불친절</option>
						<option value="서비스 이용 불편">서비스 이용 불편</option>
					</select>
				</td>
			</tr>								
		</table>
		<button onclick="return checkPw_form()" type = "button" class="btn btn-primary">탈퇴</button>
	</form>
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
	
	<!-- [유동진] 유효성검사 -->
	<script>
  		var checkedPw = false;
  		
  		$('#memberPw').focusout(function() {
  			let memberPw = $('#memberPw').val();
  			if(memberPw != '') {
	  			$.ajax({
	  				type: 'get', 
	  				url: '/chkPw?memberPw=' + memberPw, 
	  				success: function(checkResult) {  					
	  					if(checkResult == "1") {	//	Pw가 일치할 경우 탈퇴  						
	  						checkedPw = true;
	  					}		
	  					if(checkResult != "1") {	//	Pw가 일치하지 않을 경우 탈퇴불가
	  						
	  						checkedPw = false;
	  					}
	  				}
				})
  			}
  		})
  		
  		function checkPw_form() {
  			if($('#memberPw').val()==''){
				alert("Password를 입력하세요.");
				return false;
			} if(checkedPw == false) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				alert("탈퇴가 성공적으로 이루어졌습니다. 안녕히가세요 뉴_뉴 ㅠㅠ ...");
			}
		
			$('#memberOut').submit();
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
  <!-- End custom js for this page-->
</body>

</html>