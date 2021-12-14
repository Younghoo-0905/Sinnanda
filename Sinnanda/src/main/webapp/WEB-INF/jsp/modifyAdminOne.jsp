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
	 <script src="../../vendors/js/vendor.bundle.base.js"></script>
	 <script src="../../js/off-canvas.js"></script>
 	 <script src="../../js/hoverable-collapse.js"></script>
 	 <script src="../../js/template.js"></script>
 	 <script src="../../js/settings.js"></script>
 	 <script src="../../js/todolist.js"></script>
	<script>
		function chk_form() {
	
		if(document.getElementById("adminId").value==''){
			alert("아이디를 입력해주십시오.");
			return false;
		}
		if(document.getElementById("adminPw").value=='' || document.getElementById("adminPw") =! ${loginUser.admin.adminPw}){
			alert("비밀번호를 입력해주십시오.");
			return false;
		}
	}
		
}
	</script>
</body>
</html>