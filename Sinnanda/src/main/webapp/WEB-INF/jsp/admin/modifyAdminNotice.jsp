<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
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

<title>공지사항 수정</title>
</head>
<body>
	
	<div class="container-scroller">
	
		<!-- [이승준] 호스트 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 호스트 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 호스트 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/adminPageSidebar.jsp" %>
	
	<!-- [김영후] 공지 수정 폼 -->
	<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading" style="margin-left: 10px;">공지사항</span>
									<h1 style="margin-top: 10px;"><strong>공지사항 수정</strong></h1>
				 <div class="container">
				 <div class="container2">	
			
			<form action="modifyAdminNotice" method="post">
			
				<!-- 공지, 관리자 정보 -->
				<input id="noticeNo" name="noticeNo" type="hidden" value="${notice.noticeNo}">
				<input id="adminNo" name="adminNo" type="hidden" value="${notice.adminNo}">
				
				<table class="table table-myPage" style="width: 100%;">
					<tr>
						<th style="width: 100px; font-size: 20px; text-align:center;">제목</th>
						<td colspan="3" style="font-size: 20px;"><input id="noticeTitle" name="noticeTitle" type="text" value="${notice.noticeTitle}"></td>
					</tr>
					<tr>
						<th style="text-align:center;">작성자</th>
						<td style="width: 60%;">${notice.adminName}</td>
						<th style="width: 100px; text-align:center;">작성일</th>
						<td>
							<fmt:parseDate value="${notice.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
						</td>	
					</tr>
					<tr>
						<th>상단 고정</th>
						<td colspan="3">
							<select id="noticePin" name="noticePin">
								<option value="${notice.noticePin}" selected>${notice.noticePin}</option>
								<c:if test="${notice.noticePin != 'yes'}">
									<option value="yes">Yes</option>
								</c:if>
								<c:if test="${notice.noticePin != 'no'}">
									<option value="no">No</option>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td colspan="3">
							<select id="noticeCategory" name="noticeCategory">
								<option value="${notice.noticeCategory}" selected>${notice.noticeCategory}</option>
								<c:if test="${notice.noticeCategory != '기타'}">
									<option value="기타">기타</option>
								</c:if>
								<c:if test="${notice.noticeCategory != '정보'}">
									<option value="정보">정보</option>
								</c:if>
								<c:if test="${notice.noticeCategory != '시스템'}">
									<option value="시스템">시스템</option>
								</c:if>
								<c:if test="${notice.noticeCategory != '이벤트'}">
									<option value="이벤트">이벤트</option>
								</c:if>
								<c:if test="${notice.noticeCategory != '뉴스'}">
									<option value="뉴스">뉴스</option>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<th style="padding-top: 150px;padding-bottom: 150px;" width="10%">내용</th>
						<td colspan="3"><textarea id="noticeContent" name="noticeContent" cols="130" rows="11">${notice.noticeContent}</textarea></td>
					</tr>
				</table>
				<button class="btn btn-primary" id="modifyNoticeBtn" type="submit" style="float: right; margin-top: auto;">공지 수정</button>
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