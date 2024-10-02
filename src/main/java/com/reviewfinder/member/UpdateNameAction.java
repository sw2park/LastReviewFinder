package com.reviewfinder.member;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateNameAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		
		String userid = req.getParameter("userid");
		String username = req.getParameter("username");
		if(mdao.updateName(userid, username)) {
			forward.setRedirect(true);
			forward.setPath("../main/main.jsp");
		}
		
		
		return forward;
	}

}
