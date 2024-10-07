<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ReviewFinder</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<link rel="stylesheet" href="/main/css_main.css" />
</head>
<body class="_body">
	<c:set var="boxOffice" value="${requestScope.mainDTO }" />
	<c:set var="lastBoxOffice" value="${requestScope.lastDTO }" />
	<c:set var="lastLastBoxOffice" value="${requestScope.lastLastDTO }" />
	<jsp:include page="/header/header.jsp"></jsp:include>
	<div class="content">
		<h2 class="BOtitle">이번 달 박스오피스</h2>
		<!-- BOcontainer -->
		<div class="BOcontatiner">
			<div class="slider-container" id="thisMonthSlider">
				<div class="slider-wrapper">
					<c:forEach var="box" items='${boxOffice }'>
						<div class="slide-item">
							<div class="movie">
								<div class="contents-wrap">
									<a href="/movie/MovieDetails.mv?movie_title=${box.movie_title}&movie_date=${box.movie_date}">
										<img src="${box.movie_poster }" alt="${box.movie_title }">
										<div class="ranking">${box.movie_rank}</div>
									</a>
								</div>
								<div class="movie-info">
									<h2>${box.movie_title}</h2>
									<p>${box.movie_date }</p>
									<p>${box.movie_genre }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<button class="prevBtn" id="prevBtnThisMonth">&lt;</button>
				<button class="nextBtn" id="nextBtnThisMonth">&gt;</button>
			</div>
		</div>
	</div>

	<div class="content">
		<h2 class="BOtitle">지난 달 박스오피스</h2>
		<!-- BOcontainer -->
		<div class="BOcontatiner">
			<div class="slider-container" id="lastMonthSlider">
				<div class="slider-wrapper">
					<c:forEach var="box" items='${lastBoxOffice }'>
						<div class="slide-item">
							<div class="movie">
								<div class="contents-wrap">
									<a
										href="/movie/MovieDetails.mv?movie_title=${box.movie_title}&movie_date=${box.movie_date}">
										<img src="${box.movie_poster }" alt="${box.movie_title }">
										<div class="ranking">${box.movie_rank}</div>
									</a>
								</div>
								<div class="movie-info">
									<h2>${box.movie_title}</h2>
									<p>${box.movie_date }</p>
									<p>${box.movie_genre }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<button class="prevBtn" id="prevBtnLastMonth">&lt;</button>
				<button class="nextBtn" id="nextBtnLastMonth">&gt;</button>
			</div>
		</div>
	</div>

	<div class="content">
		<h2 class="BOtitle">지난 두 달간의 박스오피스</h2>
		<!-- BOcontainer -->
		<div class="BOcontatiner">
			<div class="slider-container" id="lastLastMonthSlider">
				<div class="slider-wrapper">
					<c:forEach var="box" items='${lastLastBoxOffice }'>
						<div class="slide-item">
							<div class="movie">
								<div class="contents-wrap">
									<a
										href="/movie/MovieDetails.mv?movie_title=${box.movie_title}&movie_date=${box.movie_date}">
										<img src="${box.movie_poster }" alt="${box.movie_title }">
										<div class="ranking">${box.movie_rank}</div>
									</a>
								</div>
								<div class="movie-info">
									<h2>${box.movie_title}</h2>
									<p>${box.movie_date }</p>
									<p>${box.movie_genre }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<button class="prevBtn" id="prevBtnLastLastMonth">&lt;</button>
				<button class="nextBtn" id="nextBtnLastLastMonth">&gt;</button>
			</div>
		</div>
	</div>
	<jsp:include page="/footer/footer.jsp"></jsp:include>
	<script type="text/javascript" src="../main/js_main.js"></script>
</body>
</html>