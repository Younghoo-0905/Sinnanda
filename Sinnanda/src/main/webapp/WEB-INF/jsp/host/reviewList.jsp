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
	<h1>( 대충 사업자 정보 ) 리뷰 리스트</h1>
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
		<c:forEach var="r" items="${reviewList}">
			<tr>
				<td>${r.accomName}</td>
				<td>${r.roomName}</td>
				<td>${r.memberName}</td>
				<td>${r.reviewRank}</td>
				<td>${r.reviewContent}</td>
				<td>${r.reviewRecommend}</td>
				<td>${r.createDate}</td>				
			</tr>
			
			<c:if test="${r.reviewComment.reviewCommentContent != null}">
				<tr>
					<td>re:</td>
					<td colspan="5">${r.reviewComment.reviewCommentContent}</td>
					<td>${r.reviewComment.commentDate}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>