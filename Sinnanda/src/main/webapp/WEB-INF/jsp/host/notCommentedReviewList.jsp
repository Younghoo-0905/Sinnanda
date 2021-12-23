<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컴플레인 목록</title>
</head>
<body>
	<h1>( 대충 사업자 정보 ) 답변못한 리뷰 리스트</h1>
	<form action="/host/addReviewComment" method="post">
		<table border="1">
			<tr>
				<th width="10%">숙소명</th>
				<th width="10%">객실명</th>
				<th width="10%">작성자</th>
				<th width="5%">별점</th>
				<th width="50%">Review</th>
				<th width="5%">추천</th>
				<th width="10%">작성일</th>
			</tr>
			<c:if test="${empty reviewList}">
				<tr>
					<th colspan="7">없음</th>
				</tr>
			</c:if>
			<c:forEach var="r" items="${reviewList}">
				<input type="hidden" name="reviewNo" value="${r.reviewNo}">
				<tr>
					<td>${r.accomName}</td>
					<td>${r.roomName}</td>
					<td>${r.memberName}</td>
					<td>${r.reviewRank}</td>
					<td>${r.reviewContent}</td>
					<td>${r.reviewRecommend}</td>
					<td>${r.createDate}</td>				
				</tr>
				<tr>
					<td></td>
					<td colspan="5"><input type="text" name="reviewCommentContent"></td>
					<td><button type="submit">답변 등록</button></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>