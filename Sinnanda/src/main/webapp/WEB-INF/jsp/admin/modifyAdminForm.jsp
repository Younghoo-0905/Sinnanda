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
	<form method ="post" action ="modifyAdminForm" id ="adminForm">
		<table>
			<tr>
				<td><input type ="hidden" name ="adminNo" value ="${loginUser.admin.adminNo}" ></td>
			</tr>
			<tr>
				<td>관리자 아이디</td>
				<td><input type ="text" name ="adminId" value ="${admin.adminId}"  id="adminId" readonly></td>
			<tr>
			<tr>
				<td>관리자 비번 변경</td>
				<td><input type ="password" name ="adminPw" id ="adminPw1" value ="${admin.adminPw}"></td>
			<tr>
			<tr>
				<td>관리자 비번 확인</td>
				<td><input type ="password" id ="adminPw2"></td>
			<tr>
			<tr>
				<td>관리자 이름 </td>
				<td><input type ="text" name ="adminName" value="${admin.adminName}"id ="adminName"></td>
			<tr>
			<tr>
				<td>관리자 직책 </td>
				<td><input type ="text" name ="adminPosition" value="${admin.adminPosition}" readonly></td>
			<tr>
			
		</table>
		  <button onclick="return chk_form()">수정</button>
	</form>	
	<script>
		function chk_form() {
	
		if(document.getElementById("adminPw1").value==''){
			alert("비밀번호를 입력해주십시오.");
			return false;
		}if(document.getElementById("adminPw1").value != document.getElementById("adminPw2").value){
			alert("비밀번호를 맞춰주세요");
			return false;
		}if(document.getElementById("adminName").value==''){
			alert("이름을 적어주세요");
			return false;
		}
		
			document.getElementById("adminForm").submit();
}
	</script>
	
</body>
</html>