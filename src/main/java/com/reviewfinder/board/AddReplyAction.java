package com.reviewfinder.board;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.board.dao.BoardDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		String admin_reply = req.getParameter("reply"+boardnum);
				
		if(bdao.updateReply(boardnum, admin_reply)) {
			forward.setRedirect(true);
			forward.setPath("/qnaboard/BoardView.bo?boardnum="+boardnum);
		}
		
		return forward;
	}

}
