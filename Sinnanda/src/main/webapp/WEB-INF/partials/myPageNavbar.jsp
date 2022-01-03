<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- [이승준] 마이페이지 내비바 -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<!-- 좌측 상단 로고 이미지 -->
	<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="/index"><img src="/images/logo/logo_myPage.svg" class="mr-2" alt="logo"/></a>
		<a class="navbar-brand brand-logo-mini" href="/index"><img src="/images/logo/logo_myPage_mini.svg" alt="logo"/></a>
	</div>
	
	<!-- 우측 상단 메뉴  -->
	<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
		<!-- 좌측 상단 확대 축소 버튼  -->
		<button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
			<span class="icon-menu"></span>
		</button>
		
		<!-- 우측 상단 끝 메뉴들 -->
		<ul class="navbar-nav navbar-nav-right">
			<!-- 사용자 이미지 -->
			<li class="nav-item nav-profile dropdown">
				<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
					<!-- 사용자별 이미지 -->
					<c:if test = "${loginUser != null}">
						<c:if test="${loginUser.userLevel == 1}">
							<img src="/images/memberImg/memberIcon.png" width="20px" height="20px" alt="profile"/>
							${loginUser.member.memberName}&nbsp;회원님
						</c:if>
						<c:if test="${loginUser.userLevel == 2}">
							<img src="/images/myPage/defaultHostImg.png" alt="profile"/>
							${loginUser.host.hostName}&nbsp;사업자
						</c:if>
						<c:if test="${loginUser.userLevel == 3}">
							<img src="/images/myPage/defaultAdminImg.png" alt="profile"/>
							${loginUser.admin.adminName}&nbsp;관리자
						</c:if>
					</c:if>
				</a>
				
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
					<!-- 사용자별 마이페이지 경로 -->
					<c:if test = "${loginUser != null}">
						<c:if test="${loginUser.userLevel == 1}">
							<a class="dropdown-item" href ="/member/myPage?memberNo=${loginUser.member.memberNo}">
								<i class="ti-settings text-primary">마이페이지로 이동</i>
								
							</a>
						</c:if>
						<c:if test="${loginUser.userLevel == 2}">
							<a class="dropdown-item" href ="/host/hostPage?hostNo=${loginUser.host.hostNo}">
								<i class="ti-settings text-primary"></i>
								마이페이지
							</a>
						</c:if>
						<c:if test="${loginUser.userLevel == 3}">
							<a class="dropdown-item" href ="/admin/adminPage?adminNo=${loginUser.admin.adminNo}">
								<i class="ti-settings text-primary"></i>
								마이페이지
							</a>
						</c:if>
					</c:if>
					<a class="dropdown-item" href ="/logout">
						<i class="ti-power-off text-primary"></i>
						로그아웃
					</a>
				</div>
			</li>
		</ul>
		
		<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
			<span class="icon-menu"></span>
		</button>
	</div>
</nav>