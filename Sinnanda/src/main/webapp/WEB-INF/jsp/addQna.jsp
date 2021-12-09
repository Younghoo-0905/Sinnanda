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
	<form id="addQnaForm" action="addQna" method="post">
		<input id="memberNo" name="memberNo" type="hidden" value="1">
		<table border="1">
			<tr>
				<td>문의 제목</td>
				<td><input id="qnaTitle" name="qnaTitle" type="text"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select id="qnaCategory" name="qnaCategory">
						<option value="기타문의">기타문의</option>
						<option value="결제문의">결제문의</option>
						<option value="이용문의">이용문의</option>
						<option value="예약문의">예약문의</option>
						<option value="숙소문의">숙소문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>문의 내용</td>
				<td>
					<textarea id="qnaContent" name="qnaContent" cols="30" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td>비밀글 여부</td>
				<td>
					일반문의 : <input type="radio" id="qnaSecret" name="qnaSecret" value="일반문의">
					비밀문의 : <input type="radio" id="qnaSecret" name="qnaSecret" value="비밀문의">
				</td>
			</tr>
		</table>
		<button type="submit">문의 추가</button>
	</form>
</body>
</html>