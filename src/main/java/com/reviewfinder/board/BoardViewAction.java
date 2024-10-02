package com.reviewfinder.board;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.board.dao.BoardDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		
		req.setAttribute("board", bdao.getDetail(boardnum));
		forward.setRedirect(false);//foward이동
		forward.setPath("/qnaboard/boardview.jsp");
		
		return forward;
	}

}
