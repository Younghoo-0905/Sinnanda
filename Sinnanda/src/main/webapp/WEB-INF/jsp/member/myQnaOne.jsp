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
										<a href="myQnaList?memberNo=${loginUser.member.memberNo}">내 Q&A 목록</a> >
										Q&A 상세보기
									</span>
									
									<h1 style="margin-top: 10px;"><strong>내가 작성한 Q&A 상세보기</strong></h1>
									
									<div class="container">
								    	
										<!-- 글작성자의 수정, 삭제 버튼 -->
										<div style="text-align:right; margin: 10px;">
											<c:if test="${qna.memberNo == loginUser.member.memberNo}">
												<a class="btn btn-primary" href="modifyQna?qnaNo=${qna.qnaNo}">문의 수정</a>
												<a class="btn btn-primary" href="removeQna?qnaNo=${qna.qnaNo}">문의 삭제</a>
											</c:if>
										</div>
										
										<table class="table table-myPage" style="width: 100%;">
											<tr>
												<th style="width: 100px; font-size: 20px; text-align:center;">제목</th>
												<td colspan="3" style="font-size: 20px;">
													${qna.qnaTitle}
													<c:if test="${qna.qnaSecret == '비밀문의'}">
														<img src="/images/qna/lockImg.png" width="20px" height="20px">
													</c:if>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;">작성자</th>
												<td>${qna.memberName}</td>
											</tr>
											<tr>
												<th style="width: 7%; text-align:center;">작성일</th>
												<td>
													<fmt:parseDate value="${qna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${createDate}" pattern="yy / MM / dd HH:mm"/>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;">내용</th>
												<td colspan="3"><textarea class="form-control" cols="150" rows="5"  readonly>${qna.qnaContent}</textarea></td>
											</tr>
										</table>
										<!-- 본문 My QnA One 부분 - END -->
								
										<!-- 구분선 -->
										<hr class="myPage-line">
										
										<!-- 본문 My QnA One 답변 부분 - START -->
										<section class="ftco-section services-section bg-light">
											<div class="container">
												<h2><strong>관리자 답변</strong></h2>
												
												<table class="table table-myPage" style="width: 100%;">
													<!-- 비회원 or 회원, 답변이 없을 때 -->
													<c:if test="${qna.qnaComments == null}">
														<th style="text-align:center; font-size: 30px;">답변 없음</th>
													</c:if>
													
													<!-- 관리자, 답변이 없을 때 -->
													<c:if test="${loginUser != null}">
														<c:if test="${(qna.qnaComments == null) && (loginUser.userLevel == 3)}">
															<form id="addQnaCommentForm" action="addQnaComment" method="post">
															<input id="qnaNo" name="qnaNo" type="hidden" value="${qna.qnaNo}">
															<input id="adminNo" name="adminNo" type="hidden" value="${loginUser.admin.adminNo}">
															<table class="table table-board" style="width: 100%;">
																<tr>
																	<th style="width: 150px; font-size: 20px; text-align:center;">
																		문의 답변하기<br><br>
																		<button id="addQnaCommentBtn" type="submit"class="btn btn-primary">답변하기</button>
																	</th>
																	<td><textarea id="qnaCommentContent" name="qnaCommentContent" cols="100" rows="5"></textarea></td>
																</tr>
															</table>
														</form>
														</c:if>
													</c:if>
													
													<!-- 공통, 답변이 있을 때 -->
													<c:if test="${qna.qnaComments != null}">
															<tr>
																<th style="width: 100px; text-align:center;">답변자</th>
																<th style="text-align:center;">답변 내용</th>
																<th style="width: 150px; text-align:center;">작성일</th>
																<!-- 관리자, 답변이 있을 때, 삭제 기능 사용가능 -->
																<c:if test="${(loginUser.userLevel == 3)}">
																	<th style="width: 70px; text-align:center;">삭제</th>
																</c:if>
															</tr>
															<tr>
																<td style="text-align:center;">${qna.adminName}</td>
																<td><textarea class="form-control" cols="50" rows="7"  readonly>${qna.qnaComments.qnaCommentContent}</textarea></td>
																<td style="text-align:center;">${qna.qnaComments.commentDate}</td>
									
																<!-- 관리자, 답변이 있을 때, 삭제 기능 사용가능 -->
																<c:if test="${(loginUser.userLevel == 3)}">
																	<td style="text-align:center;"><a class="btn btn-primary"  href="removeQnaComment?qnaNo=${qna.qnaNo}">삭제</a></td>
																</c:if>
															</tr>
													</c:if>
												</table>
											</div>
										</section>
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