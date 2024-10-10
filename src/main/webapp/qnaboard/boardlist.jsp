<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰파인더 - 게시판</title>
 <link rel="stylesheet" href="boardlist.css">	
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
</head>
<body>
<jsp:include page="/header/header.jsp"></jsp:include>
	<div class="wrap">
		<div>
		<h2>게시판</h2>
        <select name="category" onchange="location.href='/qnaboard/Category_view.bo?boardcate='+this.value;">
        	<option disabled selected>-- 카테고리 --</option>
	        <option>전체선택</option>
	        <option>공지</option>
	        <option>추천</option>
	        <option>질문</option>            
	    </select>

	   	<input type="button" value="내가 작성한 글만 보기" class="myqnachoice" onclick="location.href='/qnaboard/Mywrite_view.bo';">
	   	<input type="button" value="글 쓰기" class="write" onclick="location.href='/qnaboard/BoardWrite.bo';">
		</div>
		<br/>
		<hr align="left" style="border-top: 2px solid #f7175a; width:100%;"/>
		
		<c:set var="boardList" value="${requestScope.boardList }"/>
		<c:set var="totalCnt" value="${requestScope.totalCnt }"/>
		<c:set var="nowPage" value="${requestScope.nowPage }"/>
		<c:set var="startPage" value="${requestScope.startPage }"/>
		<c:set var="endPage" value="${requestScope.endPage }"/>
		<c:set var="totalPage" value="${requestScope.totalPage }"/>
	
		<table class="title_tb">
			<tr align="center" valign="middle" class="title">
				<td width="10%">카테고리</td>
				<td width="5%">번호</td>  
				<td width="55%">제목</td>
				<td width="15%">작성자</td>
				<td width="15%">날짜</td>
			</tr>
			<%-- 글 목록 --%>
			<c:choose>
		     	  <c:when test = "${boardList != null and fn:length(boardList)>0 }">
						<c:forEach var="board" items="${boardList }">	
						  <c:if test="${board.boardcate == '공지'}">
				         	 <tr align="center" valign="middle" onmouseover="this.style.background='#bbdefb'"onmouseout="this.style.background=''">
				           	   <td height="23px" class="${board.boardcate == '공지' ? 'change-color' : ''}">${board.boardcate }</td>
				               <td height="23px" class="${board.boardcate == '공지' ? 'change-num' : ''}">${board.boardnum }</td>
				               <td height="23px"><a href="/qnaboard/BoardView.bo?boardnum=${board.boardnum }" > ${board.boardtitle }</a> </td>
				               <td height="23px">${board.username }</td>
				               <td height="23px">${board.boarddate }</td>
				            </tr>
				           </c:if>
				         </c:forEach>
				         
				         <c:forEach var="board" items="${boardList}">
				              <c:if test="${board.boardcate != '공지'}">
				          <tr align="center" valign="middle" onmouseover="this.style.background='#bbdefb'"
				            		onmouseout="this.style.background=''">
				            <td height="23px">${board.boardcate }</td>
				               <td height="23px">${board.boardnum }</td>
				               <td height="23px"><a href="/qnaboard/BoardView.bo?boardnum=${board.boardnum }" > ${board.boardtitle }</a> </td>
				               <td height="23px">${board.username }</td>
				               <td height="23px">${board.boarddate }</td>
				            </tr>
				           </c:if>
						</c:forEach>
				</c:when>
				
				<c:otherwise> <%-- 내용 없을 때 --%>
		            <tr style="height:50px;">
			            <td colspan="5" style="text-align:center; color:#f7175a;">아직 등록된 게시물이 없습니다.</td>
			        </tr>
	       	 	</c:otherwise>
 	 	  </c:choose>
		</table><br/>
		
		<hr align="left" style="border-top: 1px solid #f7175a; width:100%;"/>

		<%-- 페이징 처리 --%>
			
		<table style="border:0px; width:100%;">
				<tr align="center" valign="middle">
					<td>
						<c:if test="${nowPage>1 }">
						<a href="${pageContext.request.contextPath}/qnaboard/BoardList.bo?page=${nowPage-1 }">[&lt;]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:choose>
								<%-- 현재 보고 있는 페이지는 a tag 제거 --%>
								<c:when test="${i == nowPage }">[${i }]</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/qnaboard/BoardList.bo?page=${i }">[${i }]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${nowPage<totalPage }">
						<a href="${pageContext.request.contextPath}/qnaboard/BoardList.bo?page=${nowPage+1 }">[&gt;]</a>
						</c:if>
					</td>
				</tr>
			</table>
	</div>
</body>
</html>