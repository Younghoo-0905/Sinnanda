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
	<h1>관리자 수정</h1>
	 
	<form id="adminForm" method ="post" action ="modifyAdminOne">
	<table>
		<tr>
			<td>관리자ID</td>
			<td><input type ="text" name ="adminId" value="${loginUser.admin.adminId}" id ="adminId" readonly></td>
		</tr>
		<tr>
			<td>관리자PW</td>
			<td><input type ="password" name ="adminPw" id ="adminPw" placeholder ="adminPw"></td>
		</tr>
	</table>
         <button onclick="return chk_form()">수정</button>
	</form>
	<script>
		function chk_form() {
	
		if(document.getElementById("adminPw").value==''){
			alert("비밀번호를 입력해주십시오.");
			return false;
		}if(${admin.adminPw} != document.getElementById("adminPw").value){
			alert("비밀번호를 다시 입력해 주세요");
			return false;
		}
		
			document.getElementById("adminForm").submit();
}
	</script>
</body>
</html>