<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	String userid = "";
	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");
	}
	
	if(!userid.equals("")){
%>
	<p><%=userid %>님 환영합니다.</p>
	<a href="logout_session.jsp">로그아웃</a>
<%
	}else{
%>
	<form name="loginForm" action="login_ok.jsp" method="post">
		<p>아이디 : <input type="text" name="userid"></p>
		<p>비밀번호 : <input type="password" name="pwd"></p>
		<p><input type="button" value="로그인" onclick="sendit()"></p>
	</form>
<%
	}
%>
</body>
<script>
	function sendit(){
		var frm = document.loginForm;
		if(frm.userid.value == ""){
			alert("아이디를 입력해주세요");
			frm.userid.focus();
			return false;
		}
		
		if(frm.pwd.value == ""){
			alert("비밀번호를 입력해주세요");
			frm.pwd.focus();
			return false;
		}
		frm.submit();
	}
</script>
</html>











