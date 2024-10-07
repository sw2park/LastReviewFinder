package com.reviewfinder.rec;

import java.io.IOException;

import com.reviewfinder.action.ActionForward;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.rec")
public class RecFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String requestURI = request.getRequestURI();
		ActionForward forward = null;
		
		if(requestURI.equals("/rec/RecSelectedRound.rec")) {
			forward = new GetMovieListAction().execute(request, response);
		}else if(requestURI.equals("/rec/RecGetSelectMovie.rec")){
			forward = new GetSelectMovieAction().execute(request, response);
		}else if(requestURI.equals("/rec/RecSelectMovie.rec")) {
			forward = new SelectMovieAction().execute(request, response);
		}else if(requestURI.equals("/rec/RecShowResult.rec")) {
			forward = new ShowResultAction().execute(request, response);
		}else if(requestURI.equals("/rec/RecMain.rec")) {
			forward = new ActionForward(true, "/rec/rec.jsp");
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher disp = request.getRequestDispatcher(forward.getPath());
				disp.forward(request, response);
			}
		}
	}
	
}
