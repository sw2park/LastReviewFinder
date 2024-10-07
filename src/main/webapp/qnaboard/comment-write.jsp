<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성 페이지</title>
<link rel="stylesheet" href="/qnaboard/comment-write.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
</head>
<body>
<div class="wrap">
  <header>
    <em>영화 제목</em>
  </header>
  
  <div>
	<div class="write">
		<textarea maxlength="10000" placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요."></textarea>
	</div>
  </div>
      
  <div class="button">
	<button type="button" class="reset">취소</button>
	<button type="button" class="set">작성</button>
  </div>
</div>
</body>
</html>