<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[유동진] 비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<form id="pwForm" method="post" action ="/modifyMemberPw">
	<input type = "hidden" name ="memberNo" value = "${loginUser.member.memberNo}">
	<table border="1">
		<tr>
			<td>현재 비밀번호</td>
			<td><input type = "password" name ="memberPw" id="memberPw" placeholder="현재 비밀번호 입력"></td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td><input type = "password" name ="newMemberPw" id="newMemberPw" placeholder="새로운 비밀번호 입력"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type = "password" name ="newMemberPw2" id="newMemberPw2" placeholder="새로운 비밀번호 확인"></td>
		</tr>
	</table>
	<button id="pwBtn" type = "button">변경하기</button>
	<button type = "reset">다시입력</button>
	<a href="myPage?memberNo=${loginUser.member.memberNo}">마이페이지</a>
	</form>
	
	<!-- [유동진] 유효성검사 -->
	<script>
		// 현재 비밀번호가 일치하는지 확인(미완성)
		
		// 새로운 비밀번호 설정 및 일치하는지 확인		
		$('#pwBtn').click(function(){
			if($('#newMemberPw').val()==''){
				alert("새로운 비밀번호를 입력하세요.");
				return false;
			} else if($('#newMemberPw').val() != $('#newMemberPw2').val()) {
			      alert('비밀번호가 일치하지 않습니다.');
			      return;
			   } else {
			      $('#pwForm').submit();
			   }
			});
	</script>
</body>
</html>