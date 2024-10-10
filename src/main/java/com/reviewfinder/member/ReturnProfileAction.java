package com.reviewfinder.member;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberDAO;
import com.reviewfinder.member.dao.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ReturnProfileAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("session_id");
		
		String userid = mdto.getUserid();
		String profile = "profile.png";
		if(mdao.updateProfile(userid, profile)) {
			forward.setRedirect(true);
			forward.setPath("/mypage/ShowMyContentsMain.mp");
		}
		return forward;
	}

}
