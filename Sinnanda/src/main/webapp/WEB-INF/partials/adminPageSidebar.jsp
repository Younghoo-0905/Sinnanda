<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- [이승준] 관리자 페이지 사이드내비바 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item">
			<a class="nav-link" href="/admin/adminOne?adminNo=${loginUser.admin.adminNo}">
				<i class="icon-grid menu-icon"></i>
				<span class="menu-title">관리자 정보</span>
			</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#admin-accom" aria-expanded="false" aria-controls="admin-accom">
				<i class="icon-columns menu-icon"></i>
				<span class="menu-title">숙소 관리</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="admin-accom">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/admin/">숙소 추가</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/">숙소 수정</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/">숙소 삭제</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#admin-community" aria-expanded="false" aria-controls="admin-community">
				<i class="icon-paper menu-icon"></i>
				<span class="menu-title">커뮤니티 관리</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="admin-community">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/admin/">컴플레인 관리</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/">리뷰 관리</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/">사업자 문의 관리</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#admin-member-manage" aria-expanded="false" aria-controls="admin-member-manage">
				<i class="icon-head menu-icon"></i>
				<span class="menu-title">회원 관리</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="admin-member-manage">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/admin/">컴플레인 관리</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/">리뷰 관리</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/">사업자 문의 관리</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#admin-calculate" aria-expanded="false" aria-controls="admin-calculate">
			<i class="icon-layout menu-icon"></i>
			<span class="menu-title">정산</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=admin-calculate>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/admin/">숙소 수입</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/">숙소 수수료</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#admin-statistics" aria-expanded="false" aria-controls="admin-statistics">
			<i class="icon-bar-graph menu-icon"></i>
			<span class="menu-title">통계</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=admin-statistics>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/admin/"></a></li>
				</ul>
			</div>
		</li>
	</ul>
</nav>