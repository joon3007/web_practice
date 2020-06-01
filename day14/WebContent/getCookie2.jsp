<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 출력 및 삭제</title>
</head>
<body>
<%
	String cookie_check = request.getHeader("Cookie");
	
	String name = null;
	String value = null;
	
	if(cookie_check != null){
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("id")){
				name = cookie.getName();
				value = cookie.getValue();
			}
		}
%>
	<p><%=name %> : <%=value %></p>
<%
		for(Cookie cookie : cookies){
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
%>
	<a href="delete_check.jsp">쿠키 삭제 유무 확인</a>
</body>
</html>













