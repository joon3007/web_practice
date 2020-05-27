<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 예제</title>
</head>
<body>
	<h1>GET방식의 요청</h1>
	<button type = "button" onclick="sendRequest()">GET방식으로 요청 보내기!</button>
	<button type = "button" onclick="sendRequestPost()">POST방식으로 요청 보내기!</button>
	<p id="text"></p>
</body>
<script>

	function sendRequest(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","request_ajax.jsp?city=Seoul&zipcode=06141",true);
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				document.getElementById("text").innerHTML = xhr.responseText;
			}
		}
	}
	function sendRequestPost(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST","request_ajax.jsp",true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); // ?가없기 때문에 Header_RECIVED를 인식할 수 없다.
		xhr.send("city=Seoul&zipcode=06141");
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				document.getElementById("text").innerHTML = xhr.responseText;
			}
		}
	}
</script>
</html>