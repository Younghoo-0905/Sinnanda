<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member out form</title>
</head>
<body>
	<form method="post" action="/memberOut">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="hidden" name="memberId" value=""></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>탈퇴 사유</td>
				<td><input type="text" name="outReason"></td>
			</tr>								
		</table>
	</form>
</body>
</html>