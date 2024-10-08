package com.reviewfinder.board;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.board.dao.BoardDAO;
import com.reviewfinder.board.dao.BoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		String boardcate = req.getParameter("boardcate");
		String boardtitle = req.getParameter("boardtitle");
		String boardcontents = req.getParameter("boardcontents");
		
		if(bdao.updateBoard(boardnum, boardcate, boardtitle, boardcontents)) { 
			forward.setRedirect(true);
			forward.setPath("/qnaboard/BoardView.bo?boardnum="+boardnum);
		}
		
		return forward;
	}

}
