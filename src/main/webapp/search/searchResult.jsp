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
	<jsp:include page="/header/header.jsp"></jsp:include>
	<div class="searchQuery">
		<h3 class="queryText">"영화이름"의 검색결과</h3>
	</div>
	<div class="searchResult">
			<!-- 검색결과 없는 경우 -->
			<h3>검색 결과가 없어요. 다른 검색어를 입력하세요.</h3>
		<div class="searchContainer" id="searchSlider">
			<div class="contentWrap">
				<!-- 검색결과 있는 경우 -->
				<c:forEach var="i" begin="1" step="1" end="10">
					<div class="searchItem">
						<div class="searchContent">
							<div class="searchPoster">
								<a href=""><img class="moviePoster" alt="영화제목" src="/search/testposter.png"></a>
							</div>
							<div class="searchTitle">
								<span class="movieTitle">영화이름</span>
							</div>
							<div class="movieDate">
								<span class="date">개봉일</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<button class="prevBtn" id="prevBtnSearch">&lt;</button>
			<button class="nextBtn" id="nextBtnSearch">&gt;</button>
		</div>
	</div>
	<jsp:include page="/footer/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/search/js_search.js"></script>
</body>
</html>