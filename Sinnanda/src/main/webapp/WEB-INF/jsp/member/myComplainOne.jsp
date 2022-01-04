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
	<!-- endinject -->
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
	
	<title>커뮤니티 페이지</title>
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
										<a href="myComplainList">내 컴플레인 목록</a> >
										상세보기
									</span>
									
									<h1 style="margin-top: 10px;"><strong>내가 작성한 컴플레인 상세보기</strong></h1>
									
									<div class="container" >
										<div style="text-align:right; margin: 20px;">
											<a class="btn btn-primary" href="#">컴플레인 수정</a>
											<a class="btn btn-primary" href="#">컴플레인 삭제</a>
										</div>
										<table class="table table-myPage">
											<tr>
												<th style="width: 15%;">컴플레인 번호</th>
												<td>${complain.complainNo}</td>
											</tr>
											<tr>
												<th>작성자</th>
												<td>${complain.memberName}</td>
											</tr>
											<tr>
												<th>숙소이름</th>
												<td>${complain.accomName}</td>
											</tr>
											<tr>
												<th>객실이름</th>
												<td>${complain.roomName}</td>
											</tr>
											<tr>
												<th>컴플레인 제목</th>
												<td>${complain.complainTitle}</td>
											</tr>
											<tr>
												<th>컴플레인 내용</th>
												<td><textarea  cols="150" rows="5"  disabled>${complain.complainContent}</textarea></td>
											</tr>
											<tr>
												<th>컴플레인 종류</th>
												<td>${complain.complainCategory}</td>
											</tr>
											<tr>
												<th>작성일</th>
												<td>
													<fmt:parseDate value="${complain.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${createDate}" pattern="yy / MM / dd HH:mm"/>
												</td>
											</tr>								
										</table>
									
									<!-- 구분선 -->
										<hr class="myPage-line">
										
										<div >
											<h2>사업자 답변</h2>
											
											<table class="table table-myPage" style="width: 100%;">
												<!-- 비회원 or 회원, 답변이 없을 때 -->
												<c:if test="${complain.complainCommentContent == null}">
													<th style="text-align:center; font-size: 30px;">답변 없음</th>
												</c:if>
												
												<!-- 공통, 답변이 있을 때 -->
												<c:if test="${complain.complainCommentContent != null}">
														<tr>
															<th style="width: 100px; text-align:center;">답변자</th>
															<th style="text-align:center;">답변 내용</th>
															<th style="width: 150px; text-align:center;">작성일</th>								
														</tr>
														<tr>
															<td style="text-align:center;">${complain.hostName}</td>
															<td style="text-align:center;"><textarea class="form-control" cols="50" rows="3"  disabled>${complain.complainCommentContent}</textarea></td>
															<td style="text-align:center;">${complain.commentDate}</td>
														</tr>
												</c:if>
											</table>
										</div>
									<!-- 본문 QnA One 답변 부분 - END -->
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
  <!-- End custom js for this page-->
</body>

</html>