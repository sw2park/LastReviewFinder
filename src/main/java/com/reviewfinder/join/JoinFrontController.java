package com.reviewfinder.join;

import java.io.IOException;

import com.reviewfinder.action.ActionForward;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.lo")
public class JoinFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	
		String requestURI = request.getRequestURI();
		ActionForward forward = null;
		
		switch(requestURI) {
		case "/join/login.lo":
			// 로그인
			forward = new LoginAction().execute(request, response);
			break;
		case "/join/join.lo":
			// 회원가입
			forward = new JoinAction().execute(request, response);
			break;
		case "/join/logout.lo":
			// 로그아웃
			forward = new LogoutAction().execute(request, response);
			break;
		case "/login/login.lo":
			forward = new ActionForward(true, "/join/login.jsp");
			break;
		case "/login/join.lo":
			forward = new ActionForward(true, "/join/join_view.jsp");
			break;
		}
		
		if(forward != null) {
	         if(forward.isRedirect()) {
	        	 response.sendRedirect(forward.getPath());
	         }else {
	            RequestDispatcher disp = request.getRequestDispatcher(forward.getPath());
	            disp.forward(request, response);
	         }
	      }
		
	
	}
}
