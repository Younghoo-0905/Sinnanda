<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 작성 페이지</title>
</head>
<body>
	<h1>modify QnA</h1>
	<form id="modifyQnaForm" action="modifyQna" method="post">
		<input id="qnaNo" name="qnaNo" type="hidden" value="${qna.qnaNo}">
		<input id="memberNo" name="memberNo" type="hidden" value="${qna.memberNo}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input id="qnaTitle" name="qnaTitle" type="text" value="${qna.qnaTitle}"></td>
				<td>작성일</td>
				<td>${qna.updateDate}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${qna.qnaCategory}</td>
				<td>비밀글 여부</td>
				<td>
					일반문의 : <input type="radio" id="qnaSecret" name="qnaSecret" value="일반문의">
					비밀문의 : <input type="radio" id="qnaSecret" name="qnaSecret" value="비밀문의">
				</td>
			</tr>
			<tr>
				<td>문의 내용</td>
				<td colspan="3">
					<textarea id="qnaContent" name="qnaContent" cols="30" rows="5">${qna.qnaContent}</textarea>
				</td>
			</tr>
		</table>
		<button id="modifyQnaBtn" type="submit">수정</button>
	</form>
</body>
</html>