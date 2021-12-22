<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[유동진] 내가 작성한 리뷰 보기</title>
</head>
<body>
  	<section class="ftco-section testimony-section bg-light">
    <div class="container">
	<h1>내가쓴 리뷰</h1>
	<div>
		<select id="reviewRecommend" name="reviewRecommend" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px;">
			<option value="">선택</option>
			<option value="/member/myReviewList">전체</option>
			<option value="/member/myReviewList?reviewRecommend=보통">보통</option>
			<option value="/member/myReviewList?reviewRecommend=추천">추천</option>
			<option value="/member/myReviewList?reviewRecommend=비추천">비추천</option>
		</select>
	</div>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>숙소이름</th>
			<th>객실이름</th>
			<th>리뷰내용</th>
			<th>평점</th>
			<th>추천여부</th>
			<th>작성일</th>
		</tr>

		<c:forEach items="${myReviewList}" var="review">
			<tr>
				<td>${loginUser.member.memberName}</td>
				<td>${review.roomName}</td>
				<td>${review.accomName}</td>
				<td>${review.reviewContent}</td>
				<td>${review.reviewRank}</td>
				<td>${review.reviewRecommend}</td>
				<td>${review.createDate}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</section>
	<a href="/member/myPage?memberNo=${loginUser.member.memberNo}">마이페이지</a>
</body>
</html>