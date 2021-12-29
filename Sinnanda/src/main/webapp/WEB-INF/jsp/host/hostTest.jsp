<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>다스케테</h1>
	
	<div>${address.addressNo}</div>
	<div>${address.sido}</div>
	<div>${address.sigungu}</div>
	<div>${address.roadName}</div>
	<div>${address.mainBuildingCode}</div>
	<div>${address.subBuildingCode}</div>
	
	<div>${host.hostAddress.addressInfo}</div>
</body>
</html>