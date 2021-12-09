<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세 페이지</title>
</head>
<body>
	<h1>QnA One</h1>
	<table border="1">
		<tr>
			<td>문의 번호</td>
			<td>카테고리</td>
			<td>문의한 회원</td>
			<td>제목</td>
			<td>내용</td>
			<td>비밀글 여부</td>
			<td>작성일</td>
			<td>수정일</td>
			<td>답변 작성자</td>
			<td>답변 내용</td>
			<td>답변 작성일</td>
		</tr>
		<tr>
			<td>${qna.qnaNo}</td>
			<td>${qna.qnaCategory}</td>
			<td>${qna.memberNo}</td>
			<td>${qna.qnaTitle}</td>
			<td>${qna.qnaCotent}</td>
			<td>${qna.qnaSecret}</td>
			<td>${qna.createDate}</td>
			<td>${qna.updateDate}</td>
			<td>${qna.adminNo}</td>
			<td>${qna.qnaComment}</td>
			<td>${qna.commentDate}</td>
		</tr>
	</table>
	<div>
		
	</div>
</body>
</html>