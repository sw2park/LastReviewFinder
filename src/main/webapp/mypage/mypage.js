/**
 * 
 */

// 모달 요소 가져오기
var modal = document.getElementById("myModal");
	
// 버튼 클릭 시 모달 열기
document.getElementById("openModal").onclick = function() {
    modal.style.display = "block";
}

// 모달 닫기 버튼 클릭 시 모달 닫기
document.getElementsByClassName("close")[0].onclick = function() {
    modal.style.display = "none";
}

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

  function togglePassword() {
      var inputs = document.getElementById("changePassword");
      if (inputs.style.display === "none" || inputs.style.display === "") {
          inputs.style.display = "block"; // 보여주기
      } else {
          inputs.style.display = "none"; // 숨기기
      }
  }
  
  function toggleUsername() {
      var inputs = document.getElementById("changeUsername");
      if (inputs.style.display === "none" || inputs.style.display === "") {
          inputs.style.display = "block"; // 보여주기
      } else {
          inputs.style.display = "none"; // 숨기기
      }
  }
  
	let passwordInput = document.getElementById('userpw');
    let pwmessage = document.getElementById('pwmessage');
	let passwordCheck = document.getElementById('confirm_pw')
	let pwmessage2 = document.getElementById('pwmessage2');
	let isPasswordValid = false;
	let isPasswordValid2 = false;
	
	passwordInput.addEventListener('input', () => {
    	let passwordValue = passwordInput.value;
    	let passwordPattern = /^(?=.*[a-zA-Z])(?=.*[\W_])(?=.*\d)[A-Za-z\d\W_]{7,16}$/;

        if (passwordValue === '') {
        	pwmessage.textContent = '비밀번호는 필수입니다';
        } else if (!passwordPattern.test(passwordValue)) {
        	  pwmessage.textContent = '비밀번호는 영문 대소문자, 숫자, 특수문자를 포함해 7자 이상 16자 이하이어야 합니다';
        } else {
        	pwmessage.textContent = '';
        	isPasswordValid = true;
        }
    });
	
	passwordCheck.addEventListener('input', () => {
 	    let password = passwordInput.value;
 	    let confirmPassword = passwordCheck.value;
 	    // 비밀번호 일치 여부 확인
 	    if (password !== confirmPassword) {
 	       pwmessage2.textContent = '비밀번호가 일치하지 않습니다.';
 	    } else {
 	    	pwmessage2.textContent = '';
 	    	isPasswordValid2 = true;
 	    }
 	});
	
	document.getElementById('UpdatePassword').addEventListener('submit', function(event) {
 	    if (!isPasswordValid || !isPasswordValid2) {
 	        event.preventDefault();
 	    }
 	});
 
 let nameInput = document.getElementById('username');
 let namemessage = document.getElementById('namemessage');
 let isNameValid = false;
 
nameInput.addEventListener('input', () => {
 	let nameValue = nameInput.value;
 	let namePattern = /^[a-zA-Z가-힣]{2,20}$/; // 2자 이상 20자 이하, 특수문자 제외

     if (nameValue === '') {
     	namemessage.textContent = '이름은 필수입니다';
     } else if (!namePattern.test(nameValue)) {
     	namemessage.textContent = '이름은 2자 이상 20자 이하이며, 특수문자를 포함할 수 없습니다';
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
 		xhr.open("GET", "../join/namecheck.jsp?username="+nameValue, true);
 		xhr.send();
 		xhr.onreadystatechange = function(){
 			if(xhr.status == 200 && xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.responseText.trim() === "OK"){
							isNameValid = true;
					} else {
							namemessage.textContent ="사용 중인 이름입니다.";
                 }
 			}
 		}
 	}	

document.getElementById('UpdateName').addEventListener('submit', function(event) {
    if (!isNameValid) {
        event.preventDefault();
    }
});
  
	function DeleteMember(userid){
		var result = confirm("정말로 탈퇴하시겠어요? 이 작업은 되돌릴 수 없습니다.");
			 if(result){
				location.href='/mypage/DeleteMember.mp?userid='+userid;
				 } else{
					 alert("회원 탈퇴를 취소합니다.");
				 }
		  	}
