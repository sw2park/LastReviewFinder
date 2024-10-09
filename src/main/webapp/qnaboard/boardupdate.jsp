<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
<link rel="stylesheet" href="boardupdate.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
</head>
	<body onload="checkUserRole()">
<jsp:include page="/header/header.jsp"></jsp:include>
	<c:if test="${not param.flag and not empty param.flag }">
		<script>
			alert("게시글 수정 실패. 다시 시도하세요.");
		</script>
	</c:if>
	
      <c:set var="board" value="${requestScope.board }"/>
      <%    // URL 쿼리 파라미터에서 boardnum 값을 가져옴
    String boardNum = request.getParameter("boardnum"); %>
    
   <div class="wrap">
      <form method="post" name="ModifyForm" action="/qnaboard/UpdateBoardAction.bo">
         <table border="0" style="border-collapse:collapse;">
        	  <tr height="30px">
               <th align="center" width="150px" style="color: #f7175a;">
                  카테고리
               </th>
               <td>
                  <select name="boardcate">
		            <option disabled selected>유형을 선택하세요</option>
		            <option id="noticeOption">공지</option>
		            <option>추천</option>
		            <option>질문</option>            
	        </select>
               </td>
            </tr>
            <tr height="30px">
               <th align="center" width="150px" style="color: #f7175a;">
                  제 목
               </th>
               <td>
                  <input name="boardtitle" size="50" maxlength="100" value="">
               </td>
            </tr>
            <tr height="30px">
               <th align="center" width="150px" style="color: #f7175a;">
                  작성자
               </th>
               <td style="color: #f7175a;">
                  <input type="hidden" name="username" value="${sessionScope.session_id.username}">${sessionScope.session_id.username}
                  <input type="hidden" name="boardnum" value="<%= boardNum %>">
               </td>
            </tr>
            <tr height="300px">
               <th align="center" width="150px" style="color: #f7175a;">
                  내 용
               </th>
               <td>
                  <textarea name="boardcontents" style="width:700px;height:250px;" value=""></textarea>               
               </td>
            </tr>
         </table>
         <table class="button">
            <tr>
               <td>
                	<input type="button" value="작성 완료" class="WriteOK" onclick="document.ModifyForm.submit();">
                    <input type="button" value="취소" class="BacktoList" onclick="location.href='/qnaboard/BoardList.bo';">
               </td>
            </tr>
         </table>
      </form>
   </div>
   
 <script>
        function checkUserRole() {
            var userRole = '${sessionScope.session_id.usergrade}';
            if (userRole !== 'ADMIN') {
                // admin이 아닌 경우 "공지" 옵션 제거
                document.getElementById('noticeOption').remove();
            }
        }
        

    </script>
</body>
</html>