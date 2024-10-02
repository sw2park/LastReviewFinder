<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
<style>
		.container {
		    background: white;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		    text-align: center;
		}
		
		h1 {
		    margin-bottom: 20px;
		}
		
		.button {
		    padding: 10px 20px;
		    margin: 10px;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 16px;
		}
		
		.button.danger {
		    background-color: #e74c3c;
		    color: white;
		}
		
		.button:hover {
		    opacity: 0.9;
		}
		
		.modal {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: rgba(0, 0, 0, 0.5);
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.modal-content {
		    background: white;
		    padding: 20px;
		    border-radius: 8px;
		    text-align: center;
		}
		
		.hidden {
		    display: none;
		}

</style>

</head>
<body>
	
	<form name="deleteMember" method="post">
    	<div class="container">
	        <h1>로그아웃 / 회원탈퇴</h1>
			<input type="hidden" id="userid" value="${sessionScope.session_id.userid}">
	         <input type="button" id="logout-btn" value="로그아웃" class="button" onclick="location.href='/join/logout.lo'"><br/>
	         <input type="button" id="delete-btn" value="회원탈퇴" class="button danger" onclick="DeleteMember('${sessionScope.session_id.userid}')">
        </div>
	</form> 
	<br/>
	
	<!-- 비밀번호 / 닉네임 변경 확인 차 만든거라 나중에 프론트 완성되면 수정할게요 -->
	
	<form name="UpdatePassword" method="post" action="/mypage/UpdatePassword.mp">
    	<div class="container">
			<input type="hidden" id="userid" name="userid" value="${sessionScope.session_id.userid}">
	        <h1>비밀번호변경</h1>
	        <p>
				<label><input type="password" name="userpw" id="userpw" placeholder="비밀번호"/></label>
			</p>
			<p id="pwmessage" style="color: #f7175a;"></p>
			<br/>
			<input type="submit" value="변경">
		</div>
	</form>
	<br/>	
		<form name="UpdateName" method="post" action="/mypage/UpdateName.mp">
	    	<div class="container">
				<input type="hidden" id="userid" name="userid" value="${sessionScope.session_id.userid}">
		        <h1>닉네임변경</h1>
		        <p>
					<label><input type="text" name="username" id="username" placeholder="이름"/></label>
				</p>
				<p id="namemessage" style="color: #f7175a;"></p>
				<br/>
			<input type="submit" value="변경">
			</div>
		</form>
        
    <script src="/join/user.js"></script>

</body>
</html>
