<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<!-- endinject -->
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<title>회원정보 수정</title>
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
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading">
										<a href="myPage?memberNo=${loginUser.member.memberNo}">메인(내정보)</a> >
										정보 수정
									</span>
									
									<h1 style="margin-top: 10px;"><strong>내 정보 수정</strong></h1>
								
									<div class="container">
										<form id = modifyMember method="post" action ="modifyMember">
											<input type = "hidden" name ="memberNo" value = "${loginUser.member.memberNo}">
											
											<table class="table table-myPage">
												<tr>
													<th style="width: 15%; text-align:center;">아이디</th>
													<td><input type = "text" class="form-control" name ="memberId" value = "${loginUser.member.memberId}" readonly></td>
												</tr>
												<tr>
													<th style="text-align:center;">이름</th>
													<td><input type = "text" class="form-control" name ="memberName" value = "${loginUser.member.memberName}" readonly></td>
												</tr>
												<tr>
													<th style="text-align:center;">비밀번호</th>
													<td><input type = "password" class="form-control" name ="memberPw" id = "memberPw"></td>
												</tr>
												<tr>
													<th style="text-align:center;">나이</th>
													<td><input type ="text" class="form-control" name ="memberAge" value = "${loginUser.member.memberAge}"></td>
												</tr>
												<tr>
													<th style="text-align:center;">전화번호</th>
													<td><input type ="text" class="form-control" name ="memberTel" value = "${loginUser.member.memberTel}"></td>
												</tr>
												<tr>
													<th style="text-align:center;">이메일</th>
													<td><input type ="text" class="form-control" name ="memberEmail" value = "${loginUser.member.memberEmail}"></td>
												</tr>
												<tr>
													<th style="text-align:center;">최근 수정일</th>
													<td><input type ="text" class="form-control" name ="updateDate" value = "${loginUser.member.updateDate}" readonly></td>
												</tr>
											</table>
											
											<div style="margin: 10px;">
												<button onclick="return checkPw_form()" type = "button" class="btn btn-primary">수정완료</button>
												<a href="/member/myPage?memberNo=${loginUser.member.memberNo}" class="nav-link">수정취소</a>
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
	  					if(checkResult == "1") {	//	Pw가 일치할 경우 수정  						
	  						checkedPw = true;
	  					}		
	  					if(checkResult != "1") {	//	Pw가 일치하지 않을 경우 수정불가
	  						
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
				alert("수정완료!");
			}
		
			$('#modifyMember').submit();
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