<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[유동진] 비밀번호 변경전 현재 비밀번호 확인</title>
</head>
<body>
	<h1>현재 비밀번호 확인</h1>
	<form id="nowMemberPw" method ="post" action ="checkMemberPw">
		<div>비밀번호를 확인 </div>
		<div><input type ="hidden" name ="memberNo" value="${loginUser.member.memberNo}"></div>
		<div><input type ="password" name ="memberPw" id ="memberPw" placeholder ="비밀번호를 입력하세요"></div>
	<button onclick="return chk_form()">확인</button>
	</form>
	
	<script>
		function chk_form() {
	
		if(document.getElementById("memberPw").value==''){
			alert("비밀번호를 입력해주십시오.");
			return false;
		}if(${loginUser.member.memberPw} != document.getElementById("memberPw").value){
			alert("비밀번호를 다시 입력해 주세요");
			return false;
		}
		
			document.getElementById("nowMemberPw").submit();
	}
	</script>
	</body>
</html>