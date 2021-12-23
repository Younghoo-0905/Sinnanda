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
	
	<title>내가 작성한 QnA 상세보기 페이지</title>
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
						<h2>${loginUser.member.memberName}님의 QnA</h2>
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<section id="startBoard" class="ftco-section testimony-section bg-light">
		 <div class="container">
	    	<span class="subheading"><a href="myQnaList">내가 작성한 Q&A</a> > 상세보기</span>
			<h1><strong>내가 작성한 문의 상세보기</strong></h1>
			
			<!-- 글작성자의 수정, 삭제 버튼 -->
			<div style="text-align:right;">
				<c:if test="${qna.memberNo == loginUser.member.memberNo}">
					<a class="btn btn-primary" href="/member/modifyQna?qnaNo=${qna.qnaNo}">문의 수정</a>
					<a class="btn btn-primary" href="/removeQna?qnaNo=${qna.qnaNo}">문의 삭제</a>
				</c:if>
			</div>
			
			<table class="table table-board" style="width: 100%;">
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
					<td style="width: 60%;">${qna.memberName}</td>
					<th style="width: 100px; text-align:center;">작성일</th>
					<td style="width: 30%;">${qna.createDate}</td>
				</tr>
				<tr>
					<th style="text-align:center;">내용</th>
					<td colspan="3">${qna.qnaContent}</td>
				</tr>
			</table>
		</div>
	</section>
	<!-- 본문 My QnA One 부분 - END -->
	
	<!-- 본문 My QnA One 답변 부분 - START -->
	<section class="ftco-section services-section bg-light">
		<div class="container">
			<h2><strong>관리자 답변</strong></h2>
			
			<table class="table table-board" style="width: 100%;">
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
							<td>${qna.qnaComments.qnaCommentContent}</td>
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