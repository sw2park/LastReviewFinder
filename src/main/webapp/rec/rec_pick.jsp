<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="rec_pick.css">
    <title>영화 추천</title>
</head>
<body>
	<c:if test="${param.flag==null }">
		<script>
			location.href="/rec/RecGetSelectMovie.rec";
		</script>
	</c:if>
	<c:set var="movie" value="${requestScope.movieList }"/>
	<c:set var="round" value="${sessionScope.roundSession }"/>
	<c:set var="cur_round" value="${requestScope.cur_round }"/>
	<c:if test="${round==1 }">
		<script>
			location.href="/rec/RecShowResult.rec";
		</script>
	</c:if>
    <div id="wrap">
        <div id="title">
            <h1>영화 추천 ${round}강 ${cur_round}/${(round/2).intValue() }</h1>
        </div>
        <div id="img">
            <div id="option_1">
                <a href="/rec/RecSelectMovie.rec?movie_num=${movie[1].movie_num }">
                    <img src="${movie[0].movie_poster }">
                </a>
            </div>
            <div id="option_2">
                <a href="/rec/RecSelectMovie.rec?movie_num=${movie[0].movie_num }">
                    <img src="${movie[1].movie_poster }">
                </a>
            </div>
            <div id="vs">
                <img src="/movie/img/vs.png">
            </div>
        </div>
    </div>
</body>
</html>