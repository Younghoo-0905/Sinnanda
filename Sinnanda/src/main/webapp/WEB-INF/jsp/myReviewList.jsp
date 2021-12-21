<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[유동진] 내가 작성한 리뷰 보기</title>
</head>
<body>
	<h1>내가쓴 리뷰</h1>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>숙소이름</th>
			<th>객실이름</th>
			<th>리뷰내용</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${loginUser.member.memberName}</td>
			<td>${review.accomName}</td>
			<td>${review.roomName}</td>
			<td>${review.reviewContent}</td>
			<td>${review.createDate}</td>
		</tr>
	</table>
	<a href="myPage?memberNo=${loginUser.member.memberNo}">마이페이지</a>
</body>
</html>