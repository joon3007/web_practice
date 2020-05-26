<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어</title>
</head>
<body>
	<%
		String code = request.getParameter("site");
		String result = null;
		if(code.equals("naver")){
			result = "forward_naver.jsp";
		}else if(code.equals("google")){
			result = "forward_google.jsp";
		}else if(code.equals("daum")){
			result = "forward_daum.jsp";
		}
	%>
	<jsp:forward page="<%=result%>"></jsp:forward>
</body>
</html>