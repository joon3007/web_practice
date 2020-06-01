/*
 회원가입 세부설정
*/

function sendit(){
	var frm = document.joinForm;
	
	if(frm.id.value == ""){
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	
	if(frm.id.value.length < 4 || frm.id.value.length > 16){
		alert("")
	}
	
	if(frm.name.value == ""){
		alert("이름을 입력해주세요")
		frm.id.focus();
		return false;
	}
	if(frm.pw.value == ""){
		alert("패스워드를 입력해주세요")
		frm.id.focus();
		return false;
	}else{
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@#$%^*-]).{8,}$/;
		var hangle_check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(!reg.test(frm.pw.value)){
			alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
			return false;
		}else if(/(\w)\1\1\1/.test(frm.pw.value)){
			alert("같은 문자를 4번 이상 사용하실수 없습니다.");
			return false;
		}else if(frm.pw.value.search(/\s/) != -1){
			console.log(frm.pw.value.search(/\s/));
			alert("비밀번호에 공백이 있습니다.");
			return false;
		}else if(hangle_check.test(frm.pw.value)){
			alert("비밀번호에 한글을 사용할 수 없습니다.")
			return false;
		}
	}
	
	if(frm.pw.value != frm.pw_re.value){
		alert("비밀번호를 확인해주세요.");
		frm.pw_re.focus();
		return false;
	}
	
	if(frm.zip_code.value == ""){
		alert("우편번호를 입력해주세요");
		frm.zip_code.focus();
		return false;
	}
	
	if(frm.address_detail.value == ""){
		alert("상세 주소를 입력해주세요.");
		frm.address_detail.focus();
		return false;
	}
	
	if(frm.hp.value ==""){
		alert("핸드폰 번호를 입력해주세요");
		frm.hp.focus();
		return false;
	}
	
	var cnt = 0;
	for(var i = 0; i< frm.hobby.length; i++){
		if(frm.hobby[i].checked){
			cnt++;
		}
	}
	if(cnt == 0){
		alert("취미를 1개 이상 선택해주세요.");
		return flase;
	}
	
	frm.submit();
}


function checkId(id){
	console.log(id);
	if(id == ""){
		alert("아이디를 입력해주세요.");
	}
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			if(xhr.responseText.trim() == "ok"){
				document.getElementById("text").innerHTML = "사용할 수 있는 아이디 입니다.";
			}else{
				document.getElementById("text").innerHTML = "중복된 아이디 입니다.";				
			}
		}
	}
	xhr.open("GET","idcheck_ajax.jsp?id=" + id, true);
	xhr.send();
}