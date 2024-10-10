<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<link rel="stylesheet" href="../mypage/mypage.css">
<title>리뷰파인더 - 마이페이지</title>	
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

<div class="mypage-wrap">
	<div class="userInfo">
		<table class="rounded" style="width: 50%">
			<c:set var="member" value="${sessionScope.session_id }"/>
			<tr>
				<td style="text-align: right"><img src="setting.png" value="설정" id="openModal"></td>
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
					<td class="rounded"><h2>${member.username }</h2></td>
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
		<table class="rounded" style="width: 50%">
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
								<td height="23px"><a href="/movie/MovieDetailsToNum.mv?movie_num=${list.movie_num }">
								<img src="${list.movie_poster}"></a><br/>${list.movie_title }
								</td>
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
</div>
</body>
</html>