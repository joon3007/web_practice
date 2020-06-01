<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="com.koreait.vo.MemberVO" id ="m_vo"></jsp:useBean>    
<jsp:useBean class="com.koreait.dao.MemberDAO" id ="m_dao"></jsp:useBean>    
<jsp:setProperty property= "*" name="m_vo"/>
<%
/* 	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String gender = request.getParameter("gender");
	String zip_code = request.getParameter("zip_code");
	String address = request.getParameter("address");
	String address_detail = request.getParameter("address_detail");
	String address_etc = request.getParameter("address_etc");
	String hp = request.getParameter("hp");
	String hobby = request.getParameter("hobby"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리(DB)</title>
</head>
<body>
	<% 
		/* out.println(m_vo.getId());
		out.println(m_vo.getPw());
		out.println(m_vo.getName());
		out.println(m_vo.getGender());
		out.println(m_vo.getZip_code());
		out.println(m_vo.getAddress());
		out.println(m_vo.getAddress_detail());
		out.println(m_vo.getAddress_etc());
		out.println(m_vo.getHp());
		for(String data : m_vo.getHobby()){
			out.println(data);		
		} */
		
		//String cook = request.getHeader("Cookie");
		int result = m_dao.join(m_vo.getName(),m_vo.getId(),m_vo.getPw(),m_vo.getGender(),m_vo.getZip_code(),
				m_vo.getAddress(),m_vo.getAddress_detail(), m_vo.getAddress_etc(),m_vo.getHp(),
				m_vo.getHobby());
		
		if(result == 1){
			response.addCookie(new Cookie("name", m_vo.getName()));
			response.sendRedirect("join_ok.jsp");			
		}else{
			%>
			<script>
				alert("회원가입 실패");
			</script>
			<%
			response.sendRedirect("login_session.jsp");
		}
	%>
</body>
</html>