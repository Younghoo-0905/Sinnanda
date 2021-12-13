<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록 페이지</title>
</head>
<body>
	<h1>Notice List</h1>
	<div>
		<a href="addNotice">공지사항 작성</a>
	</div>
	<table border="1">
		<tr style="text-align:center">
			<td width="5%">번호</td>
			<td width="50%">제목</td>
			<td width="10%">작성자</td>
			<td width="10%">작성일</td>
		</tr>
		<c:forEach items="${noticeList}" var="n">
			<tr>
				<td style="text-align:center">${n.noticeNo}</td>
				<td>
					<a href="/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
				</td>
				<td style="text-align:center">${n.adminName}</td>
				<td style="text-align:center">
					<fmt:parseDate value="${n.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
					<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${currentPage > 1}" >
			<a href="noticeList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:if test="${currentPage < lastPage}" >
			<a href="noticeList?currentPage=${currentPage+1}">다음</a>
		</c:if>
	</div>
</body>
</html>