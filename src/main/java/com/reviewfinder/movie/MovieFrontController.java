package com.reviewfinder.movie;

import java.io.IOException;

import com.reviewfinder.action.ActionForward;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.mv")
public class MovieFrontController extends HttpServlet{
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
		
		if(requestURI.equals("/movie/MovieBasicSetteing.mv")) {
			forward = new MovieBasicInsertAction().execute(request, response);
		}else if(requestURI.equals("/movie/InsertMovieDB.mv")) {
			forward = new InsertMovieAction().execute(request, response);
		}else if(requestURI.equals("/movie/InsertBoxoffice.mv")){
			forward = new InsertBoxofficeAction().execute(request, response);
		}else if(requestURI.equals("/movie/MovieDetails.mv")) {	//임시
			forward = new MovieDetails().execute(request, response);
		}else if(requestURI.equals("/movie/SetMovieRating.mv")) {
			new SetMovieRating().execute(request, response);
		}else if(requestURI.equals("/movie/CheckPreviousRate.mv")) {
			new CheckPreviousRate().execute(request, response);
		}else if(requestURI.equals("/movie/ModifyMovieRating.mv")) {
			new ModifyMovieRating().execute(request, response);
		}else if(requestURI.equals("/movie/TotalRatingCnt.mv")) {
			new TotalRatingCnt().execute(request, response);
		}else if(requestURI.equals("/movie/MovieDetailsToNum.mv")) {
			forward = new MovieDetailsToNum().execute(request, response);
		}else if(requestURI.equals("/movie/SearchToTitle.mv")) {
			forward = new SearchToTitle().execute(request, response);
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









