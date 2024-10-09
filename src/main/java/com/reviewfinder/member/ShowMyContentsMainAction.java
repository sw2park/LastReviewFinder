package com.reviewfinder.member;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberContentsDTO;
import com.reviewfinder.member.dao.MemberDAO;
import com.reviewfinder.member.dao.MemberDTO;
import com.reviewfinder.movie.dao.MovieDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ShowMyContentsMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("session_id");
		
		String userid = mdto.getUserid();
		
		
		req.setAttribute("contentsList", mdao.getContentsList(userid));
		forward.setRedirect(false);//foward이동
		forward.setPath("/mypage/mypage.jsp");
		return forward;
	}
	
	

}
