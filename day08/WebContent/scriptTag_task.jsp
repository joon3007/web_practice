<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 실습</title>
</head>
<body>

	<table border="1">
		<%! int count = 0; %>
		<%
			for(int i = 0; i<5;i++){
				count++;
		%>
		<tr><%		
				for(int j =0; j<i+1;j++){
			%>
			<td><%=count%>행<%=j+1%>열</td>
			
		
		<%	
			
				}
		%>
		</tr>
		<%
			}
		%>

		<%
			for(int i = 4; i >= 0;i--){
				count++;
		%>
		<tr><%		
				for(int j =0; j < i+1;j++){
			%>
			<td><%=count%>행<%=j+1%>열</td>
		
		<%	
				}
		%>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>