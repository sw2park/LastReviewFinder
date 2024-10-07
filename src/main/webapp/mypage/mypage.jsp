<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<style>
html {
	font-family: 'Pretendard';
}

.profile {
	width: 150px; /* 프로필 사진의 너비 */
	height: 150px; /* 프로필 사진의 높이 */
	border-radius: 50%; /* 원형 테두리 */
	overflow: hidden; /* 자식 요소가 경계를 넘어가지 않도록 */
	display: flex; /* 중앙 정렬을 위해 플렉스 사용 */
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: center; /* 수평 중앙 정렬 */
	background-color: #f0f0f0; /* 배경색 (예시) */
}

.profile img {
	width: 100%; /* 부모 요소의 너비에 맞추기 */
	height: 100%; /* 부모 요소의 높이에 맞추기 */
	object-fit: cover; /* 이미지 비율 유지하면서 자르기 */
}

.rounded {
	border: 1px solid #f7175a; /* 테두리 색 */
	border-radius: 15px; /* 둥근 사각형 테두리 */
	padding: 10px; /* 여백 */
	background-color: #ffffff; /* 배경색 */
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: center; /* 수평 중앙 정렬 */
	text-align: center;
	margin: auto;
	margin-top: 80px;
}

a {
	color: #f7175a;
	text-decoration: none;
}

.modal {
	display: none; /* 기본적으로 모달을 숨김 */
	position: fixed;
	z-index: 1; /* 화면 위에 표시 */
	left: 0;
	top: 0px;
	width: 100%; /* 전체 화면 너비 */
	height: 100%; /* 전체 화면 높이 */
	overflow: auto; /* 필요시 스크롤 */
	background-color: rgb(0, 0, 0); /* 배경색 */
	background-color: rgba(0, 0, 0, 0.4); /* 투명 배경 */
}

.modal_body {
	background-color: #fefefe;
	margin: 15% auto; /* 화면 중앙 정렬 */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* 너비 */
}

.close {
	cursor: pointer; /* 포인터 모양으로 변경 */
}

.newInput {
	display: none; /* 기본적으로 숨김 */
}

.userContents {
	overflow-x: auto; /* 가로 스크롤 가능 */
	white-space: nowrap; /* 줄 바꿈 방지 */
	width: 100%; /* 컨테이너 너비 */
	margin-bottom: 15px;
}

#openModal {
	width: 30px;
	height: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/header/header.jsp"></jsp:include>
	<div class="modal" id="myModal">
		<div class="modal_body">
			<span class="close">&times;</span>
			<h2>설정</h2>
			<p onclick="togglePassword()">비밀번호 변경</p>
			<div id="changePassword" class="newInput">
				<form name="UpdatePassword" id="UpdatePassword" method="post"
					action="/mypage/UpdatePassword.mp">
					<input type="hidden" id="userid" name="userid"
						value="${sessionScope.session_id.userid}"> <label><input
						type="password" name="userpw" id="userpw" placeholder="비밀번호"
						required /> <input type="submit" value="변경"></label>
					<p id="pwmessage" style="color: #f7175a;"></p>
					<label><input type="password" name="confirm_pw"
						id="confirm_pw" placeholder="비밀번호 확인" required /></label>
					<p id="pwmessage2" style="color: #f7175a;"></p>
				</form>
			</div>
			<p onclick="toggleUsername()">닉네임 변경</p>
			<div id="changeUsername" class="newInput">
				<form name="UpdateName" id="UpdateName" method="post"
					action="/mypage/UpdateName.mp">
					<input type="hidden" id="userid" name="userid"
						value="${sessionScope.session_id.userid}"> <label><input
						type="text" name="username" id="username" placeholder="이름"
						required /> <input type="submit" value="변경"></label>
					<p id="namemessage" style="color: #f7175a;"></p>
				</form>
			</div>
			<p>
				<a href="/qnaboard/BoardList.bo">문의하기 / 영화 추가 요청하기</a>
			</p>
			<p>
				<a href="/join/logout.lo">로그아웃</a>
			</p>
			<p>
				<a href="#"
					onclick="DeleteMember('${sessionScope.session_id.userid}')">탈퇴하기</a>
			</p>
		</div>
	</div>


	<div class="userInfo">
		<table class="rounded" style="width: 60%">
			<c:set var="member" value="${sessionScope.session_id }" />
			<tr>
				<td style="text-align: right"><img src="setting.png" value="설정"
					id="openModal"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<form name="UpdateProfile" id="UpdateProfile" method="post"
				action="/mypage/UpdateProfile.mp" enctype="multipart/form-data">
				<input type="hidden" id="userid" name="userid"
					value="${sessionScope.session_id.userid}">
				<tr>
					<td class="profile"><img src="${member.profile }" id="profile"
						onclick="document.getElementById('fileInput').click()"></td>
				</tr>
				<tr>
					<td style="text-align: left"><a
						href="/mypage/ReturnProfile.mp">기본이미지로 변경</a></td>
				</tr>
				<input type="file" id="fileInput"
					accept="image/gif, image/png, image/jpeg" style="display: none;"
					onchange="UpdateProfile()">

				<tr>
					<td></td>
				</tr>
				<tr>
					<td class="rounded">${member.username }</td>
				</tr>
				<tr>
					<td class="rounded">${member.userid}</td>
				</tr>
			</form>
		</table>
	</div>
	<br />
	<br />
	<div class="userContents">
		<c:set var="contentsList" value="${requestScope.contentsList }" />
		<table class="rounded" style="width: 60%">
			<c:choose>
				<c:when
					test="${contentsList != null and fn:length(contentsList)>0 }">
					<td align="right" colspan="${fn:length(contentsList) + 1}"><a
						href="/mypage/ShowMyContents.mp">더보기</a></td>
					<tr align="center" valign="middle">
					</tr>
					<tr align="center" valign="middle">
						<c:forEach var="list" items="${contentsList }" varStatus="status">
							<c:if test="${status.index < 4}">
								<td height="23px"><a href="영화상세페이지=${list.movie_num }"><img
										src="${list.movie_poster}"></a><br /> ${list.movie_title }</td>
							</c:if>
						</c:forEach>
					</tr>
				</c:when>
				<c:otherwise>
					<%-- 내용 없을 때 --%>
					<td align="right"><a href="/mypage/ShowMyContents.mp">더보기</a></td>
					<tr style="height: 50px;">
						<td colspan="5" style="text-align: center;">아직 '좋아요'한 영화가
							없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<jsp:include page="/footer/footer.jsp"></jsp:include>
	<script src="mypage.js">
		
	</script>
</body>
</html>