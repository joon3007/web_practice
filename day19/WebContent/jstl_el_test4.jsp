<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL TEST4(문자열 분할)</title>
</head>
<body>
	<h2>JSTL TEST4(문자열 분할)</h2>
	<c:set var="cnt" value="0"/>
	<c:forTokens var="animal" items="horse,tiger,lion" delims=",">
		동물 ${cnt=cnt+1} : <c:out value="${animal}"/><br>
	</c:forTokens>
</body>
</html>











