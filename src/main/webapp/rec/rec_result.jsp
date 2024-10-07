<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="rec_result.css">    
    <title>영화 추천 결과 화면</title>
</head>
<body>
	<jsp:include page="/header/header.jsp"></jsp:include>
	<c:set var="movie" value="${requestScope.movie }"/>
    <div id="wrap">
        <div id="title">
            <h1>영화 추천 우승작</h1>
            <p>클릭 시 영화 상세 페이지로 이동합니다.</p>
        </div>

        <div>
            <a href="/rec/RecMain.rec">
                <input type="button" value="다시하기" id="restart">
            </a>
        </div>

        <div id="result">
            <a href="/movie/MovieDetails.mv?movie_title=${movie.movie_title }&movie_date=${movie.movie_date}">
                <img src="${movie.movie_poster }">
            </a>
        </div>
    </div>
</body>
</html>