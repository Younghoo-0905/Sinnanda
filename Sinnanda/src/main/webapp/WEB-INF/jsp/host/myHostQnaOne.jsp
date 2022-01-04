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
										<a href="myHostQnaList">사업자 문의 목록</a> > 
										상세보기
									</span>
									
									<h1 style="margin-top: 10px;"><strong>사업자문의 상세보기</strong></h1>
									
									<!-- 사업자 문의 부분 -->
									<div class="container">
										<div style="margin: 10px; text-align:right;">
											<a href="modifyMyHostQna?hostQnaNo=${hostQna.hostQnaNo}" class="btn btn-primary">문의 수정</a>
											<a href="removeMyHostQna?hostQnaNo=${hostQna.hostQnaNo}" class="btn btn-primary">문의 삭제</a>
										</div>
					    			
										<table class="table table-myPage" style="width: 100%;">
											<tr>
												<th style="width: 10%; font-size: 20px; text-align:center;">제목</th>
												<td colspan="3" style="font-size: 20px;">${hostQna.hostQnaTitle}</td>
											</tr>
											<tr>
												<th style="text-align:center;">작성자</th>
												<td style="width: 70%;">${hostQna.hostName}</td>
											</tr>
											<tr>
												<th style="width: 50px; text-align:center;">작성일</th>
												<td>
													<fmt:parseDate value="${hostQna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;">내용</th>
												<td colspan="3">
												<textarea cols="50" rows="20"  disabled>${hostQna.hostQnaContent}</textarea></td>
											</tr>
											<tr>
												<th style="text-align:center;">파일</th>
												<td colspan="3" style="color: gray;">
													<c:if test="${empty hostQna.hostQnaUploadFile}">
														파일 없음
													</c:if>
													${hostQna.hostQnaUploadFile}
												</td>
											</tr>
										</table>
										
										<!-- 구분선 -->
										<hr class="myPage-line">
										
										<!-- 답변 부분 -->
										<h2><strong>관리자 답변</strong></h2>
										
										<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
											<!-- [이승준] 비회원 or 회원, 답변이 없을 때 -->
											<c:if test="${hostQna.hostQnaComments == null}">
												<th style="text-align:center; font-size: 30px;">답변 대기 중</th>
											</c:if>
											
											<!-- [이승준] 공통, 답변이 있을 때 -->
											<c:if test="${hostQna.hostQnaComments != null}">
													<tr>
														<th style="width: 100px; text-align:center;">답변자</th>
														<th style="text-align:center;">답변 내용</th>
														<th style="width: 150px; text-align:center;">작성일</th>
													</tr>
													<tr>
														<td style="text-align:center;">${hostQna.adminName}</td>
														<td>
														<textarea cols="50" rows="3"  disabled>${hostQna.hostQnaComments.hostQnaCommentContent}</textarea></td>
														<td style="text-align:center;">
															<fmt:parseDate value="${hostQna.hostQnaComments.commentDate}" var="commentDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
															<fmt:formatDate value="${commentDate}" pattern="yy/MM/dd HH:mm"/>
														</td>
													</tr>
											</c:if>
										</table>
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