<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReviewFinder </title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../main/css_main.css" />    
</head>
<body>
    <div>
        <header class="header"></header>
    </div>
    <!-- 테스트 용 -->
    <div class="content">
        <h2 class="BOtitle">이번달(변경예정) 박스오피스</h2>
        <!-- BOcontainer -->
        <div class="BOcontatiner">
        	<div class="slider-container">
        		<div class="slider-wrapper">
		        <%for(int i=0; i<10; i++) { %>
		        	<div class="slide-item">
			        	<!-- 영화 1 -->
			             <div class="movie">
			                <!-- 포스터 주소 들어갈거임 -->
			                 <div class="contents-wrap">
			                     <a href="sendMovieName">
			                        <img src="../main/testposter.png" alt="베테랑2">
			                        <div class="ranking"> <%= i+1 %></div>
			                     </a>
			                 </div>
			                <div class="movie-info">
			                    <h2>영화 제목</h2>
			                    <p>개봉일</p>
			                </div>
			             </div>
		            </div>
		            <%} %> 
		          </div>
		          <button class="prevBtn" id="prevBtn">&lt;</button>
		          <button class="nextBtn" id="nextBtn">&gt;</button>
	          </div>
        </div>
        
    </div>
    <div>
        <footer class="footer"></footer>
    </div>
    <script type="text/javascript" src="../main/js_main.js"></script>
    <script>
        $(function(){
            $(".header").load("../header/header.html");
            $(".footer").load("../footer/footer.html");
        });
    </script>
</body>
</html>