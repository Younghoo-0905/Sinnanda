<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<form method="post" action ="/modifyMember">
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
				<td>비밀번호</td>
				<td><input type ="password" name ="memberPw"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type ="text" name ="memberAge" value = "${member.memberAge}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type ="text" name ="memberTel" value = "${member.memberTel}"></td>
			</tr>
		</table>
		<button type = "submit">수정하기</button>
	</form>
</body>
</html>