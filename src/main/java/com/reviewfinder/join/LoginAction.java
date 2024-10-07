package com.reviewfinder.join;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberDAO;

import com.reviewfinder.member.dao.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();

		HttpSession Session = req.getSession();
		
		MemberDAO mdao = new MemberDAO();
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
	
		MemberDTO mdto = mdao.login(userid, userpw);
		
		forward.setRedirect(true);
		
		if (mdto != null){ //로그인 성공(성공 시 메인 페이지로 연결해야함)
			Session.setAttribute("session_id", mdto);
			forward.setPath("/mypage/mypage.jsp");
			mdto.setUserpw(null);
		} else {						//로그인 실패
			forward.setPath("../join/login.jsp?flag=false");
		}
	
		return forward;
	}
}
