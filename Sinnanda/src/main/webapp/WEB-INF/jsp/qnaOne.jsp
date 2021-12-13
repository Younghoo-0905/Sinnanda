<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세 페이지</title>
</head>
<body>
	<h1>QnA One</h1>
	<div>
		<a href="index">홈 화면</a>
	</div>
	<!-- 상단 버튼 -->
		<!-- 로그인 정보가 없는 경우 -->
	<c:if test="${loginMember == null}">
		<div>
			<a href="login">로그인하기</a>
			<a href="insertMemberForm">회원가입</a>
		</div>
	</c:if>
		<!-- 로그인 정보가 있는 경우 -->
	<c:if test="${loginMember != null}">
		<div>
			<a href="마이페이지?memberNo=${loginMember.memberNo}">${loginMember.memberName}</a>
			<a href="logout">로그아웃</a>
		</div>
	</c:if>
	<!--  -->
	<c:if test="${qna.memberNo == loginMember.memberNo}">
		<a href="modifyQna?qnaNo=${qna.qnaNo}">문의 수정</a>
		<a href="removeQna?qnaNo=${qna.qnaNo}">문의 삭제</a>
	</c:if>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${qna.qnaTitle}</td>
			<td>작성일</td>
			<td>${qna.updateDate}</td>
		</tr>
		<tr>
			<td>비밀글 여부</td>
			<td>${qna.qnaSecret}</td>
			<td>문의한 회원</td>
			<td>${qna.memberName}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${qna.qnaContent}</td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>답변 작성자</td>
			<td>답변 내용</td>
			<td>답변 작성일</td>
		</tr>
		<tr>
			<td>${qna.adminName}</td>
			<td>${qna.qnaComments.qnaCommentContent}</td>
			<td>${qna.qnaComments.commentDate}</td>
		</tr>
	</table>
</body>
</html>