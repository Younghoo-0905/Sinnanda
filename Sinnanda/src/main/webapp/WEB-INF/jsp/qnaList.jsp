<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    
<title>문의사항 목록 페이지</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index">신난다</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="/qnaList" class="nav-link">Q&A</a></li>
					<li class="nav-item cta"><a href="/noticeList" class="nav-link">공지사항</a></li>
					
				</ul>
				<ul class="navbar-nav mj-auto">
					<!--memberId가 없을때--> 
					<c:if test ="${loginUser == null}">
						<li class="nav-item member"><a href="login" class="nav-link">로그인</a></li>
						<li class="nav-item member"><a href="insertMemberForm" class="nav-link">회원가입</a></li>
					</c:if>
					
					<!--memberId가 있을떄  -->
					<c:if test = "${loginUser != null}">
						<c:if test="${loginUser.userLevel == 1}">
							<li class="nav-item member"><a href="myPage?memberNo=${loginUser.member.memberNo}" class="nav-link">${loginUser.member.memberName}</a></li>
						</c:if>
						<c:if test="${loginUser.userLevel == 2}">
							<li class="nav-item member"><a href="myPage?memberNo=${loginUser.host.hostNo}" class="nav-link">${loginUser.host.hostName}</a></li>
						</c:if>
						<c:if test="${loginUser.userLevel == 3}">
							<li class="nav-item member">
							<a href="myPage?memberNo=${loginUser.admin.adminNo}" class="nav-link">
									<img src="/images/jun_test/adminImg.png" width="20px" height="20px">
									${loginUser.admin.adminName}&nbsp;관리자
								</a>
							</li>
						</c:if>
						<li class="nav-item member"><a href="logout" class="nav-link">로그아웃</a></li>		
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
	</div>
    
    <!-- [이승준] 본문 - QnA 목록 부분 -->
    <section class="ftco-section testimony-section bg-light">
	    <div class="container">
			<h1>Q&A 목록</h1>
			<div class="container2">
				<select id="qnaCategory" name="qnaCategory" class="form-control-sm" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="/qnaList">전체문의</option>
					<option value="/qnaList?qnaCategory=기타문의">기타문의</option>
					<option value="/qnaList?qnaCategory=결제문의">결제문의</option>
					<option value="/qnaList?qnaCategory=이용문의">이용문의</option>
					<option value="/qnaList?qnaCategory=예약문의">예약문의</option>
					<option value="/qnaList?qnaCategory=숙소문의">숙소문의</option>
				</select>
			</div>
			<table class="table" style="width: 100%;">
				<tr style="text-align:center">
					<th width="5%">번호</th>
					<th width="40%">제목</th>
					<th width="10%">문의유형</th>
					<th width="10%">작성자</th>
					<th width="10%">작성일</th>
				</tr>
				<c:forEach items="${qnaList}" var="qna">
					<tr>
						<td style="text-align:center">${qna.qnaNo}</td>
						<td>
							<a href="/qnaOne?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a>
							<c:if test="${qna.qnaSecret == '비밀문의'}">
								<img src="/images/qna/lockImg.png" width="20px" height="20px">
							</c:if>
						</td>
						<td style="text-align:center">${qna.qnaCategory}</td>
						<td style="text-align:center">${qna.memberName}</td>
						<td style="text-align:center">
							<fmt:parseDate value="${qna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			<a class="btn btn-primary" href="addQna" style="float: right; margin-top: auto;">문의사항 작성</a>
			<!-- [이승준] 본문 - 내용 - 페이징 부분 -->
			<div>
				<c:if test="${currentPage > 1}" >
					<a href="qnaList?currentPage=${currentPage-1}">이전</a>
				</c:if>
				<c:if test="${currentPage < lastPage}" >
					<a href="qnaList?currentPage=${currentPage+1}">다음</a>
				</c:if>
			</div>
		</div>
	</section>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="direngine-master/js/google-map.js"></script>
<script src="direngine-master/js/main.js"></script>
</body>
</html>