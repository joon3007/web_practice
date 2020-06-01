<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class= "com.koreait.dao.MemberDAO" id="m_dao"></jsp:useBean>
<%
	String id = request.getParameter("id");
	//DB처리
	if(!m_dao.checkId(id)){
		out.println("ok");		
	}else{
		out.println("not-ok");
	}
	
%>
