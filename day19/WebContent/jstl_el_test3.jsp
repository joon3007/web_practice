<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL TEST3(제어문 - 반복문)</title>
</head>
<body>
	<h2>JSTL TEST3(제어문 - 반복문)</h2>
	forEach 연습결과
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:out value="${i}"/> &nbsp;&nbsp;
	</c:forEach>
	
	<br>
	<!-- 입력받은 단수로 구구단 출력(1단 ~ 100단) -->
	<form name="gugudan">
		단수 : <input type="text" name="dan" placeholder="정수 입력">
		<input type="button" value="확인" onclick="sendit()">
	</form>
	<c:set var = "dan" value="${param.dan}" scope="page"/>
	<c:choose>
		<c:when test="${dan > 0 and dan < 101}">
			<c:forEach var="i" begin="1" end="9" step="1">
				${dan} * ${i} = ${dan * i}<br>
			</c:forEach>
		</c:when>
		<c:otherwise>
			1이상 100이하의 값으로 입력해주세요.<br>
		</c:otherwise>
	</c:choose>
	<hr>
	<%
		HashMap map = new HashMap<>();
		map.put("name", "홍길동");
		map.put("today", new SimpleDateFormat("MM월 dd일").format(new Date()));
	%>
	<c:set var="m" value="<%=map%>"/>	
	<c:forEach var="i" items="${m}">
		${i.key} &nbsp;:&nbsp;${i.value}<br>
	</c:forEach>
	<hr>	
	<c:set var="arData" value="<%=new int[]{1,2,3,4,5}%>"/>
	<c:forEach var="i" items="${arData}">
		${i} &nbsp;
	</c:forEach>
</body>
<script>
	function sendit(){
		var frm = document.getElementsByName("gugudan")[0];
		//if(isNaN(frm.dan.value) || frm.dan.value == ""){

		//Number.isInteger(정수) : 참
		//parseInt(문자열값) : NaN이라는 값이 나온다.
		//parseInt("정수값") : 정수로 형변환이 된다.
		if(!Number.isInteger(parseInt(frm.dan.value)) || frm.dan.value == ""){
			alert("정수만 입력해주세요");
			return false;
		}
		frm.submit();
	}

</script>
</html>












