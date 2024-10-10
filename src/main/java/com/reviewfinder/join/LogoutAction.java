package com.reviewfinder.join;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {

		ActionForward forward = new ActionForward();
		HttpSession Session = req.getSession();
		
		Session.removeAttribute("session_id");
		Session.invalidate();
		
		try {
			resp.sendRedirect("/main/main.ma");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}