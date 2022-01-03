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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//[이승준] 답변이 있는 게시글의 수정을 막아주는 JQuery
	var qnaComments = "${qna.qnaComments}";
	$(document).ready(function(){
		if(qnaComments != ""){
			$('input').prop('readonly', true);
			$('textarea').prop('readonly', true);
			$('#qnaSecret').attr('disabled', true);
			$('select').prop('disabled', true);
			$('button').prop('disabled', true);
			alert('답변이 작성된 글은 수정이 불가능합니다.');
		}
	});
	
	// [이승준] Qna 내용 입력 여부 확인
	function formCheck(){
		// 제목
		if($("#qnaTitle").val() == ""){
			alert("제목을 입력해주세요.");
			$("#qnaTitle").focus();
			return false;
		}
		// 내용
		if($("#qnaContent").val() == ""){
			alert("내용을 입력해주세요.");
			$("#qnaContent").focus();
			return false;
		}
	}
</script>
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
										<a href="myQnaOne?qnaNo=${qna.qnaNo}">Q&A 상세보기</a> >
										Q&A 수정
									</span>
									
									<h1 style="margin-top: 10px;"><strong>내가 작성한 Q&A 수정</strong></h1>
										 <div class="container">
									    	
											<form onsubmit="return formCheck()" id="modifyQnaForm" action="modifyQna" method="post">
												<input id="qnaNo" name="qnaNo" type="hidden" value="${qna.qnaNo}">
												<input id="memberNo" name="memberNo" type="hidden" value="${qna.memberNo}">
												
												<table class="table table-myPage" style="width: 100%;">
													<tr>
														<th style="width: 12%; font-size: 20px; text-align:center;">제목</th>
														<td style="font-size: 20px;">
															<input id="qnaTitle" name="qnaTitle" type="text" value="${qna.qnaTitle}">
														</td>
													</tr>
													<tr>
														<th style="text-align:center;">작성자</th>
														<td>${qna.memberName}</td>
													</tr>
													<tr>
														<th>비밀글 여부</th>
														<td>
															<c:if test="${qna.qnaSecret == '일반문의'}">
																<input id="qnaSecret" name="qnaSecret" type="checkbox">
															</c:if>
															<c:if test="${qna.qnaSecret == '비밀문의'}">
																<input id="qnaSecret" name="qnaSecret" type="checkbox" checked="checked">
															</c:if>
														</td>
													</tr>
													<tr>
														<th>카테고리</th>
														<td>${qna.qnaCategory}</td>
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
														<td>
															<textarea id="qnaContent" name="qnaContent" class="form-control" cols="100%" rows="10">${qna.qnaContent}</textarea>
														</td>
													</tr>
												</table>
												
												<div style="text-align:right; margin: 20px;">
													<button id="" class="btn btn-primary" type="submit">문의 수정</button>
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
  <!-- End custom js for this page-->
</body>

</html>