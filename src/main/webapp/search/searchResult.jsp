<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰파인더 - 검색 결과</title>
<link rel="stylesheet" href="/search/css_search.css" />
</head>
<body class="searchBody">
	<c:set var="movieList" value="${requestScope.movieList }"/>
	<jsp:include page="/header/header.jsp"></jsp:include>
	<div class="searchQuery">
		<h3 class="queryText">"${param.movie_title }"의 검색결과</h3>
	</div>
	<div class="searchResult">
		<c:choose>
			<c:when test="${fn:length(movieList)<1}">
				<h3>검색 결과가 없어요. 다른 검색어를 입력하세요.</h3>
			</c:when>
			<c:otherwise>
				<div class="searchContainer" id="searchSlider">
					<div class="contentWrap">
						<c:forEach var="movie" items="${movieList }">
							<div class="searchItem">
								<div class="searchContent">
									<div class="searchPoster">
										<a href="#"><img class="moviePoster" alt="${movie.movie_title }" src="${movie.movie_poster }"></a>
									</div>
									<div class="searchTitle">
										<span class="movieTitle">${movie.movie_title }</span>
									</div>
									<div class="movieDate">
										<span class="date">${movie.movie_date }</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<button class="prevBtn" id="prevBtnSearch">&lt;</button>
					<button class="nextBtn" id="nextBtnSearch">&gt;</button>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="/footer/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/search/js_search.js"></script>
</body>
</html>