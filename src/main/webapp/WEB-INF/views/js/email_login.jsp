<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일로 회원가입</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&display=swap')
	;

body {
	align-items: center;
	height: 1150px;
	margin: 0;
	background-color: white;
	font-family: 'Noto Serif KR', serif;
	color: black;
}

.USER_list {
	background-color: #ffffff;
	padding: 2rem;
	width: 100%;
	max-width: 400px;
}

.USER_list input[type="text"], .USER_list input[type="email"],
	.USER_list input[type="password"], .USER_list select {
	width: calc(100% - 2rem);
	padding: 0.8rem;
	margin: 0.5rem 0;
	box-sizing: border-box;
	border: 1px solid #e4dcd2;
	border-radius: 5px;
	color: #333;
	font-size: 1rem;
	transition: border-color 0.3s;
}

.USER_list input[type="text"]:focus, .USER_list input[type="email"]:focus,
	.USER_list input[type="password"]:focus, .USER_list select:focus {
	border-color: #007bff;
	outline: none;
}

.USER_list button {
	width: calc(100% - 2rem);
	padding: 1rem;
	margin: 1rem 0 0;
	border: none;
	border-radius: 5px;
	background-color: #007bff82;
	color: #ffffff;
	font-weight: bold;
	font-size: 1.1rem;
	cursor: pointer;
	transition: background-color 0.5s;
}

.USER_list button:hover {
	background-color: #007bff;
}

.password-feedback, .nickname-feedback, .phone-feedback,
	.birthday-feedback, .userId-feedback {
	color: red;
	font-size: 0.9rem;
	text-align: left;
}

.toggle-password {
	display: inline-block;
	cursor: pointer;
	font-size: 0.9rem;
	color: #007BFF;
	margin-top: 0.5rem;
}

.USER_list a {
	display: inline-block;
	margin-top: 1rem;
	font-size: 0.9rem;
	color: #3a5a40;
	text-decoration: none;
	transition: color 0.3s;
}

.USER_list a:hover {
	color: black;
	font-weight: bold;
}
/*컨텐츠 section*/
.content_zone {
	width: 100%;
	display: flex;
	justify-content: center;
}

.content_zone .content_zone_wrap {
	width: 100%;
	max-width: 57rem;
	display: flex;
	justify-content: center;
}

/*초기 잡혀있는 헤더 높이 때문에 첫 컨텐츠에는 margin-top을 주고 시작함.*/
.content_zone1 {
	margin-top: 7rem;
}
</style>
<script>
let isUserIdChecked = false;
let verificationCode = null; // 인증 코드 저장 변수

function validatePassword() {
    const password = document.querySelector('input[name="user_pw"]').value;
    const feedback = document.getElementById('password-feedback');
    
    const regexUpper = /[A-Z]/;
    const regexLower = /[a-z]/;
    const regexNumber = /[0-9]/;
    const regexSpecial = /[@$!%*?&]/;

    if (password.length < 8) {
        feedback.textContent = '비밀번호는 최소 8자 이상이어야 합니다.';
        return false;
    } else if (!regexUpper.test(password)) {
        feedback.textContent = '비밀번호는 대문자를 포함해야 합니다.';
        return false;
    } else if (!regexLower.test(password)) {
        feedback.textContent = '비밀번호는 소문자를 포함해야 합니다.';
        return false;
    } else if (!regexNumber.test(password)) {
        feedback.textContent = '비밀번호는 숫자를 포함해야 합니다.';
        return false;
    } else if (!regexSpecial.test(password)) {
        feedback.textContent = '비밀번호는 특수 문자를 포함해야 합니다.';
        return false;
    } else {
        feedback.textContent = ''; 
        return true;
    }
}

function confirmPassword() {
    const password = document.querySelector('input[name="user_pw"]').value;
    const confirmPassword = document.querySelector('input[name="user_pw2"]').value;
    const feedback = document.getElementById('confirm-password-feedback');

    if (password !== confirmPassword) {
        feedback.textContent = '비밀번호가 일치하지 않습니다.';
        return false;
    } else {
        feedback.textContent = ''; 
        return true;
    }
}

function validatePhoneNumber() {
    const phoneNumber = document.querySelector('input[name="tel"]').value;
    const feedback = document.getElementById('phone-feedback');
    
    const regexPhone = /^010-\d{4}-\d{4}$/;

    if (!regexPhone.test(phoneNumber)) {
        feedback.textContent = '전화번호 형식이 올바르지 않습니다. 010-1234-5678 형식으로 입력하세요.';
        return false;
    } else {
        feedback.textContent = ''; 
        return true;
    }
}

function validateBirthday() {
    let birthday = document.querySelector('input[name="birthday"]').value;
    const feedback = document.getElementById('birthday-feedback');
    
    // Remove all non-numeric characters from the input
    birthday = birthday.replace(/\D/g, '');

    if (birthday.length !== 8) {
        feedback.textContent = '생년월일은 8자리 숫자로 입력해야 합니다.';
        return false;
    }

    const year = parseInt(birthday.substring(0, 4), 10);
    const month = parseInt(birthday.substring(4, 6), 10);
    const day = parseInt(birthday.substring(6, 8), 10);

    if (month < 1 || month > 12) {
        feedback.textContent = '월은 1부터 12 사이의 숫자여야 합니다.';
        return false;
    }

    const daysInMonth = new Date(year, month, 0).getDate();

    if (day < 1 || day > daysInMonth) {
        feedback.textContent = '해당 월의 유효한 날짜가 아닙니다.';
        return false;
    }

    feedback.textContent = ''; 
    return true;
}

function validateNickname() {
    const nickname = document.querySelector('input[name="user_name"]').value;
    const feedback = document.getElementById('nickname-feedback');

    const regexHangul = /[가-힣]/;

    if (nickname.match(/^[ㄱ-ㅎ]*$/) && !regexHangul.test(nickname)) {
        feedback.textContent = '별명에 한글 초성을 포함할 수 없습니다.';
        return false;
    } else {
        feedback.textContent = ''; 
        return true;
    }
}

function validateUserId() {
    const userId = document.getElementById('user_id').value;
    const feedback = document.getElementById('userId-feedback');
    
    if (userId.length < 4 || userId.length > 16) {
        feedback.style.color = 'red';
        feedback.textContent = '아이디는 4자 이상, 16자 이하로 입력하세요.';
        return false;
    }
    
    const regex = /^[a-zA-Z][a-zA-Z0-9._-]*$/;
    if (!regex.test(userId)) {
        feedback.style.color = 'red';
        feedback.textContent = '아이디는 영문자로 시작하며, 영문자, 숫자, ., _, -만 포함할 수 있습니다.';
        return false;
    }
    
    const adminId = ["bangbang"]; 
    for (let i = 0; i < adminId.length; i++) {
        if (userId.toLowerCase().includes(adminId[i])) {
            feedback.style.color = 'red';
            feedback.textContent = '아이디에 부적절한 단어가 포함되어 있습니다.';
            return false;
        }
    }

    feedback.style.color = 'green';
    feedback.textContent = '사용 가능한 아이디입니다.';
    return true;
}

function checkDuplicateUserId() {
    const userId = document.getElementById('user_id').value;
    const feedback = document.getElementById('userId-feedback');

    if (!userId) {
        feedback.style.color = 'red';
        feedback.textContent = '아이디를 입력하세요.';
        return;
    }

    const url = '/api/user/check-duplicate?user_id=' + encodeURIComponent(userId);

    fetch(url)
        .then(response => response.json())
        .then(data => {
            if (data.exists) {
                feedback.style.color = 'red';
                feedback.textContent = "중복된 아이디입니다.";
                isUserIdChecked = false; // 중복된 아이디인 경우 체크되지 않음
            } else {
                feedback.style.color = 'green';
                feedback.textContent = "사용 가능한 아이디입니다.";
                isUserIdChecked = true; // 사용 가능한 아이디인 경우 체크됨
            }
        })
        .catch(error => {
            console.error('Fetch error:', error);
            feedback.textContent = "서버 오류가 발생했습니다.";
        });
}

function togglePasswordVisibility() {
    const passwordField = document.querySelector('input[name="user_pw"]');
    const confirmPasswordField = document.querySelector('input[name="user_pw2"]');
    const toggleButton = document.getElementById('togglePassword');
    
    if (passwordField.type === "password") {
        passwordField.type = "text";
        confirmPasswordField.type = "text";
        toggleButton.textContent = "비밀번호 숨기기";
    } else {
        passwordField.type = "password";
        confirmPasswordField.type = "password";
        toggleButton.textContent = "비밀번호 표시";
    }
}

function updateEmail() {
    const emailDomain = document.getElementById('email_domain').value;
    const emailInput = document.getElementById('email');
    const emailDomainHidden = document.getElementById('email_domain_hidden');

    if (emailDomain === 'custom') {
        emailInput.value = '';
        emailInput.placeholder = '직접 입력';
        emailInput.focus();
    } else {
        const currentEmail = emailInput.value.split('@')[0];
        emailInput.value = currentEmail + emailDomain;
        emailInput.placeholder = emailDomain;
    }
    
    emailDomainHidden.value = emailDomain;
}

//이메일 인증 요청 함수
function requestEmailAuth() {
    const emailInput = document.getElementById('email').value;
    fetch('/sendVerificationEmail', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: emailInput })
    })
    .then(data => {
        // 서버에서 받은 인증 코드 저장
        verificationCode = data;
        
        // 인증 코드 입력 필드 및 확인 버튼 활성화
        const authCodeInput = document.getElementById('authCode');
        const verifyAuthCodeBtn = document.getElementById('verifyAuthCode');

        authCodeInput.disabled = false; // 입력 필드 활성화
        verifyAuthCodeBtn.disabled = false; // 인증 확인 버튼 활성화
    })
}

// 인증 코드 확인 함수
/* function verifyAuthCode() {
    const inputCode = document.getElementById('authCode').value;


    // 서버로 인증 코드 검증 요청
    $.ajax({
        type: 'POST',
        url: '/verifyEmailCode',
        data: {
            inputCode: inputCode
        }
    });
} */
//이벤트 리스너 설정
document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('input[name="user_pw"]').addEventListener('input', validatePassword);
    document.querySelector('input[name="user_pw2"]').addEventListener('input', confirmPassword);
    document.querySelector('input[name="tel"]').addEventListener('input', validatePhoneNumber);
    document.querySelector('input[name="birthday"]').addEventListener('input', validateBirthday);
    document.querySelector('input[name="user_name"]').addEventListener('input', validateNickname);
    document.getElementById('user_id').addEventListener('input', validateUserId);
    document.getElementById('togglePassword').addEventListener('click', togglePasswordVisibility);

    // 이메일 인증 요청 버튼 이벤트 리스너
    const verifyEmailBtn = document.getElementById('verifyEmailBtn');
    if (verifyEmailBtn) {
        verifyEmailBtn.addEventListener('click', requestEmailAuth);
    } else {
        console.error('verifyEmailBtn 요소를 찾을 수 없습니다.');
    }

    // 인증 확인 버튼 이벤트 리스너 추가
    const verifyAuthCodeBtn = document.getElementById('verifyAuthCode');
    if (verifyAuthCodeBtn) {
        verifyAuthCodeBtn.addEventListener('click', verifyAuthCode); // verifyAuthCode 함수 연결
    } else {
        console.error('verifyAuthCodeBtn 요소를 찾을 수 없습니다.');
    }

    // 인증 확인 버튼 비활성화 상태로 시작
    verifyAuthCodeBtn.disabled = true;

    // 아이디 중복 확인 버튼 이벤트 리스너 추가
    const checkIdBtn = document.getElementById('checkIdBtn');
    if (checkIdBtn) {
        checkIdBtn.addEventListener('click', function() {
            if (validateUserId()) {
                checkIdDuplicate(); // 유효성 검사가 통과하면 중복 확인 함수 호출
            }
        });
    } else {
        console.error('checkIdBtn 요소를 찾을 수 없습니다.');
    }
});
</script>



</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="content_zone content_zone1">
		<div class="content_zone_wrap">
			<div class="USER_list">
				<form action="/USER_listDB" method="post">
					별명 <input type="text" name="user_name" required><br>
					<div id="nickname-feedback" class="nickname-feedback"></div>
					이메일
					<div class="email-container">
						<input type="text" id="email" name="email" required
							placeholder="사용자 입력 부분"> <select id="email_domain"
							onchange="updateEmail()">
							<option value="">이메일 도메인 선택</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="@daum.net">daum.net</option>
							<option value="@naver.com">naver.com</option>
							<option value="custom">직접 입력</option>
						</select>
						<input type="button" value="인증하기" class="btn btn-primary"id="verifyEmailBtn" >
						<input type="hidden" id="email_domain_hidden" name="email_domain_hidden">
					</div>
					<input placeholder="인증 코드 6자리를 입력해주세요." maxlength="6" id="authCode"type="text" disabled>
					<input type="button" value="인증 확인" id="verifyAuthCode" disabled>
					<br>
					아이디 <input type="text" id="user_id" name="user_id" required><br>
					<button type="button" onclick="if (validateUserId()) { checkDuplicateUserId() }">중복확인</button><br>
					<div id="userId-feedback" class="userId-feedback"></div>
					비밀번호 <input type="password" name="user_pw"placeholder="최소 8자, 대소문자, 숫자, 특수문자 포함" required><br>
					<div id="password-feedback" class="password-feedback"></div>
					비밀번호 확인 <input type="password" name="user_pw2"placeholder="비밀번호 확인" required><br>
					<div id="confirm-password-feedback" class="password-feedback"></div>
					<span id="togglePassword" class="toggle-password" onclick="togglePasswordVisibility()">비밀번호 표시</span><br>
					휴대전화번호 <input type="text" name="tel" placeholder="010-1234-5678"required><br>
					<div id="phone-feedback" class="phone-feedback"></div>
					성별<br> <select id="gender" name="gender">
						<option value="m">남</option>
						<option value="f">여</option>
						</select><br>
					생년월일 <input type="text" name="birthday"	placeholder="20000101" required><br>
					<div id="birthday-feedback" class="birthday-feedback"></div>
					<input type="hidden" name="authority" value="0"><br>
					<button type="submit">회원 가입</button>
				</form>
				<br> <a href="/login">뒤로가기</a>
			</div>
		</div>
	</section>
	    <!-- 스크립트를 body 끝에 위치 -->
    <script>
    function verifyAuthCode() {
        const inputCode = document.getElementById('authCode').value;

        // 서버로 인증 코드 검증 요청
        fetch('/verifyEmailCode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({ inputCode: inputCode })
        })
        .then(response => response.json())
        .then(isVerified => {
            if (isVerified) {
                alert("인증이 성공했습니다!");
                // 인증 성공 시 버튼 비활성화
                document.getElementById('verifyAuthCode').disabled = true;
            } else {
                alert("인증 코드가 일치하지 않습니다.");
            }
        })
        .catch(error => {
            console.error('인증 코드 확인 실패:', error);
        });
    }
    </script>
	
</body>
</html>
