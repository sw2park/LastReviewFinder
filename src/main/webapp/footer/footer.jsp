<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰파인더 - 영화 시리즈 추천 및 평가 서비스</title>
	<link rel="stylesheet" href="/footer/css_footer.css" />    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body class="footerBody">
	<c:set var="totalRatingCnt" value="${sessionScope.totalRatingCnt }"/>
    <footer class="_footer">
        <section class="top">
            <span class="footer_star">
                지금까지 &nbsp <em id="totalRatingCnt">★${sessionScope.totalRatingCnt } 개의 평가가</em>&nbsp 쌓였어요.
            </span>
        </section>
        <section class="bottom">
            <div class="contents">
                서비스 이용약관 | <a>개인정보 처리방침</a> | 회사안내<br>
                고객센터 | cs@reviewfinder.co.kr | <a>1544-9970</a><br>
                주식회사 kh-academy | 대표 jsp2조 | 서울특별시 강남구 테헤란로14길 6<br>
                사업자 등록번호 <a>kh-academy</a><br>
                리뷰파인더 로고 이미지 ⓒ 2024 by WATCHA, Inc, All right reserved.<br>
            </div>
        </section>
    </footer>
    <script type="text/javascript" src="/footer/footer.js"></script>
    <c:if test="${totalRatingCnt == null}"><script>getTotalRatingCnt();</script></c:if>
</body>
</html>