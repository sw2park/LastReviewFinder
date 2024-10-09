package com.reviewfinder.board;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.board.dao.BoardDAO;
import com.reviewfinder.board.dao.BoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardWriteOKAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = new BoardDTO();
		
		
	   HttpSession Session = req.getSession();  // HttpSession 객체 가져오기
	  
	   String username = req.getParameter("username"); // 세션에 저장된 "username" 가져오기
	   String userid = req.getParameter("userid");
		
		String boardcate = req.getParameter("boardcate");
		String boardtitle = req.getParameter("boardtitle");
		String boardcontents = req.getParameter("boardcontents");
		
		bdto.setBoardcate(boardcate);
		bdto.setUsername(username);
		bdto.setUserid(userid);
		bdto.setBoardtitle(boardtitle);
		bdto.setBoardcontents(boardcontents);

		forward.setRedirect(true);
		
		if(bdao.insertBoard(bdto)) {
			int boardnum = bdao.getSeq();

			forward.setPath("/qnaboard/BoardView.bo?boardnum="+boardnum);
			
			} else {
			
				forward.setPath("/qnaboard/BoardWrite.bo?flag=false");
			}
		
		return forward;
	}
 
}
