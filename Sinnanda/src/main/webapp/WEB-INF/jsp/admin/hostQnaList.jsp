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

    <link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/css/animate.css">
    
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">

    <link rel="stylesheet" href="/css/aos.css">

    <link rel="stylesheet" href="/css/ionicons.min.css">

    <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/css/flaticon.css">
    <link rel="stylesheet" href="/css/icomoon.css">
    <link rel="stylesheet" href="/css/style.css">
    
    <!-- [이승준] 관리자용 페이지 -->
    
	<title>회원 문의사항 목록</title>
</head>
<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery 실행 -->
<body onload="toBoardScroll()">

	<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>
		// [이승준] 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 200);
		}
	</script>
	
	<!-- [이승준] 본문 QnA 목록 부분 - START -->
    <section id="startBoard" class="ftco-section testimony-section bg-light">
	    <div class="container">
	    	<span class="subheading">사업자 Q&A</span>
			<h1><strong>답변되지 않은 Host Q&A</strong></h1>
			<div class="container2">
				<select id="hostQnaCategory" name="hostQnaCategory" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px;">
					<option value="">선택</option>
					<option value="hostQnaList?hostQnaCategory=전체">전체 문의</option>
					<option value="hostQnaList?hostQnaCategory=기타 문의">기타 문의</option>
					<option value="hostQnaList?hostQnaCategory=이용 문의">이용 문의</option>
					<option value="hostQnaList?hostQnaCategory=시스템 문의">시스템 문의</option>
					<option value="hostQnaList?hostQnaCategory=숙소 추가">숙소 추가</option>
					<option value="hostQnaList?hostQnaCategory=숙소 수정">숙소 수정</option>
					<option value="hostQnaList?hostQnaCategory=숙소 삭제">숙소 삭제</option>
					<option value="hostQnaList?hostQnaCategory=객실 추가">객실 추가</option>
					<option value="hostQnaList?hostQnaCategory=객실 수정">객실 수정</option>
					<option value="hostQnaList?hostQnaCategory=객실 삭제">객실 삭제</option>
				</select>
			</div>
			<table class="table table-board" style="width: 100%;">
				<tr style="text-align:center">
					<th width="5%">번호</th>
					<th width="40%">제목</th>
					<th width="10%">문의유형</th>
					<th width="10%">작성자</th>
					<th width="10%">작성일</th>
				</tr>
				<c:forEach items="${hostQnaList}" var="hostQna">
					<tr>
						<td style="text-align:center">${hostQna.hostQnaNo}</td>
						<td>
							<a href="/admin/hostQnaOne?hostQnaNo=${hostQna.hostQnaNo}">${hostQna.hostQnaTitle}</a>
						</td>
						<td style="text-align:center">${hostQna.hostQnaCategory}</td>
						<td style="text-align:center">${hostQna.hostName}</td>
						<td style="text-align:center">
							<fmt:parseDate value="${hostQna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${loginUser.userLevel !=3}">
				<a class="btn btn-primary" href="addQna" style="float: right; margin-top: auto;">문의사항 작성</a>
			</c:if>
			<!-- Paging -->			
			<div class="row mt-5">
		    	<div class="col text-center">
		            <div class="block-27">
						<ul>
							<!-- '이전' 버튼 -->
							<c:if test="${beginRow > (ROW_PER_PAGE * 10)}">
								<li><a href="hostQnaList?currentPage=${pageNo-1}&hostQnaCategory=${hostQnaCategory}">&lt;</a></li>
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
											<li><a href="hostQnaList?currentPage=${i}&hostQnaCategory=${hostQnaCategory}">${i}</a></li>	
										</c:otherwise>		
									</c:choose>
									<!-- LastPage이면 다음 페이지 번호를 출력하지 않는다 -->
									<c:if test="${i == lastPage}">
										<c:set var="doneLoop" value="true"></c:set>
									</c:if>
								</c:if>
							</c:forEach>
							
							<!-- '다음' 버튼 -->
							<c:if test="${currentPage + 10 <= lastPage}">
								<li><a href="hostQnaList?currentPage=${pageNo+10}&hostQnaCategory=${hostQnaCategory}">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- Paging -->
			
		</div>
	</section>
	<!-- [이승준] 본문 QnA 목록 부분 - END -->
	
	<!-- [이승준] js 소스코드 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.easing.1.3.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>
	<script src="/js/jquery.stellar.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/aos.js"></script>
	<script src="/js/jquery.animateNumber.min.js"></script>
	<script src="/js/bootstrap-datepicker.js"></script>
	<script src="/js/jquery.timepicker.min.js"></script>
	<script src="/js/scrollax.min.js"></script>
	<script src="/direngine-master/js/google-map.js"></script>
	<script src="/direngine-master/js/main.js"></script>
</body>
</html>