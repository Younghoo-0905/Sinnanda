<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 목록 페이지</title>
</head>
<body>
	<h1>QnA List</h1>
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
	<div>
		<a href="addQna">문의사항 작성</a>
	</div>
	<div>
		<select id="qnaCategory" name="qnaCategory" onchange="location.href=this.value">
			<option value="">선택</option>
			<option value="/qnaList">전체문의</option>
			<option value="/qnaList?qnaCategory=기타문의">기타문의</option>
			<option value="/qnaList?qnaCategory=결제문의">결제문의</option>
			<option value="/qnaList?qnaCategory=이용문의">이용문의</option>
			<option value="/qnaList?qnaCategory=예약문의">예약문의</option>
			<option value="/qnaList?qnaCategory=숙소문의">숙소문의</option>
		</select>
	</div>
	<table border="1">
		<tr style="text-align:center">
			<td width="5%">번호</td>
			<td width="40%">제목</td>
			<td width="10%">문의유형</td>
			<td width="10%">작성자</td>
			<td width="10%">작성일</td>
		</tr>
		<c:forEach items="${qnaList}" var="qna">
			<tr>
				<td style="text-align:center">${qna.qnaNo}</td>
				<td>
					<a href="/qnaOne?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a>
					<c:if test="${qna.qnaSecret == '비밀문의'}">
						<img src="/images/qna/lockImg.png" width="20px" height="20px">
					</c:if>
				</td>
				<td style="text-align:center">${qna.qnaCategory}</td>
				<td style="text-align:center">${qna.memberName}</td>
				<td style="text-align:center">
					<fmt:parseDate value="${qna.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
					<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${currentPage > 1}" >
			<a href="qnaList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:if test="${currentPage < lastPage}" >
			<a href="qnaList?currentPage=${currentPage+1}">다음</a>
		</c:if>
	</div>
</body>
</html>