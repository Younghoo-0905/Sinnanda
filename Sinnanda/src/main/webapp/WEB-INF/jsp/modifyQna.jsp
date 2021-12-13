<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 작성 페이지</title>
</head>
<body>
	<h1>modify QnA</h1>
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
	<form id="modifyQnaForm" action="modifyQna" method="post">
		<input id="qnaNo" name="qnaNo" type="hidden" value="${qna.qnaNo}">
		<input id="memberNo" name="memberNo" type="hidden" value="${qna.memberNo}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input id="qnaTitle" name="qnaTitle" type="text" value="${qna.qnaTitle}"></td>
				<td>작성일</td>
				<td>${qna.updateDate}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${qna.qnaCategory}</td>
				<td>비밀글 여부</td>
				<td>
					<c:if test="${qna.qnaSecret == '일반문의'}">
						<input id="qnaSecret" name="qnaSecret" type="checkbox">
					</c:if>
					<c:if test="${qna.qnaSecret == '비밀문의'}">
						<input id="qnaSecret" name="qnaSecret" type="checkbox" checked="checked">
					</c:if>
				</td>
			</tr>
			<tr>
				<td>문의 내용</td>
				<td colspan="3">
					<textarea id="qnaContent" name="qnaContent" cols="30" rows="5">${qna.qnaContent}</textarea>
				</td>
			</tr>
		</table>
		<button id="modifyQnaBtn" type="submit">수정</button>
	</form>
</body>
</html>