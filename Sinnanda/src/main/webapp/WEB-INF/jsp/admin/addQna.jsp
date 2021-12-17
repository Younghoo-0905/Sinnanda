<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 입력</title>
</head>
<body>
	<h1>add QnA</h1>
	<div>
		<a href="index">홈 화면</a>
	</div>
	<!-- 상단 로그인 부분 -->
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
	<a href="/qnaList">문의사항 목록</a>
	<!-- 입력 폼 -->
	<form id="addQnaForm" action="addQna" method="post">
		<!-- QnA 작성자 -->
		<input id="memberNo" name="memberNo" type="hidden" value="${loginMember.memberNo}">
		<table border="1">
			<tr>
				<td style="text-align:right" width="30%">제목</td>
				<td><input id="qnaTitle" name="qnaTitle" type="text"></td>
			</tr>
			<tr>
				<td style="text-align:right">문의유형</td>
				<td>
					<select id="qnaCategory" name="qnaCategory">
						<option value="기타문의">기타문의</option>
						<option value="결제문의">결제문의</option>
						<option value="이용문의">이용문의</option>
						<option value="예약문의">예약문의</option>
						<option value="숙소문의">숙소문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">문의 내용</td>
				<td>
					<textarea id="qnaContent" name="qnaContent" cols="30" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">비밀글 여부</td>
				<td><input id="qnaSecret" name="qnaSecret" type="checkbox"></td>
			</tr>
		</table>
		<button type="submit">문의 추가</button>
	</form>
</body>
</html>