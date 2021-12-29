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
	
	<title>회원 QnA 페이지</title>
</head>

<body>
	<script>
		// [이승준] 리뷰 답변 입력 여부 확인
		function formCheck(){
			// 내용
			if($("#qnaCommentContent").val() == ""){
				alert("답변 내용을 입력해주세요.");
				$("#qnaCommentContent").focus();
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
			<%@ include file="/WEB-INF/partials/adminPageSidebar.jsp" %>
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - END -->
			
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading">
										<a href="/admin/adminPage?adminNo=${loginUser.admin.adminNo}">메인</a> > 
										<a href="/admin/memberQnaList">회원 문의 목록</a> > 
										상세보기
									</span>
									
									<h1 style="margin-top: 10px;"><strong>회원 문의 상세보기</strong></h1>
									
									<!-- 사업자 문의 부분 -->
									<div class="container">
										
					    			
										<table class="table table-myPage" style="width: 100%;">
											<tr>
												<th style="width: 5%; font-size: 20px; text-align:center;">제목</th>
												<td style="width: 70%;" >${qna.qnaTitle}</td>
												<th style="width: 50px; text-align:center;">비밀문의</th>
												<td>${qna.qnaSecret}</td>
											</tr>
											<tr>
												<th style="text-align:center;">작성자</th>
												<td style="width: 70%;">${qna.memberName}</td>
												<th style="width: 50px; text-align:center;">작성일</th>
												<td>
													<fmt:parseDate value="${qna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;">내용</th>
												<td colspan="3">
												<textarea cols="50" rows="20"  disabled>${qna.qnaContent}</textarea></td>
											</tr>
									
										</table>
										
										<!-- 구분선 -->
										<hr class="myPage-line">
										
										<!-- 답변 부분 -->
										<h2><strong>관리자 답변</strong></h2>
										
										
											<!-- [윤경환] 비회원 or 회원, 답변이 없을 때 -->
										<c:if test="${qna.qnaComments.qnaCommentContent == null}">
											<form onsubmit="return formCheck()" action="/admin/addMemberQnaComment" method="post">
											
													<input type ="hidden" id="adminNo" name ="adminNo" value ="${loginUser.admin.adminNo}">
													<input type ="hidden" id="qnaNo" name ="qnaNo" value ="${qna.qnaNo}">
												<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
														<tr>
															<th style="width: 30%; text-align:center;">내용</th>
															<td><textarea id="qnaCommentContent" name="qnaCommentContent" cols="100%" rows="5"></textarea></td>
															<td><button class="btn btn-primary" type="submit">답변하기</button></td>
														</tr>			
													</table>
												</form>
											</c:if>
											
											
											<table class="table table-myPage" style="width: 100%; margin-bottom: 50px;">
											<!-- [이승준] 공통, 답변이 있을 때 -->
											<c:if test="${qna.qnaComments.qnaCommentContent != null}">
													<tr>
														<th style="width: 100px; text-align:center;">답변자</th>
														<th style="text-align:center;">답변 내용</th>
														<th style="width: 150px; text-align:center;">작성일</th>
													</tr>
													<tr>
														<td style="text-align:center;">${qna.qnaComments.adminNo}</td>
														<td>
														<textarea cols="50" rows="3"  disabled>${qna.qnaComments.qnaCommentContent}</textarea></td>
														<td style="text-align:center;">
															<fmt:parseDate value="${qna.qnaComments.commentDate}" var="commentDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
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
	<%@ include file="/WEB-INF/partials/myPageFooter.jsp" %>
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