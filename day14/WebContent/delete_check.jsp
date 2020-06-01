<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 유무 확인</title>
</head>
<body>
	<%
		String cookie_check = request.getHeader("Cookie");
		
		if(cookie_check != null){
			out.println("쿠키가 남아 있습니다.");
		}else{
			out.println("쿠키가 삭제 되었습니다.");
		}
	%>
</body>
</html>




