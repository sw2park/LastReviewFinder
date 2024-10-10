<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="movieList" value="${requestScope.movieList }"/>
	<h2>${param.movie_title }</h2>
	<h1>여기 test2</h1>
	<c:forEach var="movie" items="${movieList }">
		<img alt="이미지" src="${movie.movie_poster }"> 
		${movie.movie_title}
		</br>
	</c:forEach>
</body>
</html>