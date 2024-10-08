<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/header/css_header.css" />
</head>
<body>
	<c:set var="memberDTO" value="${sessionScope.session_id }" />
	<header class="_header">
		<nav>
			<section>
				<ul class="header_ul">
					<li class="logo"><a href="/main/main.ma"> <img
							class="logoImg" src="/header/logo.png">
					</a></li>
					<li class="recomend"><a type="button" href="/rec/RecMain.rec">
							<span> 영화 추천 </span>
					</a></li>
					<li class="board"><a type="button"
						href="/qnaboard/BoardList.bo"> <span> 게시판 </span>
					</a></li>
					<li class="search">
						<div>
							<form action="">
								<label for=""> <input autocomplete="off" type="text"
									class="searchBox" id="" name=""
									placeholder="콘텐츠, 인물, 컬렉션, 유저를 검색해보세요." value>
								</label>
							</form>
						</div>
					</li>
					<c:choose>
						<c:when test="${memberDTO==null }">
							<li class="login"><span> 로그인 </span></li>
							<li class="join"><a type="button" href="/login/join.lo">
									<span> 회원가입 </span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="header_userInfo" href="">
								<img src="${memberDTO.profile }">
								<span>${memberDTO.username }</span>
							</li>
							<li class="header_logout"><span>로그아웃</span></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</section>
		</nav>
	</header>
<!-- 로그인 모달부분  -->
	<div class="login_modal">
		<div class="login_modalBody">
			<form action="/join/login.lo" method="post" name="frm">
				<span class="loginModal_closeBtn">닫기</span>
				<img class="loginModal_logo" alt="ReviewFinder" src="/header/logo.png">
				<c:if test="${not param.flag and not empty param.flag }">
					<script>
						alert("아이디, 비밀번호가 맞지 않습니다.");
					</script>
				</c:if>
				<p>
					<label> <input class="login_inputBtn" autocomplete="off"
						name="userid" placeholder="아이디" type="text">
					</label>
				</p>
				<p>
					<label> <input class="login_inputBtn" autocomplete="off"
						type="password" name="userpw" placeholder="비밀번호" />
					</label>
				</p>
				<input type="button" id="loginbutton" value="로그인" onclick="login()" />
			</form>
			<br />
			<div class="find_it">
				<button onclick="find_it()" class="findItBtn">이메일/비밀번호를
					잊으셨나요?</button>
			</div>
			<br />
			<div class="login_join">
				계정이 없으신가요? <a href="/join/join_view.jsp"> 회원가입 </a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/header/js_header.js"></script>
</body>
</html>