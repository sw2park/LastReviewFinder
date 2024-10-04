package com.reviewfinder.board;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.board.dao.BoardDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
				
			if(bdao.deletReply(boardnum)) {
				forward.setRedirect(true);
				forward.setPath("/qnaboard/BoardView.bo?boardnum="+boardnum);
			}
		
		return forward;
	}

}
