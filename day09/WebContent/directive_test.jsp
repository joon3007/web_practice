<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="myErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directive Tag practice</title>
</head>
<body>
	<%-- info 속성은 주석문의 기능과 같다. --%>
	<%@page info="Data 클래스를 이용한 날짜 출력" %>
	Today is : <%= new Date() %>

	<%
		String str = null;
		str.charAt(0);
	%>
	
	
</body>
</html>