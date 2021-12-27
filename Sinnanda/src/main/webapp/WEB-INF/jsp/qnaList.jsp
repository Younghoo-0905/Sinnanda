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
	<title>회원 문의사항 목록</title>
</head>
<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery 실행 -->
<body onload="toBoardScroll()">

	<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>
		// [이승준] 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
		}
	</script>
	
	<!-- [이승준] 상단 내비바 - START -->
	<%@ include file="/WEB-INF/partials/navbar.jsp" %>
	<!-- [이승준] 상단 내비바 - END -->
	
	<!-- [이승준] 상단 이미지 배너 - START -->
	<%@ include file="/WEB-INF/partials/qnaBackground.jsp" %>
	<!-- [이승준] 상단 이미지 배너 - END -->
	
	<!-- [이승준] 본문 QnA 목록 부분 - START -->
	<section id="startBoard" class="ftco-section testimony-section bg-light">
		<div class="container">
			<span class="subheading">회원 Q&A</span>
			<h1><strong>회원문의</strong></h1>
			<div class="container2">
				<select id="qnaCategory" name="qnaCategory" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px;">
					<option value="">선택</option>
					<option value="/qnaList?qnaCategory=전체">전체문의</option>
					<option value="/qnaList?qnaCategory=기타문의">기타문의</option>
					<option value="/qnaList?qnaCategory=결제문의">결제문의</option>
					<option value="/qnaList?qnaCategory=이용문의">이용문의</option>
					<option value="/qnaList?qnaCategory=예약문의">예약문의</option>
					<option value="/qnaList?qnaCategory=숙소문의">숙소문의</option>
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
				<c:forEach items="${qnaList}" var="qna">
					<tr>
						<td style="text-align:center">${qna.qnaNo}</td>
						<td>
							<c:if test="${qna.qnaComments.adminNo != null}">
								<span style="color: #CD5C5C; font-weight: bold;">[답변 완료]</span>
							</c:if>
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
			<a class="btn btn-primary" href="/member/addQna" style="float: right; margin-top: auto;">문의사항 작성</a>
			
			
			<!-- Paging -->			
			<div class="row mt-5">
		    	<div class="col text-center">
		            <div class="block-27">
						<ul>
							<!-- '이전' 버튼 -->
							<c:if test="${beginRow >= (ROW_PER_PAGE * 10)}">
								<li><a href="qnaList?currentPage=${pageNo-1}&qnaCategory=${qnaCategory}">&lt;</a></li>
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
											<li><a href="/qnaList?currentPage=${i}&qnaCategory=${qnaCategory}">${i}</a></li>	
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
								<li><a href="qnaList?currentPage=${pageNo+10}&qnaCategory=${qnaCategory}">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- Paging -->

		</div>
	</section>
	<!-- [이승준] 본문 QnA 목록 부분 - END -->
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->
	
	<!-- [이승준] js 소스코드 -->
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