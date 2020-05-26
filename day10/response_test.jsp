<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 내장객체 테스트</title>
</head>
<body>
	<h1>GET 방식의 요청</h1>
	<form action="request_response.jsp" method="get">
		<input type="text" value="Seoul" name="city" readonly>
		<input type="text" value="06141" name="zipcode" readonly>
		<button type="submit">GET 방식으로 요청 보내기</button>
	</form>
</body>
</html>









