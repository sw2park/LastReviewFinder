<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	영화클릭
	<img alt="a" 
	src="http://file.koreafilm.or.kr/thm/02/99/18/37/tn_DPK021861.jpg" onclick="location.href='/movie/MovieDetails.mv?movie_title=범죄도시4&movie_date=20240424'">
	<form action="/movie/SearchToTitle.mv">
		<input type="text" name="movie_title"/>
		<input type="submit"/>
	</form>
</body>
</html>