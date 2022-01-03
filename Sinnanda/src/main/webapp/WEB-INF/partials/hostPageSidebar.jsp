<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- [이승준] 사업자 페이지 사이드내비바 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item">
			<a class="nav-link" href="/host/myHostInfo?hostNo=${loginUser.host.hostNo}">
				<i class="icon-head menu-icon"></i>
				<span class="menu-title">사업자 정보</span>
			</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" href="/host/myReserveList">
				<i class="icon-grid menu-icon"></i>
				<span class="menu-title">예약 일정</span>
			</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" href="">
				<i class="icon-columns menu-icon"></i>
				<span class="menu-title">숙소 정보</span>
			</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#host-community" aria-expanded="false" aria-controls="host-community">
				<i class="icon-paper menu-icon"></i>
				<span class="menu-title">커뮤니티 관리</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="host-community">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/host/myComplainList">컴플레인 관리</a></li>
					<li class="nav-item"> <a class="nav-link" href="/host/myReviewList">리뷰 관리</a></li>
					<li class="nav-item"> <a class="nav-link" href="/host/myHostQnaList">사업자 문의 관리</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#host-calculate" aria-expanded="false" aria-controls="host-calculate">
			<i class="icon-layout menu-icon"></i>
			<span class="menu-title">정산</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=host-calculate>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/host/myHostRevenue?hostNo=${loginUser.host.hostNo}">숙소 수입</a></li>
					<li class="nav-item"> <a class="nav-link" href="/host/myHostCommission">숙소 수수료</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#host-statistics" aria-expanded="false" aria-controls="host-statistics">
			<i class="icon-bar-graph menu-icon"></i>
			<span class="menu-title">통계</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=host-statistics>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/host/hostComplainChart">컴플레인</a></li>
				</ul>
			</div>
		</li>
	</ul>
</nav>