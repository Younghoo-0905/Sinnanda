<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<h1>add Notice</h1>
	<a href="/noticeList">공지 목록</a>
	<form id="addNoticeForm" action="addNotice" method="post">
		<input id="adminNo" name="adminNo" type="hidden" value="1">
		<table border="1">
			<tr>
				<td style="text-align:right" width="30%">제목</td>
				<td><input id="noticeTitle" name="noticeTitle" type="text"></td>
			</tr>
			<tr>
				<td style="text-align:right">공지 유형</td>
				<td>
					<select id="noticeCategory" name="noticeCategory">
						<option value="기타">기타</option>
						<option value="정보">정보</option>
						<option value="시스템">시스템</option>
						<option value="이벤트">이벤트</option>
						<option value="뉴스">뉴스</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">공지 내용</td>
				<td>
					<textarea id="noticeContent" name="noticeContent" cols="30" rows="5"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit">공지 등록</button>
	</form>
</body>
</html>