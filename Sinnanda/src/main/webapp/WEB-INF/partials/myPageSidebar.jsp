<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- [이승준] 회원 마이페이지 사이드내비바 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#member-info" aria-expanded="false" aria-controls="member-info">
			<i class="icon-head menu-icon"></i>
			<span class="menu-title">회원 정보</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="member-info">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/member/checkMemberPw">PW 수정</a></li>
					<li class="nav-item"> <a class="nav-link" href="/member/modifyMember">정보 수정</a></li>
					<li class="nav-item"> <a class="nav-link" href="/member/memberOutForm">회원탈퇴</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" href="/member/myReserveList">
				<i class="icon-grid menu-icon"></i>
				<span class="menu-title">예약 내역</span>
			</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" href="/member/">
				<i class="icon-columns menu-icon"></i>
				<span class="menu-title">보유 쿠폰</span>
			</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#member-community" aria-expanded="false" aria-controls="member-community">
			<i class="icon-paper menu-icon"></i>
			<span class="menu-title">커뮤니티 보기</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=member-community>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/member/myQnaList">작성한 QnA</a></li>
					<li class="nav-item"> <a class="nav-link" href="/member/myReviewList">작성한 리뷰</a></li>
					<li class="nav-item"> <a class="nav-link" href="/member/myComplainList">작성한 컴플레인</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#member-calculate" aria-expanded="false" aria-controls="member-calculate">
			<i class="icon-layout menu-icon"></i>
			<span class="menu-title">정산</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=member-calculate>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/member/memberPaymentChart">결제한 금액 조회</a></li>
				</ul>
			</div>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#member-statistics" aria-expanded="false" aria-controls="member-statistics">
			<i class="icon-bar-graph menu-icon"></i>
			<span class="menu-title">통계</span>
			<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id=member-statistics>
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"> <a class="nav-link" href="/member/memberUseChart">이용횟수</a></li>
					<li class="nav-item"> <a class="nav-link" href="/member/">자주 방문한 숙소</a></li>
					<li class="nav-item"> <a class="nav-link" href="/member/">자주 방문한 지역</a></li>
				</ul>
			</div>
		</li>
	</ul>
</nav>