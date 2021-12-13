<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<h1>modify Notice</h1>
	<div>
		<a href="/index">홈 화면</a>
	</div>
	<form id="modifyNoticeForm" action="modifyNotice" method="post">
		<input id="noticeNo" name="noticeNo" type="hidden" value="${notice.noticeNo}">
		<input id="adminNo" name="adminNo" type="hidden" value="${notice.adminNo}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input id="noticeTitle" name="noticeTitle" type="text" value="${notice.noticeTitle}"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${notice.updateDate}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${notice.noticeCategory}</td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td>
					<textarea id="noticeContent" name="noticeContent" cols="30" rows="5">${notice.noticeContent}</textarea>
				</td>
			</tr>
		</table>
		<button id="modifyNoticeBtn" type="submit">공지 수정</button>
	</form>
</body>
</html>