/**
 * formSubmit() 회원가입 필수항목 검사
 * checkid(id) 회원가입 아이디 중복검사
 */
	function formSubmit() {

		var form = document.joinForm;
		if ('' == form.member_id.value || !check) {
			alert('아이디를 확인해주세요.');
			form.member_id.focus();
			return false;

		} else if ('' == form.member_pw.value) {
			alert('비밀번호를 입력해주세요.');
			form.member_pw.focus();
			return false;

		} else if ('' == form.member_name.value) {
			alert('이름을 입력해주세요.');
			form.member_name.focus();
			return false;

		} else if ('' == form.member_age.value) {
			alert('나이를 입력해주세요.');
			form.member_age.focus();
			return false;

		} else if ('' == form.member_email.value) {
			alert('이메일를 입력해주세요.');
			form.member_email.focus();
			return false;
		}

		form.submit();
	}