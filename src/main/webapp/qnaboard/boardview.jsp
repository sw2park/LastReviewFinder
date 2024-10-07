<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="boardview.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
</head>
<body onload="checkUserRole()">

	<c:set var="board" value="${requestScope.board }"/>
   
	<div class="container">
	  <div class="row">
	    <div class="label">제 목</div>
	    <div class="content">${board.boardtitle}</div>
	  </div>
	  <div class="row">
	    <div class="label">작성자</div>
	    <div class="content">${board.username}</div>
	  </div>
	  <div class="row">
	    <div class="label">내 용</div>
	    <div class="content">${board.boardcontents}</div>
	  </div>
	</div>
   <hr/>
   
   <div>
      <form name="replyForm2" action="/qnaboard/UpdateReply.bo" method="post">
      <!-- 댓글 리스트 -->
      <input type="hidden" name="boardnum" value="${board.boardnum }">
         <table>
            <c:choose>
	    	   <c:when test = "${board.adminreply != null }">
	 			 <tr>
	               <td align="center" width="200px">
	               답변</td>         
	               <td valign="top" style="padding-left:10px;">
	                  <textarea style="text-align:left;border:0px;width:680px; color: #f7175a; height:85px;resize:none;" name="replyUP${board.boardnum }" id="replyUP${board.boardnum }" readonly>
	                     ${board.adminreply }
	                  </textarea><br>
	                 <c:choose>
	                  <c:when test="${sessionScope.session_id.usergrade == 'ADMIN'}">
	                  <a style="padding: 5px 10px; border: 1px solid #f7175a; text-decoration: none; color: #f7175a; border-radius: 25px;" href="javascript:updateReply(${board.boardnum })">수정완료</a>
	                  &nbsp;&nbsp;&nbsp;
	                  <a style="padding: 5px 10px; border: 1px solid #f7175a; text-decoration: none; color: #f7175a; border-radius: 25px;" href="javascript:updateReadonlyReply(${board.boardnum })">수정하기</a>
	                  &nbsp;&nbsp;&nbsp;
	                  <a style="padding: 5px 10px; border: 1px solid #f7175a; text-decoration: none; color: #f7175a; border-radius: 25px;" href="javascript:deleteReply(${board.boardnum })">삭제</a>
	                 </c:when>
	                  </c:choose>
	               </td>
	            </tr>
					
				</c:when>
				<c:otherwise> <%-- 내용 없을 때 --%>
				   <tr>
	                     <td align="center" style="color: #f7175a;">
	                     지금 관리자가 내용을 확인하고 있습니다.</td>
	                  </tr>
	       	 </c:otherwise>
	        </c:choose>
         </table>
      </form>
      <br/><br/>
   </div>
        
      <!-- 댓글 -->
      
      <form name="replyForm1" action="/qnaboard/AddReply.bo" method="post">
         <input type="hidden" name="boardnum" value="${board.boardnum }">
         <table>
              <c:choose>
	    	   <c:when test = "${sessionScope.session_id.usergrade == 'ADMIN'}">
            <tr>
               <td align="center" width="200px" style="color: #f7175a;">
                  관리자<br><hr>
               </td>
               <td style="padding-left:10px">
                  <textarea name="reply${board.boardnum }" style="width:680px;height:85px;resize:none; border: 1px solid #f7175a; border-radius: 10px; "></textarea><br>
                   <input type="button" value="답변하기" class="Answer" onclick="document.replyForm1.submit();"></td>
               </td>
            </tr>
            </c:when>
            </c:choose>
         </table>
       	 <div style="text-align: right">
   			<input type="button" id="Modify" value="수정하기" class="Answer" onclick="location.href='/qnaboard/boardupdate.jsp?boardnum='+${board.boardnum };">
   			<input type="button" id="Delete" value="삭제하기" class="Answer" onclick="deleteBoard(${board.boardnum });">
   		</div>
   		<div style="text-align: center">
   			<input type="button" value="목록" class="BacktoList" onclick="location.href='/qnaboard/BoardList.bo';">
   		</div>
   	<script>

   	
   	function updateReply(boardnum){
  		 var result = confirm("정말로 수정할까요?");
	 	if(result){
	 		  document.replyForm2.action = "/qnaboard/UpdateReply.bo";
	 	      document.replyForm2.submit();
		} else {
			alert("작업을 취소합니다.")
		}
  	}
   	
   	function updateReadonlyReply(boardnum){
		document.getElementById('replyUP'+boardnum).readOnly = false;
   	}
   	
   	function deleteReply(boardnum){
		 var result = confirm("정말로 삭제할까요?");
			 if(result){
			document.replyForm2.action = "/qnaboard/DeleteReply.bo?boardnum="+boardnum;
			document.replyForm2.submit();
			 } else{
				 alert("삭제를 취소합니다.");
			 }
   	}
   	
 	function deleteBoard(boardnum){
		 var result = confirm("정말로 삭제할까요?");
			 if(result){
				 location.href='/qnaboard/DeleteBoard.bo?boardnum='+boardnum;
			 } else{
				 alert("삭제를 취소합니다.");
			 }
  	}
   	
    function checkUserRole() {
        var userRole = '${sessionScope.session_id.usergrade}';
        var writeName = '${board.username }';
        var userName = '${sessionScope.session_id.username}';
        
        if (userRole !== 'ADMIN' && writeName !== userName ) {
            document.getElementById('Modify').remove();
            document.getElementById('Delete').remove();
        }
    }
   	
   	</script>

</body>
</html>