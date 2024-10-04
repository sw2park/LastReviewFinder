<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<style>
	html {
	    font-family: 'Pretendard';
	    }
	* {
	    box-sizing: border-box; /* 모든 요소의 박스 모델을 border-box로 설정 */
		}
	p{
		font-size: 12px;
	}
	input{
		background-color: #e9e9e9;
		border: 2px solid #e9e9e9; /* 테두리 색상 */
	    border-radius: 10px; /* 둥근 테두리 */
	    padding: 10px; /* 내부 여백 */
	    width: 300px; /* 너비 설정 */
	    outline: none; /* 포커스 시 기본 테두리 제거 */
	   }
	
	input:focus {
	    border-color: #f7175a; /* 포커스 시 테두리 색상 변경 */
	   }
	 
	.sendit {
		
		background-color:  #f7175a;
		border: 2px solid  #f7175a; /* 테두리 색상 */
        border-radius: 10px; /* 둥근 테두리 */
        padding: 10px; /* 내부 여백 */
        width:300px; /* 너비 설정 */
        outline: none; /* 포커스 시 기본 테두리 제거 */
        color : #ffffff;
	
	}
	
	.login{
		font-style : bold;
		color : #7e7e7e;
		width: 300px; /* 너비 설정 */
	}
	
	.login a{
		color :  #f7175a;
	}
	
	
	
</style>
</head>
<body>

<form action="/join/join.lo" method="post" name="joinForm">
	<p>
		<label>
			<input type="text" name="userid" id="userid" placeholder="아이디">
		</label>
	</p>
	<p id="idmessage" style="color: #f7175a;"></p>
	<p>
		<label>
			<input type="password" name="userpw" id="userpw" placeholder="비밀번호"/>
		</label>
	</p>
	<p id="pwmessage" style="color: #f7175a;"></p>
	<p>
		<label>
			<input type="text" name="username" id="username" placeholder="이름"/>
		</label>	
	</p>
	<p id="namemessage" style="color: #f7175a;"></p>
	<p> <input type="button" class="sendit" value="회원가입" onclick="sendit()"/> </p>	
	
</form>

	<div class="login">
		이미 가입 하셨나요?
		<a href="/join/login.jsp"> 로그인 </a>
	</div>

	<script>
	
	let isIDValid = false;
    let isPasswordValid = false;
    let isNameValid = false;
	let isPasswordValid2 = false;
	
    let idInput = document.getElementById('userid');
    let idmessage = document.getElementById('idmessage');

    idInput.addEventListener('input', () => {
    	let idValue = idInput.value;
    	let idPattern = /^[a-z0-9-_]{4,16}$/; // 4자 이상 16자 이하, 소문자, 숫자, -와 _ 사용

        if (idValue === '') {
            idmessage.textContent = '아이디는 필수입니다';
            isIDValid = false;
        } else if (!idPattern.test(idValue)) {
            idmessage.textContent = '아이디는 4자 이상 16자 이하이며, 소문자와 숫자, -와 _만 사용할 수 있습니다';
            isIDValid = false;
        } else {
            idmessage.textContent = '';
          checkID(idValue);
        }
    });
	
	function checkID(idValue){
	    		// ajax 통신으로 id 중복체크
	    		// get, idcheck.jsp?userid=userid
	    		let xhr = new XMLHttpRequest();
	    		xhr.open("GET", "idcheck.jsp?userid="+idValue, true);
	    		xhr.send();
	    		xhr.onreadystatechange = function(){
	    			if(xhr.status == 200 && xhr.readyState == XMLHttpRequest.DONE){
						if(xhr.responseText.trim() === "OK"){
									isIDValid = true;
							} else {
									idmessage.textContent ="사용 중인 아이디입니다.";
									isIDValid = false;
	                    }
	    			}
	    		}
	    	}	
	
    
    let passwordInput = document.getElementById('userpw');
    let pwmessage = document.getElementById('pwmessage');
    	
	passwordInput.addEventListener('input', () => {
    	let passwordValue = passwordInput.value;
    	let passwordPattern = /^(?=.*[a-zA-Z])(?=.*[\W_])(?=.*\d)[A-Za-z\d\W_]{7,16}$/;

        if (passwordValue === '') {
        	pwmessage.textContent = '비밀번호는 필수입니다';
        	isPasswordValid = false
        } else if (!passwordPattern.test(passwordValue)) {
        	  pwmessage.textContent = '비밀번호는 영문 대소문자, 숫자, 특수문자를 포함해 7자 이상 16자 이하이어야 합니다';
        	isPasswordValid = false
        } else {
        	pwmessage.textContent = ''
        	isPasswordValid = true;
        }
    });
	    
	
    let nameInput = document.getElementById('username');
    let namemessage = document.getElementById('namemessage');

   	 nameInput.addEventListener('input', () => {
    	let nameValue = nameInput.value;
    	let namePattern = /^[a-zA-Z가-힣]{2,20}$/; // 2자 이상 20자 이하, 특수문자 제외

        if (nameValue === '') {
        	namemessage.textContent = '이름은 필수입니다';
        	isNameValid = false;
        } else if (!namePattern.test(nameValue)) {
        	namemessage.textContent = '이름은 2자 이상 20자 이하이며, 특수문자를 포함할 수 없습니다';
        	isNameValid = false;
        } else {
        	 namemessage.textContent = '';
             // 중복 체크
            checkName(nameValue);
        }
    });
   	
	function checkName(nameValue){
    		// ajax 통신으로 id 중복체크
    		// get, idcheck.jsp?userid=userid
    		let xhr = new XMLHttpRequest();
    		xhr.open("GET", "namecheck.jsp?username="+nameValue, true);
    		xhr.send();
    		xhr.onreadystatechange = function(){
    			if(xhr.status == 200 && xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.responseText.trim() === "OK"){
								isNameValid = true;
						} else {
								namemessage.textContent ="사용 중인 이름입니다.";
								isNameValid = false;
                    }
    			}
    		}
    	}	


    function sendit() {
    	if (isIDValid && isPasswordValid && isNameValid) {
    		document.joinForm.submit();
    	} else {
        	alert("입력하신 내용을 다시 확인해 주세요");
   		}
    }
	
	</script>
</body>
</html>