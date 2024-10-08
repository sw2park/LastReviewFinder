<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../join/login.css">	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
</head>
<body>
<div class="container">
	<div class="login-logo">
		<a href="/main/main.ma"><img alt="logo" src="/join/logo.png"></a>
		<br>
		<h3>로그인</h3>
	</div>
	<form action="/join/login.lo" method="post" name="frm">
		<c:if test="${not param.flag and not empty param.flag }">
		<script>
			alert("아이디, 비밀번호가 맞지 않습니다.");
		</script>
	</c:if>
		<p>
			<label>
				<input autocomplete="off" name="userid" placeholder="아이디" type="text">
			</label>
		</p>
		<p>
			<label> 
				<input autocomplete="off" type="password" name="userpw" placeholder="비밀번호"/>
			</label>
		</p>
		<input type="button" id="loginbutton" value="로그인" onclick="login()"/>
	</form>
	<br/>
	<div class="find_it">
		<button onclick="find_it()"> 아이디/비밀번호를 잊으셨나요? </button>
	</div>
	<br/><br>
	<div class="join">
		계정이 없으신가요?&nbsp;&nbsp;
		<a href="/join/join_view.jsp">회원가입 </a>
	</div>
	<br>
</div>	
	<script>
 	function login(){
			let frm = document.frm;
			let userid = frm.userid;
			let userpw = frm.userpw;
		if (userid.value === ""){
			alert("아이디를 입력해주세요");
			userid.focus();
			return false;
		}
		if( userpw.value === "" ){
			alert("패스워드를 입력하세요");
			userpw.focus();
			return false;
		}
		frm.submit();
	 }
 	function logout(){
 		location.href="/join/logout.lo"
	}
/*  	function find_it() {
 		location.href="/join/find_it.lo"
	} */
	</script>

</body>
</html>