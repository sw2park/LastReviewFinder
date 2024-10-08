<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 페이지</title>
<link rel="stylesheet" href="/qnaboard/comment-write.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<link rel="stylesheet" href="/movie/moviedetails.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/header/header.jsp"></jsp:include>
	
	<c:set var="movie" value="${requestScope.moviedto }" />
	<c:set var="still_list" value="${requestScope.still_list }" />
	<c:set var="actors" value="${requestScope.actors }" />
	<c:set var="directors" value="${requestScope.directors }" />
	<c:set var="commentList" value="${requestScope.commentList }" />
	<c:set var="user" value="${sessionScope.session_id}" />
	<c:set var="similar_movie_list"
		value="${requestScope.similar_movie_list }" />
	<c:set var="first_genre" value="${requestScope.first_genre }" />
	<input id="movie_num" type="text" value="${movie.movie_num }"
		hidden=true />
	<input id="userid" type="text" value="${user.userid }" hidden=true />
	<input id="username" type="text" value="${user.username }" hidden=true />
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
						<c:choose>
							<c:when test="${user==null }">
								<button type="button" id="n-total-rating"
									class="btn total-rating">
									<img src="../movie/img/star.png"><br>평점 매기기
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="total-rating" class="btn total-rating">
									<img src="../movie/img/star.png"><br>평점 매기기
								</button>
							</c:otherwise>
						</c:choose>
						<!-- 평점(평균) 보이는 부분 -->
						<span>&nbsp;&nbsp;&nbsp;</span><span id="rating-score">${requestScope.rating }</span><span
							style="font-size: large;">점</span>
						<!-- 기존 total-rating 내에 버튼 추가 -->
					</div>
					<!-- 버튼을 추가 -->
					<div class="wishlist-comment-buttons">
						<c:choose>
							<c:when test="${user==null }">
								<button id="wishlist-button" class="btn" onclick="user_null()">
							</c:when>
							<c:otherwise>
								<button id="wishlist-button" class="btn" onclick="wishlist()">
									<!-- userid, movienum 넘기기 -->
							</c:otherwise>
						</c:choose>
						<img src="../movie/img/+.png"><br> <br>보고싶어요
						</button>
						<c:choose>
							<c:when test="${user==null }">
								<button id="comment-button" class="btn" onclick="user_null()">
							</c:when>
							<c:otherwise>
								<button id="comment-button" class="btn" onclick="comment()">
							</c:otherwise>
						</c:choose>
						<img src="../movie/img/coment.png"><br> <br>코멘트 달기
						</button>
					</div>
				</section>
				<!-- 코멘트 작성 모달 (초기에는 숨김 처리) -->
				<div id="commentModal" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span>
						<!-- 코멘트 작성 JSP 파일을 비동기적으로 불러와서 이 div 안에 삽입할 예정 -->
						<div id="commentFormContainer">
							<!-- 여기에 comment-write.jsp 내용이 들어감 -->
						</div>
					</div>
				</div>
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
				<c:if test="${actors != null}">
					<c:choose>
						<c:when test="${fn:length(actors) >10}">
							<c:forEach var="i" begin="0" end="8" step="4">
								<tr>
									<c:forEach var="j" begin="${i }" end="${i+3 }" step="1">
										<td><img src="../movie/img/profile.png">
											${actors[j] }</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:set var="i" value="0" />
							<c:forEach var="actor" items="${actors }">
								<c:if test="${i>3 }">
									<tr>
								</c:if>
								<td><img src="../movie/img/profile.png"> ${actor }</td>
								<span hidden>${i=i+1 }</span>
								<c:if test="${i>3 }">
									</tr>
									<span hidden>${i=0 }</span>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
			</table>
		</section>
		<br> <br>
		<!-- 코멘트 섹션 -->
			<section class="comment">
				<table class="comment-table">
					<h2>코멘트</h2>
					<c:choose>
						<c:when test="${fn:length(commentList)!=0 }">
							<c:set var="i" value="0" />
							<c:forEach var="comment" items="${commentList }">
								<c:if test="${i>3 }">
									<tr>
								</c:if>
								<td><img src="../movie/img/profile.png">
									${comment.username }
									<div>
										<hr>
										${comment.comment_contents }
									</div></td>
								<span hidden>${i=i+1 }</span>
								<c:if test="${i>3 }">
									</tr>
									<span hidden>${i=0 }</span>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h3 style="color:gray">코멘트가 없습니다.</h2>
						</c:otherwise>
					</c:choose>
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
		<c:if test="${fn:length(similar_movie_list) >0}">
			<section class="similar">
				<h2>비슷한 작품 (장르: ${first_genre })</h2>
				<ul>
					<c:forEach var="similar_movie" items="#{similar_movie_list }">
						<li><img src="${similar_movie.movie_poster }"
							onclick="location.href='/movie/MovieDetails.mv?movie_title=${similar_movie.movie_title}&movie_date=${similar_movie.movie_date }'">
						</li>
					</c:forEach>
				</ul>
			</section>
		</c:if>
		<jsp:include page="/footer/footer.jsp"></jsp:include>	
	</main>

	<script src="/movie/moviedetails.js"></script>
</script>
</body>
</html>