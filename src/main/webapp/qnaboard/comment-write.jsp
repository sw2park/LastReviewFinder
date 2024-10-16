<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰파인더 - 댓글 작성 페이지</title>
<link rel="stylesheet" href="/qnaboard/comment-write.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
</head>
<body>
	<div class="wrap">
		<header class="comment-write_header">
			<em>코멘트 작성</em>
		</header>

		<div>
			<div class="write">
				<textarea id="comment_contents" maxlength="10000" placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요."></textarea>
			</div>
		</div>

		<div class="button">
			<button type="button" class="reset" onclick="reset()">취소</button>
			<button type="button" class="set" onclick="write_comment()">작성</button>
		</div>
	</div>
</body>
</html>