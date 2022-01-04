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
	
	<title>사업자 페이지</title>
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
					<!-- [이승준] 메인 페이지 - 신규 컴플레인 -->
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<h3 style="margin-top: 10px;"><strong>신규 컴플레인</strong></h3>
									
									<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
										<span style="line-heigth: 100px;">총 개수 : <strong style="color: red;">${complainListTotalCount}</strong></span>
										<a href="myComplainList" style="float: right; ">목록 보기</a>
									</div>
									
								    <div class="container">
								    	<c:if test="${empty complainList}">
								    		<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
								    			<tr><th style="text-align:center; font-size: 20px;">내용 없음</th></tr>
											</table>
								    	</c:if>
								    	
								    	<c:if test="${!empty complainList}">
								    		<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
											<tr style="text-align:center">
												<th width="7%">번호</th>
												<th width="40%">제목</th>
												<th width="10%">문의유형</th>
												<th width="10%">작성자</th>
												<th width="15%">작성일</th>
											</tr>
											<c:forEach items="${complainList}" var="complain">
												<tr>
													<td style="text-align:center">${complain.complainNo}</td>
													<td>
														<a href="myComplainOne?complainNo=${complain.complainNo}">${complain.complainTitle}</a>
													</td>
													<td style="text-align:center">${complain.complainCategory}</td>
													<td style="text-align:center">${complain.memberName}</td>
													<td style="text-align:center">
														<fmt:parseDate value="${complain.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
														<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
													</td>
												</tr>
											</c:forEach>
											</table>
								    	</c:if>
								    </div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- [이승준] 메인 페이지 - 신규 리뷰 -->
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<h3 style="margin-top: 10px;"><strong>신규 리뷰</strong></h3>
									
									<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
										<span style="line-heigth: 100px;">총 개수 : <strong style="color: red;">${reviewListTotalCount}</strong></span>
										<a href="myReviewList" style="float: right; ">목록 보기</a>
									</div>
									
								    <div class="container">
								    	<c:if test="${empty reviewList}">
								    		<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
								    			<tr><th style="text-align:center; font-size: 20px;">내용 없음</th></tr>
											</table>
								    	</c:if>
								    	
								    	<c:if test="${!empty reviewList}">
								    		<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
											<tr style="text-align:center">
												<th width="7%">번호</th>
												<th>내용</th>
												<th width="8%">별점</th>
												<th width="8%">추천</th>
												<th width="10%">작성자</th>
												<th width="15%">작성일</th>
											</tr>
											<c:forEach items="${reviewList}" var="review">
												<tr>
													<td style="text-align:center">
														<a href="myReviewOne?reviewNo=${review.reviewNo}">${review.reviewNo}</a>
													</td>
													<td>
														<!-- 답변의 유무 표시 -->
														<c:if test="${review.reviewComment.reviewCommentContent != null}">
															<span style="color: #2828CD; font-weight: bold;">[답변 완료]</span>
														</c:if>
														<!-- 리뷰 내용 일부 표시 -->
														<c:choose>
															<%-- 리뷰 내용이 20자가 넘을 경우 --%>
															<c:when test="${fn:length(review.reviewContent) > 20}">
																<%-- 20자까지만 출력 후 '...' 표시 --%>
																<c:out value="${fn:substring(review.reviewContent, 0, 20)}"/>...
															</c:when>
														 	<c:otherwise>
										            			<c:out value="${review.reviewContent}"/>
										          			 </c:otherwise>
														</c:choose>
													</td>
													<td style="text-align:center">${review.reviewRank}</td>
													<td style="text-align:center">${review.reviewRecommend}</td>
													<td style="text-align:center">${review.memberName}</td>
													<td style="text-align:center">
														<fmt:parseDate value="${review.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
														<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
													</td>
												</tr>
											</c:forEach>
											</table>
								    	</c:if>
								    </div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- [이승준] 메인 페이지 - 답변 대기 중인 사업자 Q&A -->
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<h3 style="margin-top: 10px;"><strong>답변이 대기 중인 사업자 Q&A</strong></h3>
									
									<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
										<span style="line-heigth: 100px;">총 개수 : <strong style="color: red;">${hostQnaListTotalCount}</strong></span>
										<a href="myHostQnaList" style="float: right; ">목록 보기</a>
									</div>
									
								    <div class="container">
								    	<c:if test="${empty hostQnaList}">
								    		<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
								    			<tr><th style="text-align:center; font-size: 20px;">내용 없음</th></tr>
											</table>
								    	</c:if>
								    	
								    	<c:if test="${!empty hostQnaList}">
								    		<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
											<tr style="text-align:center">
												<th width="7%">번호</th>
												<th width="40%">제목</th>
												<th width="10%">문의유형</th>
												<th width="10%">작성자</th>
												<th width="10%">작성일</th>
											</tr>
											<c:forEach items="${hostQnaList}" var="hostQna">
												<tr>
													<td style="text-align:center">${hostQna.hostQnaNo}</td>
													<td>
														<a href="myHostQnaOne?hostQnaNo=${hostQna.hostQnaNo}">${hostQna.hostQnaTitle}</a>
													</td>
													<td style="text-align:center">${hostQna.hostQnaCategory}</td>
													<td style="text-align:center">${hostQna.hostName}</td>
													<td style="text-align:center">
														<fmt:parseDate value="${hostQna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
														<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
													</td>
												</tr>
											</c:forEach>
											</table>
								    	</c:if>
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