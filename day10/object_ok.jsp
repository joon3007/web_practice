<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		out.print(request.getParameter("name"));
		out.print(request.getParameter("birthday"));
	%>
</body>
</html>












