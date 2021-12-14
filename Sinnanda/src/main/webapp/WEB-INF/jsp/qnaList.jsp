<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
			<a class="navbar-brand" href="index.html">시팔러마.</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="/index" class="nav-link">Home</a></li>
					<li class="nav-item cta"><a href="/qnaList" class="nav-link">Qna</a></li>
					<li class="nav-item cta"><a href="/noticeList" class="nav-link">공지사항</a></li>
					<li class="nav-item cta"><a href="" class="nav-link">쿠폰함</a></li>
					     
					<!--memberId가 없을때--> 
					<c:if test ="${loginUser == null}">
						<li class="nav-item member"><a href="login" class="nav-link">로그인</a></li>
						<li class="nav-item member"><a href="insertMemberForm" class="nav-link">회원가입</a></li>
					</c:if>
					
					<!--memberId가 있을떄  -->
					<c:if test = "${loginUser != null}">
						<li class="nav-item member"><a href="" class="nav-link">마이페이지</a></li>
						<li class="nav-item member"><a href="logout" class="nav-link">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
  <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>Explore <br></strong> your amazing city</h1>
            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay, eat, shop, or visit from local experts</p>
            <div class="block-17 my-4">
              <form action="" method="post" class="d-block d-flex">
                <div class="fields d-block d-flex">
                  <div class="textfield-search one-third">
                  	<input type="text" class="form-control" placeholder="Ex: food, service, hotel">
                  </div>
                  <div class="select-wrap one-third">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control" placeholder="Keyword search">
                      <option value="">Where</option>
                      <option value="">San Francisco USA</option>
                      <option value="">Berlin Germany</option>
                      <option value="">Lodon United Kingdom</option>
                      <option value="">Paris Italy</option>
                    </select>
                  </div>
                </div>
                <input type="submit" class="search-submit btn btn-primary" value="Search">  
              </form>
            </div>
            <p>Or browse the highlights</p>
            <p class="browse d-md-flex">
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-fork"></i>Restaurant</a></span>
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-hotel"></i>Hotel</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-meeting-point"></i>Places</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-	center"><a href="#"><i class="flaticon-shopping-bag"></i>Shopping</a></span>
            </p>
          </div>
        </div>
      </div>
    </div>
    
	<h1>QnA List</h1>
	<div>
		<a href="index">홈 화면</a>
	</div>
	<!-- 상단 로그인 부분 -->
	<!-- 로그인 정보가 없는 경우 -->
	<c:if test="${loginUser == null}">
		<div>
			<a href="login">로그인하기</a>
			<a href="insertMemberForm">회원가입</a>
		</div>
	</c:if>
	<!-- 회원인 경우 -->
	<c:if test="${loginUser.userLevel == 1}">
		<div>
			<a href="마이페이지?memberNo=${loginUser.member.memberNo}">${loginUser.member.memberName}</a>
			<a href="logout">로그아웃</a>
		</div>
	</c:if>
	<!-- 사업자인 경우 -->
	<c:if test="${loginUser.userLevel == 2}">
		<div>
			<img src="/images/jun_test/hostImg.png" width="20px" height="20px">
			<a href="마이페이지?hostNo=${loginUser.host.hostNo}">${loginUser.host.hostName}</a>
			<a href="logout">로그아웃</a>
		</div>
	</c:if>
	<!-- 관리자인 경우 -->
	<c:if test="${loginUser.userLevel == 3}">
		<div>
			<img src="/images/jun_test/adminImg.png" width="20px" height="20px">
			<a href="adminOne?adminNo=${loginUser.admin.adminNo}">${loginUser.admin.adminName}</a>
			<a href="logout">로그아웃</a>
		</div>
	</c:if>
	<div>
		<a href="addQna">문의사항 작성</a>
	</div>
	<div>
		<select id="qnaCategory" name="qnaCategory" onchange="location.href=this.value">
			<option value="">선택</option>
			<option value="/qnaList">전체문의</option>
			<option value="/qnaList?qnaCategory=기타문의">기타문의</option>
			<option value="/qnaList?qnaCategory=결제문의">결제문의</option>
			<option value="/qnaList?qnaCategory=이용문의">이용문의</option>
			<option value="/qnaList?qnaCategory=예약문의">예약문의</option>
			<option value="/qnaList?qnaCategory=숙소문의">숙소문의</option>
		</select>
	</div>
	<table border="1">
		<tr style="text-align:center">
			<td width="5%">번호</td>
			<td width="40%">제목</td>
			<td width="10%">문의유형</td>
			<td width="10%">작성자</td>
			<td width="10%">작성일</td>
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
	<div>
		<c:if test="${currentPage > 1}" >
			<a href="qnaList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:if test="${currentPage < lastPage}" >
			<a href="qnaList?currentPage=${currentPage+1}">다음</a>
		</c:if>
	</div>
</body>
</html>