package com.reviewfinder.board;

import java.io.IOException;

import com.reviewfinder.action.ActionForward;
import com.reviewfinder.join.JoinAction;
import com.reviewfinder.join.LoginAction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	
		String requestURI = request.getRequestURI();
		ActionForward forward = null;
	
		switch(requestURI) {
		
		case "/qnaboard/BoardList.bo":
			//게시글 목록 노출
			forward = new BoardListAction().execute(request, response);
			break;	
			
		case "/qnaboard/Category_view.bo":
			forward = new CategoryViewAction().execute(request, response);
			break;
			
		case "/qnaboard/Mywrite_view.bo":
			//버튼 클릭 시 본인이 작성한 게시글만 볼 수 있게 처리
			forward = new MywriteAction().execute(request, response);
			break;
			
		case "/qnaboard/BoardWrite.bo":
			forward = new ActionForward(true, "/qnaboard/boardwrite.jsp");
			break;
			
		case "/qnaboard/BoardWriteOk.bo":
			//게시글 작성(db에 반영)
			forward = new BoardWriteOKAction().execute(request, response);
			break;
		
		case "/qnaboard/UpdateBoardAction.bo":
			//게시글 수정(db에 반영)
			forward = new UpdateBoardAction().execute(request, response);
			break;
			
		case "/qnaboard/DeleteBoard.bo":
			//게시글 삭제
			forward = new DeleteBoardAction().execute(request, response);
			break;
			
		case "/qnaboard/BoardView.bo":
			//게시글 상세 페이지로 이동
			forward = new BoardViewAction().execute(request, response);
			break;
			
		case "/qnaboard/AddReply.bo":
			//댓글 달기
			forward = new AddReplyAction().execute(request, response);
			break;
			
		case "/qnaboard/UpdateReply.bo":
			//댓글 수정
			forward = new UpdateReplyAction().execute(request, response);
			break;
		
		case "/qnaboard/DeleteReply.bo":
			//댓글 삭제
			forward = new DeleteReplyAction().execute(request, response);
			break;
			
		}

		if(forward != null) {
	         if(forward.isRedirect()) {
	        	 response.sendRedirect(forward.getPath());
	         }else {
	            RequestDispatcher disp = request.getRequestDispatcher(forward.getPath());
	            disp.forward(request, response);
	         }
	      }
		
	
	}
	
}
