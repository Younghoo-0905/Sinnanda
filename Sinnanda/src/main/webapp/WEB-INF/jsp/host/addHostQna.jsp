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
	
	<title>사업자 QnA 페이지</title>
</head>

<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery 실행 -->
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>		
		// [이승준] Qna 내용 입력 여부 확인
		function formCheck(){
			// 제목
			if($("#hostQnaTitle").val() == ""){
				alert("제목을 입력해주세요.");
				$("#hostQnaTitle").focus();
				return false;
			}
			// 카테고리
			if($("#hostQnaCategory").val() == ""){
				alert("카테고리를 선택해주세요.");
				$("#hostQnaCategory").focus();
				return false;
			}
			// 내용
			if($("#hostQnaContent").val() == ""){
				alert("내용을 입력해주세요.");
				$("#hostQnaContent").focus();
				return false;
			}
		}
	</script>
	
	
	<div class="container-scroller">
	
		<!-- [이승준] 호스트 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 호스트 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 호스트 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/hostPageSidebar.jsp" %>
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - END -->
			
			<!-- [이승준] 호스트 페이지 본문 - END -->
		      <!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading">
										<a href="hostPage?hostNo=${loginUser.host.hostNo}">메인</a> > 
										<a href="myHostQnaList">사업자 문의 목록</a> > 
										문의사항 작성
									</span>
									
									<h1 style="margin-top: 10px;"><strong>사업자문의 작성</strong></h1>
									
									<div class="container" style="margin-top: 20px;">										
										<form onsubmit="return formCheck()" id="addHostQnaForm" action="addHostQna" method="post">
											<input id="hostNo" name="hostNo" type="hidden" value="${loginUser.host.hostNo}">
											
											<table class="table table-myPage" style="width: 100%;">
												<tr>
													<th style="width:15%;">제목</th>
													<td style="text-align:left;">
														<input id="hostQnaTitle" name="hostQnaTitle" type="text" class="form-control form-control-lg">
													</td>
												</tr>
												<tr>
													<th>문의유형</th>
													<td style="width:40%;">
														<select id="hostQnaCategory" name="hostQnaCategory">
															<option value="">선택</option>
															<option value="기타 문의">기타 문의</option>
															<option value="이용 문의">이용 문의</option>
															<option value="시스템 문의">시스템 문의</option>
															<option value="숙소 추가">숙소 추가</option>
															<option value="숙소 수정">숙소 수정</option>
															<option value="숙소 삭제">숙소 삭제</option>
															<option value="객실 추가">객실 추가</option>
															<option value="객실 수정">객실 수정</option>
															<option value="객실 삭제">객실 삭제</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>문의 내용</th>
													<td><textarea id="hostQnaContent" name="hostQnaContent" rows="20" class="form-control form-control-lg"></textarea></td>
												</tr>
												<tr>
													<th>파일 업로드</th>
													<td>
														<input id="hostQnaUploadFile" name="hostQnaUploadFile" type="file">
													</td>
												</tr>
											</table>
											
											<div style="margin: 20px; text-align:right;">
												<button id="" class="btn btn-primary" type="submit">문의 추가</button>
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