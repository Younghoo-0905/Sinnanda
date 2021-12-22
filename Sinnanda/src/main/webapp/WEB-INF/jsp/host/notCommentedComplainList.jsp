<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컴플레인 목록</title>
</head>
<body>
	<h1>( 대충 사업자 정보 ) 답변못한 컴플레인 리스트</h1>
	<table border="1">
		<tr>
			<td>작성자</td>
			<td>category</td>
			<td>complain Title</td>
			<td>작성일</td>
		</tr>
		<c:if test="${empty complainList}">
			<tr>
				<td colspan="4">없음</td>
			</tr>
		</c:if>
		<c:forEach var="c" items="${complainList}">
			<tr>
				<td>${c.memberName}</td>
				<td>${c.complainCategory}</td>
				<td><a href="/host/complainOne?complainNo=${c.complainNo}">${c.complainTitle}</a></td>
				<td>${c.createDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>