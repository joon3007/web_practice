<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join complete</title>
</head>
<body>
<%
	String name = "";
	String cook = request.getHeader("Cookie");
	if(cook != null){
		Cookie[] cookies = request.getCookies();
		for(Cookie data : cookies){
			if(data.getName().equals("name")){
				name = data.getValue();				
			}
		}
	}
%>
<%=name%>님 회원가입이 완료되었습니다.
</body>
</html>