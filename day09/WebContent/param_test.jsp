<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param 예제</title>
</head>
<body>
	<h3>param 액션 태그</h3>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:forward page="paramP.jsp">
		<jsp:param value="admin" name="id"/>
		<jsp:param value="관리자" name="name"/>
	</jsp:forward>
	
	
</body>
</html>