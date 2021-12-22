<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컴플레인 상세</title>
</head>
<body>
	<h1>컴플레인 상세보기</h1>
	<table border="1">
		<tr>
			<td>작성자</td>
			<td>${complain.memberName}</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>${complain.complainCategory}</td>
		</tr>
		<tr>
			<td>숙소이름</td>
			<td>${complain.accomName}</td>
		</tr>
		<tr>
			<td>객실이름</td>
			<td>${complain.roomName}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${complain.complainTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${complain.complainContent}</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td>${complain.createDate}</td>
		</tr>
	</table>
		
	<br>
	<c:choose>
		<c:when test="${complain.complainComment.complainCommentContent != null}">
			<table border="1">	
				<tr>
					<td>답변내용</td>
					<td>${complain.complainComment.complainCommentContent}</td>
				</tr>
				<tr>
					<td>답변자</td>
					<td>${complain.complainComment.hostName}</td>
				</tr>	
				<tr>
					<td>답변일</td>
					<td>${complain.complainComment.commentDate}</td>
				</tr>	
			</table>
		</c:when>
		<c:when test="${complain.complainComment.complainCommentContent == null}">
			<form action="/host/addComplainComment" method="post">
				<input type="hidden" name="complainNo" value="${complain.complainNo}">
				<table border="1">
					<tr>
						<td>답변</td>
						<td><textarea name="complainCommentContent"></textarea></td>
					</tr>
				</table>
				<button type="submit">답변 등록</button>
			</form>
		</c:when>
	</c:choose>
</body>
</html>