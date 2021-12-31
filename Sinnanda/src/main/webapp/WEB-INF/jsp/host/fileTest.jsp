<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form onsubmit="return formCheck()" id="addHostQnaForm" action="addHostQna" method="post" enctype="multipart/form-data">
<table>
	<tr>
			<th>파일 업로드</th>
			<td>
				<input id="hostQnaUploadFile" name="hostQnaUploadFile" type="file">
			</td>
		</tr>
	</table>
</form>

</body>
</html>