<%@page import="java.util.ArrayList"%>
<%@page import="com.koreait.beans.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>name & birthday info</title>
</head>
<body>
	<%-- <jsp:useBean class="com.koreait.beans.MemberBean" id="m_vo"/> --%>
	
<%-- 	<jsp:setProperty property="name" name="m_vo" value="김휘준"/>
	<jsp:setProperty property="birthday" name="m_vo" value="12월 4일"/>
	
	<p><jsp:getProperty property="name" name="m_vo"/>
	<jsp:getProperty property="birthday" name="m_vo"/></p> --%>
	
	<jsp:useBean class = "com.koreait.beans.MemberDAO" id="m_dao"></jsp:useBean>
	
	<table border="1">
		<%
			ArrayList<MemberBean> members = m_dao.select("김휘준");
			for(MemberBean member : members){
				
		%>
		<tr>
			<td><%= member.getName() %></td>
			<td><%= member.getBirthday() %></td>
		</tr>
		<%
		}
		%>
		
	</table>
</body>
</html>