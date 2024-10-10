package com.reviewfinder.member;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberDAO;
import com.reviewfinder.member.dao.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteMemberAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("session_id");
		String userid = mdto.getUserid();
		
		if(mdao.deleteMember(userid)) {
			forward.setRedirect(true);
			forward.setPath("../main/main.jsp");
		}
		
		return forward;
	}

}
