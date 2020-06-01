<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 처리</title>
</head>
<body>
	<%
		if(session.getAttribute("userid") != null){
			//session.removeAttribute("userid");
			session.invalidate();
			response.sendRedirect("login_session.jsp");
		}
	%>
</body>
</html>







