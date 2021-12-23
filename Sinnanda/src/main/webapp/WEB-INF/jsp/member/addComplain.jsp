<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컴플레인 등록</title>
</head>
<body>
	<form action="/member/addComplain" method="post">
		<input type="hidden" name="paymentNo" value="${paymentNo}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="complainTitle"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="complainCategory">
						<option value="예약일 변경">예약일 변경</option>
						<option value="예약 취소">예약 취소</option>
						<option value="이용 불편">이용 불편</option>
						<option value="기타" selected>기타</option>					
					</select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="complainContent" cols="50" rows="5"></textarea></td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>