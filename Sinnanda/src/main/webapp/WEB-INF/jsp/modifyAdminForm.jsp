<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 정보수정</h1>
	<form method ="post" action ="modifyAdminForm">
		<table>
			<tr>
				<td>관리자 아이디</td>
				<td><input type ="text" name ="adminId" value ="${admin.adminId}"  id="adminId" readonly></td>
			<tr>
			<tr>
				<td>관리자 비번 변경</td>
				<td><input type ="password" name ="adminPw" id ="adminPw1"></td>
			<tr>
			<tr>
				<td>관리자 비번 확인</td>
				<td><input type ="password" name ="adminPw" id ="adminPw2"></td>
			<tr>
			<tr>
				<td>관리자 이름 </td>
				<td><input type ="text" name ="adminName" value="${admin.adminName}"id ="adminName"></td>
			<tr>
			<tr>
				<td>관리자 직책 </td>
				<td><input type ="text" name ="adminName" value="${admin.adminPosition}" readonly></td>
			<tr>
			
		</table>
	</form>	
</body>
</html>