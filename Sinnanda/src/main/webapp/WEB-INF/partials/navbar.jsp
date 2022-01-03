<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/index">
				<img src="/images/logo/logo_main.svg" width="120px" height="40px">
			</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
				<!-- [이승준] 현재 uri의 위치 정보를 조회 -->
				<c:set var="nowURI" value="${pageContext.request.requestURI}"/>
				<!-- uri 배열로 분리 -->
				<c:set var="uriArr" value="${fn:split(nowURI,'/')}"/>
				<!-- 배열의 크기 -->
				<c:set var="uriLength" value="${fn:length(uriArr)}"/>
				<!-- 현재 JSP 파일의 이름 -->
				<c:set var="nowJSP" value="${uriArr[uriLength-1]}"/>
				
				<!-- [이승준] uri에 따라 선택된 버튼 분기  -->
				<c:choose>
					<%-- QnA 페이지일 때 --%>
					<c:when test="${nowJSP eq 'qnaList.jsp' || nowJSP eq 'qnaOne.jsp' || nowJSP eq 'addQna.jsp' || nowJSP eq 'modifyQna.jsp'}">
						<li class="nav-item active"><a href="/qnaList" class="nav-link">Q&A</a></li>
						<li class="nav-item cta"><a href="/noticeList" class="nav-link">공지사항</a></li>
						<li class="nav-item cta"><a href="/about" class="nav-link">신난다 소개</a></li>
					</c:when>
					<%-- 공지사항 페이지일 때 --%>
					<c:when test="${nowJSP eq 'noticeList.jsp' || nowJSP eq 'noticeOne.jsp' || nowJSP eq 'addNotice.jsp' || nowJSP eq 'modifyNotice.jsp'}">
						<li class="nav-item cta"><a href="/qnaList" class="nav-link">Q&A</a></li>
						<li class="nav-item active"><a href="/noticeList" class="nav-link">공지사항</a></li>
						<li class="nav-item cta"><a href="/about" class="nav-link">신난다 소개</a></li>
					</c:when>
					<%-- 소개 페이지일 때 --%>
					<c:when test="${nowJSP eq 'about.jsp'}">
						<li class="nav-item cta"><a href="/qnaList" class="nav-link">Q&A</a></li>
						<li class="nav-item cta"><a href="/noticeList" class="nav-link">공지사항</a></li>
						<li class="nav-item active"><a href="/about" class="nav-link">신난다 소개</a></li>
					</c:when>
					
					<%-- 그 외의 페이지일 때  --%>
					<c:otherwise>
						<li class="nav-item cta"><a href="/qnaList" class="nav-link">Q&A</a></li>
						<li class="nav-item cta"><a href="/noticeList" class="nav-link">공지사항</a></li>
						<li class="nav-item cta"><a href="/about" class="nav-link">신난다 소개</a></li>
					</c:otherwise>
				</c:choose>
				
				
			</ul>
			<ul class="navbar-nav mj-auto">
				<!-- loginUser가 없을때(비회원 상태) --> 
				<c:if test ="${loginUser == null}">
					<li class="nav-item member"><a href="/login" class="nav-link">로그인</a></li>
					<li class="nav-item member"><a href="/insertMemberForm" class="nav-link">회원가입</a></li>
				</c:if>
				
				<!-- loginUser가 있을떄(로그인 상태) -->
				<c:if test = "${loginUser != null}">
					<c:if test="${loginUser.userLevel == 1}">
						<li class="nav-item member"><a href="/member/myPage?memberNo=${loginUser.member.memberNo}" class="nav-link">${loginUser.member.memberName}</a></li>
					</c:if>
					<c:if test="${loginUser.userLevel == 2}">
						<li class="nav-item member"><a href="/host/hostPage?hostNo=${loginUser.host.hostNo}" class="nav-link">${loginUser.host.hostName}</a></li>
					</c:if>
					<c:if test="${loginUser.userLevel == 3}">
						<li class="nav-item member">
						<a href="/admin/adminPage?adminNo=${loginUser.admin.adminNo}" class="nav-link">
								<img src="/images/jun_test/adminImg.png" width="20px" height="20px">
								${loginUser.admin.adminName}&nbsp;관리자
							</a>
						</li>
					</c:if>
					<li class="nav-item member"><a href="/logout" class="nav-link">로그아웃</a></li>		
				</c:if>
			</ul>
		</div>
	</div>
</nav>