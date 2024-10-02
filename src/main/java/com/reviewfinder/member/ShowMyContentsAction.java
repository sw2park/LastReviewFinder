package com.reviewfinder.member;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.member.dao.MemberContentsDTO;
import com.reviewfinder.member.dao.MemberDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShowMyContentsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		MemberContentsDTO mcDto = new MemberContentsDTO();
		
		
		
		
		return forward;
	}
	
	

}
