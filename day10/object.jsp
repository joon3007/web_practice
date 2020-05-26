<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 예제</title>
</head>
<body>
	<form action="object_ok.jsp" method="get" name="join">
		<fieldset>
			<legend>개인 정보</legend>
			<input type="text" name="name">
			<input type="date" name="birthday">
			<input type="button" value="확인" onclick="sendit()"> 
		</fieldset>
	</form>
</body>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$("input[name='name']").click(function(){
		$("input[name='name']").removeAttr('style');
		$("input[name='name']").removeAttr('placeholder');
		
	})
	
	$("input[name='birthday']").click(function(){
		$("input[name='birthday']").removeAttr('style');
	})
	

	function sendit(){
		var frm = document.join;
		
		if(frm.name.value == ""){
			$("input[name='name']").css('border-color', 'red');
			$("input[name='name']").attr('placeholder', '성함을 입력하세요');
			return false;
		}
		
		if(frm.birthday.value == ""){
			$("input[name='birthday']").css('border-color', 'red');
			return false;
		}
		
		frm.submit();
		
	}
</script>
</html>











