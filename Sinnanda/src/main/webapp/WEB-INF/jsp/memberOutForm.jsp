<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member out form</title>
</head>
<body>
	<form method="post" action="/insertMemberOut">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="hidden" name="memberId" value="member">member</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>탈퇴 사유</td>
				<td>
					<select id="outReason" name="outReason">
						<option value="기타" selected>기타</option>
						<option value="서비스 불친절">서비스 불친절</option>
						<option value="서비스 이용 불편">서비스 이용 불편</option>
					</select>
				</td>
			</tr>								
		</table>
		<button type="submit">탈퇴</button>
	</form>
</body>
</html>