<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<style>
	html {
	  	  font-family: 'Pretendard';
	    }
    .table-container {
        overflow-x: auto; /* 가로 스크롤 가능 */
        white-space: nowrap; /* 줄 바꿈 방지 */
        width: 100%; /* 컨테이너 너비 */
    }

    table {
        width: auto; /* 테이블 너비 자동 설정 */
        border-collapse: collapse; /* 테두리 겹침 방지 */
    }

    td {
        border: 1px solid #ddd; /* 테두리 설정 */
        padding: 8px; /* 패딩 추가 */
        text-align: center; /* 가운데 정렬 */
    }

    img {
        max-width: 100px; /* 이미지 최대 너비 설정 */
        height: auto; /* 비율에 맞게 높이 자동 조정 */
    }
</style>
</head>
<body>
<div>

	<c:set var="contentsList" value="${requestScope.contentsList }"/>

<%-- 가로정렬 --%>
	<div class="table-container">
		<table>
			<tr align="center" valign="middle" class="title">
				<td height="40px" width="4%"></td>  
				<td height="40px" width="50%"></td>
			</tr>
			
			<c:choose>
		     	  <c:when test = "${contentsList != null and fn:length(contentsList)>0 }">
						    <tr align="center" valign="middle">
								<c:forEach var="list" items="${contentsList }">	
					               <td height="23px"><a href="영화상세페이지=${list.movie_num }"><img src="${list.movie_poster}"></a><br/>
						              ${list.movie_title }</td>
				         		</c:forEach>
				            </tr>
			</c:when>
			<c:otherwise> <%-- 내용 없을 때 --%>
				<tr style="height:50px;">
		            <td colspan="5" style="text-align:center; color:#f7175a;">아직 '좋아요'한 영화가 없습니다.</td>
		        </tr>
       	 	</c:otherwise>
 	 	  </c:choose>
 	 	</div>  
 	 	
 	 	<br/>
 	 	<br/>
 	 	
<%-- 세로정렬 --%> 	 	
 	 	<div>
		<table>
			<tr align="center" valign="middle" class="title">
				<td height="40px" width="4%"></td>  
				<td height="40px" width="50%"></td>
			</tr>
			<%-- 글 목록 --%>
			
			<c:choose>
		     	  <c:when test = "${contentsList != null and fn:length(contentsList)>0 }">
					<c:forEach var="list" items="${contentsList }">	
					    <tr align="center" valign="middle" onmouseover="this.style.background='#bbdefb'" onmouseout="this.style.background=''">
				               <td height="23px"><a href="영화상세페이지=${list.movie_num }"><img src="${list.movie_poster}"></a><br/>
					              ${list.movie_title }</td>
			            </tr>
	         		</c:forEach>
			</c:when>
			<c:otherwise> <%-- 내용 없을 때 --%>
				<tr style="height:50px;">
		            <td colspan="5" style="text-align:center; color:#f7175a;">아직 '좋아요'한 영화가 없습니다.</td>
		        </tr>
       	 	</c:otherwise>
 	 	  </c:choose>
 	 	</div>  
</body>
</html>