<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join page</title>
</head>
<body>
	<form name = "joinForm" method="post" action="join_db.jsp">
		<p>
			<label>아이디 : <input type = "text" name="id" placeholder="abcd">
			<!-- <input type="button" value="중복확인" onclick = "checkId(id.value)"> 
			같은 영영안의 태그는 바로 접근할 수 있다.-->			
			</label>
			<input type="button" value="중복확인" onclick = "checkId(joinForm.id.value)">
		</p>
		<p id="text"></p>
		<p>
			<label>이름 : <input type = "text" name="name" placeholder="홍길동"></label>
		</p>	
		<p>
			<label>패스워드: <input type = "password" name="pw"></label>
		</p>	
		<p>
			<label>패스워드 확인 : <input type = "password" name="pw_re"></label>
		</p>	
		<p>
			성별 : <label>남자<input type = "radio" name="gender" value="남자" checked="checked"></label>
			<label>여자<input type = "radio" name="gender" value="여자"></label>
		</p>	
		<p>
			<label>우편번호 : <input type = "text" name="zip_code" class="postcodify_postcode5" readonly="readonly"></label>
			<input type ="button" id ="postcodify_search_button" value="검색">
		</p>	
		<p>
			주소 : <input type= "text" name="address" class="postcodify_address" value="">
		</p>
		<p>
			상세주소: <input type="text" name="address_detail" class="postcodify_details" value="">
		</p>
		<p>
			참고항목: <input type="text" name="address_etc" class="postcodify_extra_info" value="">
		</p>
		<p>
			<label>핸드폰 번호 : <input type="text" name="hp"></label>
		</p>
		<p>
			취미 :<label><input type="checkbox" name="hobby" value= "게임">게임</label>
			<label><input type="checkbox" name="hobby" value = "운동">운동</label>
			<label><input type="checkbox" name="hobby" value = "음악감상">음악감상</label>
			<label><input type="checkbox" name="hobby" value = "여행">여행</label>
			<label><input type="checkbox" name="hobby" value = "영화감상">영화감상</label>
			<label><input type="checkbox" name="hobby" value = "잠자기">잠자기</label>
		</p>
		<p>
		<input type="button" value ="가입" onclick="sendit()">
		</p>
	</form>
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script src="member.js"></script>
<script src=""></script>
</html>