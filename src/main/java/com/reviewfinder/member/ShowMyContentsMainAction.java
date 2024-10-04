package com.reviewfinder.member;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberContentsDTO;
import com.reviewfinder.member.dao.MemberDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShowMyContentsMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		String userid = req.getParameter("userid");
		
		req.setAttribute("contentsList", mdao.getContentsList(userid));
		forward.setRedirect(false);//foward이동
		forward.setPath("/mypage/mypage.jsp");
		return forward;
	}
	
	

}
