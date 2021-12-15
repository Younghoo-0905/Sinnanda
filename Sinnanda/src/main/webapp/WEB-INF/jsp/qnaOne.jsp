<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    
	<title>문의사항 상세보기</title>
</head>
<body>
	<h1>QnA One</h1>
	<div>
		<a href="index">홈 화면</a>
	</div>
	<!-- 상단 로그인 부분 -->
	<!-- 로그인 정보가 없는 경우 -->
	<c:if test="${loginUser == null}">
		<div>
			<a href="login">로그인하기</a>
			<a href="insertMemberForm">회원가입</a>
		</div>
	</c:if>
	<!-- 회원인 경우 -->
	<c:if test="${loginUser.userLevel == 1}">
		<div>
			<a href="마이페이지?memberNo=${loginUser.member.memberNo}">${loginUser.member.memberName}</a>
			<a href="logout">로그아웃</a>
		</div>
	</c:if>
	<!-- 사업자인 경우 -->
	<c:if test="${loginUser.userLevel == 2}">
		<div>
			<img src="/images/jun_test/hostImg.png" width="20px" height="20px">
			<a href="마이페이지?hostNo=${loginUser.host.hostNo}">${loginUser.host.hostName}</a>
			<a href="logout">로그아웃</a>
		</div>
	</c:if>
	<!-- 관리자인 경우 -->
	<c:if test="${loginUser.userLevel == 3}">
		<div>
			<img src="/images/jun_test/adminImg.png" width="20px" height="20px">
			<a href="마이페이지?adminNo=${loginUser.admin.adminNo}">${loginUser.admin.adminName}</a>
			<a href="logout">로그아웃</a>
		</div>
	</c:if>
	<!-- 글작성자의 수정, 삭제 버튼 -->
	<c:if test="${qna.memberNo == loginUser.member.memberNo}">
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
	
	<!-- QnA 답변이 없을 때 -->
	<c:if test="${qna.qnaComments == null}">
		<div>답변 없음</div>		
	</c:if>
	
	<!-- 답변이 없는데, 어드민일 때 -->
	<c:if test="${loginUser != null}">
		<c:if test="${(qna.qnaComments == null) && (loginUser.userLevel == 3)}">
			<form id="addQnaCommentForm" action="addQnaComment" method="post">
			<input id="qnaNo" name="qnaNo" type="hidden" value="${qna.qnaNo}">
			<input id="adminNo" name="adminNo" type="hidden" value="${loginUser.admin.adminNo}">
			<table border="1">
				<tr>
					<td>문의 답변하기</td>
				</tr>
				<tr>
					<td><textarea id="qnaCommentContent" name="qnaCommentContent" cols="30" rows="5"></textarea></td>
				</tr>
			</table>
			<button id="addQnaCommentBtn" type="submit">답변하기</button>
		</form>
		</c:if>
	</c:if>
	
	<!-- 답변 : 공통, 답변이 있을 때 -->
	<c:if test="${qna.qnaComments != null}">
		<table border="1">
			<tr>
				<td>답변 작성자</td>
				<td>답변 내용</td>
				<td>답변 작성일</td>
				<c:if test="${(loginUser.userLevel == 3)}">
					<td>삭제</td>
				</c:if>
			</tr>
			<tr>
				<td>${qna.adminName}</td>
				<td>${qna.qnaComments.qnaCommentContent}</td>
				<td>${qna.qnaComments.commentDate}</td>
				<c:if test="${(loginUser.userLevel == 3)}">
					<td><a href="removeQnaComment?qnaNo=${qna.qnaNo}">삭제</a></td>
				</c:if>
			</tr>
		</table>
	</c:if>
</body>
</html>