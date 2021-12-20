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
	${loginUser.member.memberPw}
	<form id="nowMemberPw" method ="post" action ="checkMemberPw">
		<div>비밀번호 확인 </div>
		<div><input type ="hidden" name ="memberNo" value="${loginUser.member.memberNo}"></div>
		<div><input type ="password" name ="memberPw" id ="memberPw" placeholder ="비밀번호를 입력하세요"></div>
	<button onclick="return chk_form()">확인</button>
	<a href="myPage?memberNo=${loginUser.member.memberNo}">마이페이지</a>
	</form>
	
	<script>
		function chk_form() {
	
		if(document.getElementById("memberPw").value==''){
			alert("비밀번호를 입력해주세요.");
			return false;
		}if(${loginUser.member.memberPw} != document.getElementById("memberPw").value){
			alert("비밀번호가 일치하지 않습니다! 다시 입력해주세요.");
			return false;
		}
		
			document.getElementById("nowMemberPw").submit();
	}
	</script>
	</body>
</html>