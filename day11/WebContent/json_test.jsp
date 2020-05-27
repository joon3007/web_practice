<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 순위</title>
</head>
<body>
	<h1>비동기 통신 결과</h1>
	<table border:"1">
		<tr>
			<td class = "td1"><h2>실시간 검색순위</h2></td>
			<td class = "td2"><div id ="ranking">키워드</div></td>		
		</tr>
	</table>
</body>
<script>
	window.onload = function(){
		var obj = "";
		var word = new Array();
		var ranking = document.getElementById("ranking");
		var xrh = new XMLHttpRequest();
		
		xrh.open("get","data.json",true);
		xrh.send();
		
		xrh.onreadystatechange = function(){
			if(xrh.readyState == 4){
				if(xrh.status == 200){
					obj = JSON.parse(xrh.responseText);
					var str = "";
					for(var i = 0; i<obj.search_word.length; i++){
						str = "["+(i+1)+"]"+obj.search_word[i].name;	
						word[i] = str;
					}
				}
			}
		}
		
		var i =0;
		var interval = setInterval(function(){
			if(i == obj.search_word.length){
				i = 0;
			}
			ranking.innerHTML = "<h3>"+word[i]+"</h3>";
			i++;
		},2000); //2초마다 갱신
		
		setTimeout(function(){
			clearInterval(interval);
		},20000);//20초후 정지
	}
</script>
</html>