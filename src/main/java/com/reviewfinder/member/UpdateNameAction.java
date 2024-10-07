package com.reviewfinder.member;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberDAO;
import com.reviewfinder.member.dao.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateNameAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		
		String userid = req.getParameter("userid");
		String username = req.getParameter("username");
		if(mdao.updateName(userid, username)) {
			forward.setRedirect(true);
			forward.setPath("../mypage/mypage.jsp");
		}
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("session_id");

		// username 변경
		if (mdto != null) {
			mdto.setUsername(username);
		}
		// 변경된 객체를 다시 세션에 저장합니다.
		session.setAttribute("session_id", mdto);
		return forward;
	}

}
