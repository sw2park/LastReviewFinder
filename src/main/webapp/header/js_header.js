/**
 * 
 */

/* 헤더 모달 On Off  */
const loginModal = document.querySelector('.login_modal');
const loginModal_open = document.querySelector('.login');
const loginModal_close = document.querySelector('.loginModal_closeBtn');

// 헤더에 로그인 버튼 클릭 시
loginModal_open.addEventListener('click', function(){
	// display 속성을 block으로 변경
	loginModal.style.display = 'block';
});

loginModal_close.addEventListener('click', function(){
	// display 속성을 block으로 변경
	loginModal.style.display = 'none';
});

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
    if (event.target === loginModal) {
        loginModal.style.display = "none";
    }
};

/* 로그인 부분 js */
function login() {
	let userid = frm.userid;
	let userpw = frm.userpw;
	if (userid.value === "") {
		alert("아이디를 입력해주세요");
		userid.focus();
		return false;
	}
	if (userpw.value === "") {
		alert("패스워드를 입력하세요");
		userpw.focus();
		return false;
	}
	frm.submit();
}
function logout() {
	location.href = "/join/logout.lo"
}
/*  	function find_it() {
 location.href="/join/find_it.lo"
 } */