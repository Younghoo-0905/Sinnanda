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
	
	<title>관리자 List 페이지</title>
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
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - END -->
			
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading" style="margin-left: 10px;">관리자 List</span>
									<h1 style="margin-top: 10px;"><strong>관리자 리스트</strong></h1>
									
								    <div class="container">
										<div class="container2">
											<select id="adminPosition" name="adminPosition" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px;">
												<option value="">선택</option>
												<option value="adminList?adminPosition=전체 관리자">전체관리자</option>
												<option value="adminList?adminPosition=운영 관리자">운영 관리자</option>
												<option value="adminList?adminPosition=회원 관리자">회원 관리자</option>
												<option value="adminList?adminPosition=숙소 관리자">숙소 관리자</option>
												<option value="adminList?adminPosition=재무 관리자">재무 관리자</option>
												<option value="adminList?adminPosition=총 관리자">총 관리자</option>
											</select>
											
										</div>
										<table class= "table-myPage" style="width: 100%;">
											<tr style="text-align:center">
												<th width="5%">번호</th>
												<th width="10%">아이디</th>
												<th width="10%">관리자 레벨</th>
												<th width="10%">관리자 직급</th>
												<th width="10%">관리자 이름</th>
												<th width="10%">등급 수정</th>
												<th width="15%" >수정일</th>
											</tr>
											<c:forEach items="${adminList}" var="admin">
												<tr>
													<td style="text-align:center">${admin.adminNo}</td>
													<td>
														<a href="adminOne?adminNo=${admin.adminNo}">${admin.adminId}</a>
													</td>
													<td style="text-align:center">${admin.adminLevel}</td>
													<td style="text-align:center">${admin.adminPosition}</td>
													<td style="text-align:center">${admin.adminName}</td>
													<c:choose>
														<c:when test="${admin.adminLevel != 5}"> 
															<td style="text-align:center">
																<a href="modifyAdminList?adminNo=${admin.adminNo}" class="btn btn-block btn-primary ">수정</a>
															</td>
														</c:when>
														<c:when test="${admin.adminLevel == 5}">
															<td style="text-align:center">
																<input type ="hidden" readonly>
															</td>
														</c:when>
													</c:choose>
													<td style="text-align:center">
														<fmt:parseDate value="${admin.updateDate}" var="updateDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
														<fmt:formatDate value="${updateDate}" pattern="yy/MM/dd HH:mm"/>
													</td>
												</tr>
											</c:forEach>
										</table>
										
							
										<!-- Paging -->			
										<div class="row mt-5">
									    	<div class="col text-center">
									            <div class="block-27">
													<ul>
														<!-- '이전' 버튼 -->
														<c:if test="${beginRow >= (ROW_PER_PAGE * 10)}">
															<li><a href="adminList?currentPage=${pageNo-1}&adminPosition=${adminPosition}">&lt;</a></li>
														</c:if>
														
														<!-- Page 번호 -->
														<c:set var="doneLoop" value="false"></c:set>
														<c:forEach var="i" begin="${pageNo}" end="${pageNo + 9}">
														
															<!-- Page 숫자 10개 출력 -->
															<c:if test="${not doneLoop}">
																<c:choose>
																	<c:when test="${currentPage == i}">				
																		<li class="active"><span>${i}</span></li>
																	</c:when>
												    				<c:otherwise>
																		<li><a href="/admin/adminList?currentPage=${i}&adminPosition=${adminPosition}">${i}</a></li>	
																	</c:otherwise>		
																</c:choose>
																<!-- LastPage이면 다음 페이지 번호를 출력하지 않는다 -->
																<c:if test="${i == lastPage}">
																	<c:set var="doneLoop" value="true"></c:set>
																</c:if>
															</c:if>
														</c:forEach>
														
															<!-- '다음' 버튼 -->
														<c:if test="${lastPage >= pageNo + 10}">
															<li><a href="adminList?currentPage=${pageNo+10}&adminPosition=${adminPosition}">&gt;</a></li>
														</c:if>
													</ul>
												</div>
											</div>
										</div>
										<!-- Paging -->
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