<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 페이지</title>
<link rel="stylesheet" href="/movie/movieinfo.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<main>
		<!-- 영화 스틸 이미지와 영화 정보 섹션 -->
		<section class="movie-banner">
			<!-- 스틸 이미지 -->
			<div class="movie-still-container">
				<img alt="영화 스틸 이미지"
					src="http://file.koreafilm.or.kr/thm/01/copy/00/66/74/tn_DST840308.jpg"
					class="movie-still">
				<!-- 영화 정보 div -->
				<div class="movie-info-overlay">
					<h1 class="movie-title">범죄도시4</h1>
					<p class="movie-release-date">상영 날짜: 2024-04-24 00:00:00</p>
					<p class="movie-genre">장르: 액션,범죄,스릴러,느와르,코메디</p>
				</div>
			</div>
		</section>

		<!-- 포스터, 별점 선택, 별점, 보고싶어요, 코멘트 줄거리 섹션 -->
		<section class="movie-details">
			<!-- 이미지 -->
			<div class="movie-poster">
				<img alt="영화 포스터"
					src="http://file.koreafilm.or.kr/thm/02/99/18/37/tn_DPK021861.jpg">
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
						<button type="button" id="total-rating" class="btn"><img src="../movie/img/star.png"><br>평점 매기기</button>
						<!-- 기존 0점 부분 -->
						<span id="rating-score">&nbsp;&nbsp;&nbsp;0점</span>
						<!-- 기존 total-rating 내에 버튼 추가 -->
					</div>
						<!-- 버튼을 추가 -->
						<div class="wishlist-comment-buttons">
							<button id="wishlist-button" class="btn"><img src="../movie/img/+.png"><br><br>보고싶어요</button>
							<button id="comment-button" class="btn"><img src="../movie/img/coment.png"><br><br>코멘트 달기</button>
						</div>
				</section>
				<hr />
				<!-- 줄거리 섹션 -->
				<section>
					<p>
						<!-- 줄거리 -->
						신종 마약 사건 3년 뒤,괴물형사 ‘마석도’(마동석)와 서울 광수대는 배달앱을 이용한 마약 판매 사건을 수사하던 중
						수배 중인 앱 개발자가 필리핀에서 사망한 사건이 대규모 온라인 불법 도박 조직과 연관되어 있음을 알아낸다.필리핀에
						거점을 두고 납치, 감금, 폭행, 살인 등으로 대한민국 온라인 불법 도박 시장을 장악한 특수부대 용병 출신의 빌런
						‘백창기’(김무열)와 한국에서 더 큰 판을 짜고 있는 IT업계 천재 CEO ‘장동철’(이동휘).‘마석도’는 더 커진
						판을 잡기 위해 ‘장이수’(박지환)에게 뜻밖의 협력을 제안하고 광역수사대는 물론, 사이버수사대까지 합류해 범죄를
						소탕하기 시작하는데…나쁜 놈 잡는데 국경도 영역도 제한 없다!업그레이드 소탕 작전! 사정없이 싹 쓸어버린다!
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
		<br><br>
		<!-- 코멘트 섹션 -->
		<section class="comment">
		<table class="comment-table">
			<h2>코멘트</h2>
				<tr>
					<td>
					<img src="../movie/img/profile.png"> 장이수
					<div>
					<hr>
					왜 이렇게 아쉬울까 관람이 끝난 후 한참 고민을 했는데 내가 생각한 이유는 이러함 영제목을 체포로 정한 만큼 이 작품은 악당을 체포하는 과정에서 주는 카타르시스가 매우 중요함
					왜 이렇게 아쉬울까 관람이 끝난 후 한참 고민을 했는데 내가 생각한 이유는 이러함 영제목을 체포로 정한 만큼 이 작품은 악당을 체포하는 과정에서 주는 카타르시스가 매우 중요함
					왜 이렇게 아쉬울까 관람이 끝난 후 한참 고민을 했는데 내가 생각한 이유는 이러함 영제목을 체포로 정한 만큼 이 작품은 악당을 체포하는 과정에서 주는 카타르시스가 매우 중요함
					</div>
					</td>
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
		<br><br>
		<!-- 갤러리 섹션 -->
		<section class="gallery">
			<!-- 갤러리 -->
			<h2>갤러리</h2>
				<img alt="갤러리1" src="../movie/img/profile.png">
				<img alt="갤러리2" src="../movie/img/profile.png">
				<img alt="갤러리3" src="../movie/img/profile.png">
		</section>
		<br><br>
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
	<script src="/movie/movieinfo.js"></script>
</body>
</html>