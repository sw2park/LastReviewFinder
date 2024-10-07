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
	<c:set var="memberDTO" value="${requestScope.memberDTO }" />

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
							<li class="login"><a type="button" href="/login/login.lo">
									<span> 로그인 </span>
							</a></li>
							<li class="join"><a type="button" href="/login/join.lo">
									<span> 회원가입 </span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="main_userInfo">
								<img src="${memberDTO.profile }">
								<span>${memberDTO.username }</span>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</section>
		</nav>
	</header>
</body>
</html>