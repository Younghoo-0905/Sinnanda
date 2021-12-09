<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 입력</title>
</head>
<body>
	<h1>add QnA</h1>
	<form action="addQna" method="post">
		<table border="1">
			<tr>
				<td>제목</td>
				<td>카테고리</td>
				<td>제목</td>
				<td>비밀글 여부</td>
			</tr>
			<tr>
				<td>${qna.qnaNo}</td>
				<td>${qna.qnaCategory}</td>
				<td>${qna.memberNo}</td>
				<td>
					<a href="/qnaOne?qnaNo=${qna.qnaNo}"></a>${qna.qnaTitle}</td>
				<td>${qna.qnaSecret}</td>
				<td>${qna.createDate}</td>
			</tr>
		</table>
		<button type="submit">문의 추가</button>
	</form>
</body>
</html>