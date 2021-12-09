<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(회원)</title>
</head>
<body>
	<h1>마이 페이지</h1>
	<form method="post" action="/myPage">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type = "text" name ="memberId" value = "${member.memberId}" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type = "text" name ="memberName" value = "${member.memberName}" readonly></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type ="text" name ="memberAge" value = "${member.memberAge}" readonly></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type ="text" name ="memberTel" value = "${member.memberTel}" readonly></td>
			</tr>
		</table>		
		<div>
			<a href = "/modifyMember">회원정보 수정</a>
			<a href = "">예약내역 확인</a>
			<a href = "">보유쿠폰 확인</a>
			<a href = "">작성한 리뷰 보기</a>
			<a href = "">작성한 QnA 보기</a>
			<a href = "">탈퇴하기</a>
		</div>
	</form>
</body>
</html>