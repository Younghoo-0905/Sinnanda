<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<i class="icon-paper menu-icon"></i>
				<span class="menu-title">커뮤니티 관리</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="admin-accom">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/admin/memberQnaList">회원 Q&A</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/hostQnaList">사업자 Q&A</a></li>
					
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">회원 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <!-- 마이 페이지 -->
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                
                 <!-- 관리자가 회원이나 호스트 리스트 관리(세부적으로 관리는 나중에) -->
                 <li class="nav-item">
                 <a class="nav-link" href="/admin/memberList?adminNo=${loginUser.admin.adminNo}">회원 리스트 </a>
                 <li class="nav-item">
                 <a class="nav-link" href="/admin/hostList?adminNo=${loginUser.admin.adminNo}">사업자 리스트</a>
                 
                 <!-- 관리자 레벨이 5이어야 다른 관리자 수정 가능  -->
                 <c:if test="${loginUser.admin.adminPositionNo == 1}">
                    <li class="nav-item">
                		<a class="nav-link" href="adminList">관리자 리스트</a>
                	</li>
               	</c:if>
                 </li>
              </ul>
            </div>
          </li>
		
		 <!--  
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
		 -->
		 
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#admin-calculate" aria-expanded="false" aria-controls="admin-calculate">
			<i class="icon-bar-graph menu-icon"></i>
			<span class="menu-title">통계</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=admin-calculate>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/admin/incomeChart">정산</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/totalMemberYear">회원 관련 통계</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/totalHostYear">사업자 관련 통계</a></li>
					<li class="nav-item"> <a class="nav-link" href="/admin/totalAccomYear">숙소 관련 통계</a></li>
				</ul>
			</div>
		</li>
	<!-- 
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
		 -->
	</ul>
</nav>