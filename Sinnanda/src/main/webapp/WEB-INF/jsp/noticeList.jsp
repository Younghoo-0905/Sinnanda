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
	<c:if test="${loginUser.userLevel == 3}">
		<div>
			<a href="/admin/addNotice">공지사항 작성</a>
		</div>
	</c:if>
	<!-- 공지사항 카테고리 입력 -->	
	<div>
		<select id="noticeCategory" name="noticeCategory" onchange="location.href=this.value">
			<option value="">선택</option>
			<option value="/noticeList?noticeCategory=전체">전체문의</option>
			<option value="/noticeList?noticeCategory=기타">기타</option>
			<option value="/noticeList?noticeCategory=정보">정보</option>
			<option value="/noticeList?noticeCategory=시스템">시스템</option>
			<option value="/noticeList?noticeCategory=이벤트">이벤트</option>
			<option value="/noticeList?noticeCategory=뉴스">뉴스</option>
		</select>
	</div>
	<table border="1">
		<tr style="text-align:center">
			<td width="5%">번호</td>
			<td width="50%">제목</td>
			<td width="10%">공지유형</td>
			<td width="15%">작성자</td>
			<td width="10%">작성일</td>
		</tr>
		<c:forEach items="${noticeList}" var="n">
			<tr>
				<td style="text-align:center">${n.noticeNo}</td>
				<td>
					<a href="/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
				</td>
				<td style="text-align:center">${n.noticeCategory}</td>
				<td style="text-align:center">${n.adminName}</td>
				<td style="text-align:center">
					<fmt:parseDate value="${n.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
					<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	
		<!-- [김영후] Paging -->	
			
	<div class="pagination">
	
		<!-- '이전' 버튼 -->
		<c:if test="${beginRow > ROW_PER_PAGE}">
			<a href="noticeList?currentPage=${currentPage-1}&noticeCategory=${noticeCategory}">[이전]</a>
		</c:if>
		
		<!-- Page 번호 -->
		<c:set var="doneLoop" value="false"></c:set>
		<c:forEach var="i" begin="${pageNo + 1}" end="${pageNo + 10}">
		
			<!-- Page 숫자 10개 출력 -->
			<c:if test="${not doneLoop}">
				<c:choose>
					<c:when test="${currentPage} == i">				
						<a class="active" href="/noticeList?currentPage=${i}&noticeCategory=${noticeCategory}">[${i}]</a>
					</c:when>
    				<c:otherwise>
						<a href="/noticeList?currentPage=${i}&noticeCategory=${noticeCategory}">[${i}]</a>	
					</c:otherwise>		
				</c:choose>
				<!-- LastPage이면 다음 페이지 번호를 출력하지 않는다 -->
				<c:if test="${i == lastPage}">
					<c:set var="doneLoop" value="true"></c:set>
				</c:if>
			</c:if>
		</c:forEach>
		
		<!-- '다음' 버튼 -->
		<c:if test="${currentPage != lastPage}">
			<a href="noticeList?currentPage=${currentPage+1}&noticeCategory=${noticeCategory}">[다음]</a>
		</c:if>
	</div>
</body>
</html>