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
	<h1>관리자 세부사항</h1>
	<table border="1">
		<tr>
			<td>관리자 아이디 :</td>
			<td>${admin.adminId}</td>
		</tr>
		<tr>
			<td>관리자 이름 :</td>
			<td>${admin.adminName}</td>
		</tr>
		<tr>
			<td>관리자 직급 :</td>
			<td>${admin.adminPosition}</td>
		</tr>
		<tr>
			<td>관리자 레벨 :</td>
			<td>${admin.adminLevel}</td>
		</tr>
		<tr>
			<td>수정 날짜 :</td>
			<td>${admin.updateDate}</td>
		</tr>
	</table>
	<a class="navbar-brand brand-logo mr-5" href="adminPage?adminNo=${loginUser.admin.adminNo }">메인페이지</a>
	<a class="navbar-brand brand-logo mr-5" href="modifyAdminOne?adminNo=${loginUser.admin.adminNo}">수정페이지</a>
</body>
</html>