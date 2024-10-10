package com.reviewfinder.main;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.main.dao.MainDAO;
import com.reviewfinder.member.dao.MemberDAO;
import com.reviewfinder.member.dao.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

public class MoveMainAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("/main/GetBoxOffice.ma");
		
		return forward;
	}
}
