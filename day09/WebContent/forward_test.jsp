<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 forward</title>
</head>
<!-- forward는 사용하자 마자 바로 해당 페이지가 열린다. -->
<!-- 따라서 기능 구현하는 곳에서 forward를 사용한다. -->
<body>
	<form action="controller.jsp">
		<select name="site">
			<option value="naver">네이버</option>
			<option value="google">구글</option>
			<option value="daum">다음</option>
		</select>
		<input type ="submit" value="전송">
	</form>
</body>
</html>