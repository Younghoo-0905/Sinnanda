<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
</head>
<body>
	<h1>Notice One</h1>
	<a href="modifyNotice?noticeNo=${notice.noticeNo}">공지 수정</a>
	<a href="removeNotice?noticeNo=${notice.noticeNo}?adminNo=">공지 삭제</a>
	<table border="1">
		<tr>
			<td width="20%">제목</td>
			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td width="20%">작성일</td>
			<td>${notice.updateDate}</td>			
		</tr>
		<tr>
			<td width="20%">작성자</td>
			<td>${notice.adminName}</td>
		</tr>
		<tr>
			<td width="20%">내용</td>
			<td>${notice.noticeContent}</td>
		</tr>
	</table>
</body>
</html>