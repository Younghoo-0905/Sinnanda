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
	
	<title>사업자 숙소 페이지</title>
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
									<span class="subheading" style="margin-left: 10px;">
										<a href="hostPage?hostNo=${loginUser.host.hostNo}">메인</a> > 
										<a href="myAccomList">숙소 목록</a> > 
										숙소 상세보기
									</span>
									
									<h1 style="margin-top: 10px;"><strong>사업자 숙소 상세보기</strong></h1>
									
									<div class="container">
										<table class="table table-myPage" style="width: 100%;">
											<tr>
												<th style="width: 15%;">숙소 번호</th>
												<td>${accom.accomNo}</td>
											</tr>
											<tr>
												<th>숙소명</th>
												<td>${accom.accomName}</td>
											</tr>
											<tr>
												<th>적용 등급</th>
												<td>${accom.commissionName}</td>
											</tr>
											<tr>
												<th>설명 요약</th>
												<td>${accom.accomDescription}</td>
											</tr>
											<tr>
												<th>설명 원본</th>
												<td>${accom.accomDescriptionLong}</td>
											</tr>
											<tr>
												<th>숙소 이미지</th>
												<td>${accom.accomImg}</td>
											</tr>
											<tr>
												<th>방 개수</th>
												<td>${accom.roomCount}</td>
											</tr>
											<tr>
												<th>주소</th>
												<td>${accom.accomAddress.addressInfo}</td>
											</tr>
											<tr>
												<th>등록일</th>
												<td>
													<fmt:parseDate value="${accom.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
												</td>
											</tr>
										</table>
										
										<!-- 구분선 -->
										<hr class="myPage-line">
										
										<!-- 답변 부분 -->
										<h2><strong>관리자 답변</strong></h2>
										
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