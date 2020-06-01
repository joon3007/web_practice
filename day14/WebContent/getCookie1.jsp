<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 출력 및 수정</title>
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
				if(cookie.getName().equals("id")){
					Cookie new_cookie = new Cookie("id", "banana");
					response.addCookie(new_cookie);
				}
			}
		}
	%>

	<a href="getCookie2.jsp">수정된 쿠키 값 출력하기</a>

</body>
</html>











