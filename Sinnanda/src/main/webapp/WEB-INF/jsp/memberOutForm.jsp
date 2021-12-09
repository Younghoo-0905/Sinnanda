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
						<option value="1">서비스 불만족</option>
						<option value="2">숙소가 다양하지 않음</option>
						<option value="3">관리자가 맘에 안듬</option>
					</select>
				</td>
			</tr>								
		</table>
		<button type="submit">탈퇴</button>
	</form>
</body>
</html>