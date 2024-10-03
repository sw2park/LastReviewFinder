<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 페이지</title>
<link rel="stylesheet" href="/movie/moviedetails.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<c:set var="movie" value="${requestScope.moviedto }" />
	<c:set var="still_list" value="${requestScope.still_list }" />
	<main>
		<!-- 영화 스틸 이미지와 영화 정보 섹션 -->
		<section class="movie-banner">
			<!-- 스틸 이미지 -->
			<div class="movie-still-container">
				<img alt="영화 스틸 이미지" src="${movie.movie_still_image }"
					class="movie-still">
				<!-- 영화 정보 div -->
				<div class="movie-info-overlay">
					<h1 class="movie-title">${param.movie_title }</h1>
					<p class="movie-release-date">상영 날짜: ${param.movie_date }</p>
					<p class="movie-genre">장르: ${movie.movie_genre }</p>
				</div>
			</div>
		</section>

		<!-- 포스터, 별점 선택, 별점, 보고싶어요, 코멘트 줄거리 섹션 -->
		<section class="movie-details">
			<!-- 이미지 -->
			<div class="movie-poster">
				<img alt="영화 포스터" src="${movie.movie_poster }">
			</div>
			<!-- 별점 선택, 별점, 보고싶어요, 코멘트, 줄거리 div -->

			<div class="movie-rating">
				<!-- 별점 선택, 별점, 보고싶어요, 코멘트 섹션 -->
				<section>
					<div class="star-rating">
						<!-- 별점 선택 -->
						<span class="star" data-value="1">&#9733;</span> <span
							class="star" data-value="2">&#9733;</span> <span class="star"
							data-value="3">&#9733;</span> <span class="star" data-value="4">&#9733;</span>
						<span class="star" data-value="5">&#9733;</span>
					</div>
					<div class="total-rating">
						<button type="button" id="total-rating" class="btn">
							<img src="../movie/img/star.png"><br>평점 매기기
						</button>
						<!-- 기존 0점 부분 -->
						<span id="rating-score">&nbsp;&nbsp;&nbsp;0점</span>
						<!-- 기존 total-rating 내에 버튼 추가 -->
					</div>
					<!-- 버튼을 추가 -->
					<div class="wishlist-comment-buttons">
						<button id="wishlist-button" class="btn">
							<img src="../movie/img/+.png"><br> <br>보고싶어요
						</button>
						<button id="comment-button" class="btn">
							<img src="../movie/img/coment.png"><br> <br>코멘트
							달기
						</button>
					</div>
				</section>
				<hr />
				<!-- 줄거리 섹션 -->
				<section>
					<p>
						<!-- 줄거리 -->
						${movie.movie_plot }
					</p>
				</section>
			</div>
		</section>

		<!-- 출연/제작 섹션 -->
		<section class="cast">
			<table class="cast-table">
				<h2>출연/제작</h2>
				<tr>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
				</tr>
				<tr>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
				</tr>
				<tr>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
				</tr>
			</table>
		</section>
		<br> <br>
		<!-- 코멘트 섹션 -->
		<section class="comment">
			<table class="comment-table">
				<h2>코멘트</h2>
				<tr>
					<td><img src="../movie/img/profile.png"> 장이수
						<div>
							<hr>
							왜 이렇게 아쉬울까 관람이 끝난 후 한참 고민을 했는데 내가 생각한 이유는 이러함 영제목을 체포로 정한 만큼 이
							작품은 악당을 체포하는 과정에서 주는 카타르시스가 매우 중요함 왜 이렇게 아쉬울까 관람이 끝난 후 한참 고민을 했는데
							내가 생각한 이유는 이러함 영제목을 체포로 정한 만큼 이 작품은 악당을 체포하는 과정에서 주는 카타르시스가 매우
							중요함 왜 이렇게 아쉬울까 관람이 끝난 후 한참 고민을 했는데 내가 생각한 이유는 이러함 영제목을 체포로 정한 만큼
							이 작품은 악당을 체포하는 과정에서 주는 카타르시스가 매우 중요함
						</div></td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
				</tr>
				<tr>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
				</tr>
				<tr>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
					<td><img src="../movie/img/profile.png"> 장이수</td>
				</tr>
			</table>
		</section>
		<br> <br>
		<!-- 갤러리 섹션 -->
		<c:if test="${movie.movie_still_image != null}">
			<div class="slider-container">
				<h2>갤러리</h2>
				<div class="slider-wrapper">
					<c:forEach var="still_img" items="${still_list}">
						<div class="slide-item">
							<div class="gallery">
								<div class="contents-wrap">
									<img alt="갤러리" src="${still_img}">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<button class="prevBtn" id="prevBtn">&lt;</button>
				<button class="nextBtn" id="nextBtn">&gt;</button>
			</div>
		</c:if>

		<!-- 비슷한 작품 섹션 -->
		<section class="similar">
			<h2>비슷한 작품</h2>
			<ul>
				<li><img src="../movie/img/poster_1.jpg"></li>
				<li><img src="../movie/img/poster_2.jpg"></li>
				<li><img src="../movie/img/poster_1.jpg"></li>
				<li><img src="../movie/img/poster_2.jpg"></li>
				<li><img src="../movie/img/poster_1.jpg"></li>
				<li><img src="../movie/img/poster_2.jpg"></li>
			</ul>
		</section>
	</main>
	<script src="/movie/moviedetails.js"></script>
</body>
</html>