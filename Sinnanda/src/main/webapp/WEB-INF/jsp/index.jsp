<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<title>신난다</title>
 </head>
<body>
 
    <a href="index">신난다</a>
  <!-- 작은 카테고리 -->
  <div>
  	<ul>
  		<li><a href ="/index">home</a></li>
  		<li><a href ="">Qna</a></li>
  		<li><a href ="">공지사항</a></li>
  		<li><a href ="">메인페이지</a></li>
  		<li><a href ="">로그인</a></li>
  		<li><a href ="">회원가입</a></li>
  		<li><a href=""> 쿠폰함</a></li>
  	</ul>
  </div>
  <!-- 부제목  -->
  <h2>여행이 신난다</h2>
 
   <form>
  <!-- 위치가 어딘지 -->
  <div>
  <select name ="">
  	<option value ="seoul">서울</option>
  	<option value =""></option>
  	<option value =""></option>
  	<option value =""></option>
  </select>
  <!--날짜가 언제인지  -->
 
 <!-- 인원수 -->
 	<select>
 		<option value ="onePeople">1명</option>
 		<option value ="twoPeople">2명</option>
 		<option value ="threePeople">3명</option>
 		<option value ="fourPeople">4명</option>
 	</select>
 	<!--침대 개수 -->
 	<select>
 		<option value ="onebed">침대 하나</option>
 		<option value ="twobed">침대 두개</option>
 		<option value ="QueenOnebed">퀸 침대 하나</option>
 		<option value ="QueenTwobed">퀸 침대 두개</option>
 		<option value ="...">.....</option>
 	</select>
   <button type ="submit">검색이다</button>
  </div>
 </form>
  
  <!--모텔인지 호텔인지 세부 사항 -->
    <span ><a href="#">모탤</a></span>
    <span ><a href="#">호텔</a></span> 
	<span ><a href="#">홈</a></span> 
    <span ><a href="#">.....</a></span>
    
    
    <!--공지사항 -->
    <h3>공지사항</h3>
    
    <!-- 별점이 높은 숙소 -->
    <h3>별점이 신난다</h3>
    
    <!-- 방문이 많은 숙소 -->
    <h3>방문이 신난다</h3>
    
    <!-- 관리자가 추천하는숙소  -->
  	 <h3>추천이 신난다</h3>
</body>
</html>