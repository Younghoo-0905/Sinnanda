<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[유동진]마이페이지(회원)</title>
</head>
<body>
	<h1>${member.memberName}님 반갑습니다.</h1>
	<form method="post">
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>나이</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>가입날짜</th>
		</tr>
		<tr>
			<td>${member.memberId}</td>
			<td>${member.memberName}</td>
			<td>${member.memberAge}</td>
			<td>${member.memberTel}</td>
			<td>${member.memberEmail}</td>
			<td>${member.createDate}</td>
		</tr>

	</table>
		<div>
			<a href = "/modifyMember">회원정보 수정</a>
			<a href = "/checkMemberPw?memberNo=${loginUser.member.memberNo}">회원 비밀번호 변경</a>
			<a href = "">예약내역 확인</a>
			<a href = "">보유쿠폰 확인</a>
			<a href = "/myReview">작성한 리뷰 보기</a>
			<a href = "">작성한 QnA 보기</a>
			<a href = "">탈퇴하기</a>
		</div>
		<a href="index">홈으로</a>
	</form>
</body>
</html>