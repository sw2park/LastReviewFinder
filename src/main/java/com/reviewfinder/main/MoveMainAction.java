package com.reviewfinder.main;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.main.dao.MainDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MoveMainAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		MainDAO mdao = new MainDAO();
		
		forward.setRedirect(true);
		forward.setPath("/main/GetBoxOffice.ma");
		
		return forward;
	}
}
