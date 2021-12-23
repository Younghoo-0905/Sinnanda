<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[유동진] 회원 정보 수정</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<form method="post" action ="/modifyMember">
	<input type = "hidden" name ="memberNo" value = "${loginUser.member.memberNo}">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type = "text" name ="memberId" value = "${loginUser.member.memberId}" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type = "text" name ="memberName" value = "${loginUser.member.memberName}" readonly></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type ="text" name ="memberAge" value = "${loginUser.member.memberAge}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type ="text" name ="memberTel" value = "${loginUser.member.memberTel}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type ="text" name ="memberEmail" value = "${loginUser.member.memberEmail}"></td>
			</tr>
			<tr>
				<td>최근 수정일</td>
				<td><input type ="text" name ="updateDate" value = "${loginUser.member.updateDate}" readonly></td>
			</tr>
		</table>
		<button type = "submit">수정완료</button>
		<a href="myPage?memberNo=${loginUser.member.memberNo}">마이페이지</a>
	</form>
</body>
</html>
