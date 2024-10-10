package com.reviewfinder.board;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.board.dao.BoardDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		
		if(bdao.deleteBoard(boardnum)) {
			forward.setRedirect(true);
			forward.setPath("/qnaboard/BoardList.bo");
		}
		
		return forward;
	}

}
