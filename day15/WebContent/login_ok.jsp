<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class= "com.koreait.dao.MemberDAO" id="m_dao"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 데이터 처리</title>
</head>
<body>
	<%
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		if(m_dao.checkId(userid)){		
			if(m_dao.login(userid, pwd) == 1){
				session.setAttribute("userid", userid);
				response.sendRedirect("login_session.jsp");
			}else{
%>
	<script>
			alert("아이디 또는 패스워드를 확인해주세요.");
			location.href = "login_session.jsp";
	</script>
<%
			}
		}else{
			%>
	<script>
		alert("아이디가 없습니다.");
		locetion.href = "login_session.jsp";
	</script>
<%
		}
	%>
</body>
</html>












