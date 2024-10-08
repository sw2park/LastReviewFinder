<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="boardwrite.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<style>
	html {
	  	  font-family: 'Pretendard';
	    }
	</style>
</head>
<body onload="checkUserRole()">
<jsp:include page="/header/header.jsp"></jsp:include>
	<c:if test="${not param.flag and not empty param.flag }">
		<script>
			alert("게시글 등록 실패. 다시 시도하세요.");
		</script>
	</c:if>
   <div>
      
      <form method="post" name="boardForm" action="/qnaboard/BoardWriteOk.bo">
       
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
		            <option>문의</option>            
	        </select>
               </td>
            </tr>
            <tr height="30px">
               <th align="center" width="150px" style="color: #f7175a;">
                  제 목
               </th>
               <td>
                  <input name="boardtitle" size="50" maxlength="100" value="" placeholder="제목을 입력하세요">
               </td>
            </tr>
            <tr height="30px">
               <th align="center" width="150px" style="color: #f7175a;">
                  작성자
               </th>
               <td style="color: #f7175a;">
                  <input type="hidden" name="username" value="${sessionScope.session_id.username}">${sessionScope.session_id.username}
               </td>
            </tr>
            <tr height="300px">
               <th align="center" width="150px" style="color: #f7175a;">
                  내 용
               </th>
               <td>
                  <textarea name="boardcontents" style="width:700px;height:250px;" placeholder="내용을 입력하세요"></textarea>               
               </td>
            </tr>
         </table>
         <table class="button">
            <tr>
               <td>
                	<input type="button" value="작성 완료" class="WriteOK" onclick="document.boardForm.submit();">
                    <input type="button" value="취소" class="BacktoList" onclick="location.href='/qnaboard/BoardList.bo';"></td>
            </tr>
         </table>
      </form>
   </div>
   
 <script>
        function checkUserRole() {
            var userRole = '${sessionScope.session_id.usergrade}';
            if (userRole !== 'ADMIN') {
                // admin이 아닌 경우 "notice" 옵션 제거
                document.getElementById('noticeOption').remove();
            }
        }
    </script>
</body>
</html>