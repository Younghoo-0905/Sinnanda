<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	
	<title> 페이지</title>
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
						<h2>${loginUser.member.memberName}님이 작성한 리뷰</h2>
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<section class="ftco-section testimony-section bg-light">
    <div class="container3">
	<h1>내가 작성한 리뷰</h1>
	<div>
		<select id="reviewRecommend" name="reviewRecommend" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px; height:35px;">
			<option value="">선택</option>
			<option value="/member/myReviewList">전체</option>
			<option value="/member/myReviewList?reviewRecommend=보통">보통</option>
			<option value="/member/myReviewList?reviewRecommend=추천">추천</option>
			<option value="/member/myReviewList?reviewRecommend=비추천">비추천</option>
		</select>
	</div>
	<table class="table table-hover" style="width: 100%;">
		<tr>
			<th>이름</th>
			<th>숙소이름</th>
			<th>객실이름</th>
			<th>리뷰내용</th>
			<th>평점</th>
			<th>추천여부</th>
			<th>작성일</th>
		</tr>

		<c:forEach items="${myReviewList}" var="review">
			<tr>
				<td>${loginUser.member.memberName}</td>
				<td>${review.accomName}</td>
				<td>${review.roomName}</td>				
				<td>
					<c:choose>
						<c:when test="${fn:length(review.reviewContent) > 20}">
							<a href="/searchAccomOne?accomNo=${review.accomNo}">
						 		<c:out value="${fn:substring(review.reviewContent,0,20)}"/>...
						 	</a>
						</c:when>
					 	<c:otherwise>
	            			<a href="/searchAccomOne?accomNo=${review.accomNo}"><c:out value="${review.reviewContent}"/></a>
	          			 </c:otherwise>
					</c:choose>
				</td>
				<td>${review.reviewRank}</td>
				<td>${review.reviewRecommend}</td>
				<td>
					<fmt:parseDate value="${review.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
					<fmt:formatDate value="${createDate}" pattern="yy / MM / dd HH:mm"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</section>
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