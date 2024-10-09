package com.reviewfinder.movie;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDAO;
import com.reviewfinder.movie.dao.MovieDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MovieDetailsToNum implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		MovieDAO mdao = new MovieDAO();
		MovieDTO movie = new MovieDTO();
		
		int movie_num = Integer.parseInt(req.getParameter("movie_num"));
		String movie_title;
		String movie_date;
		
		movie = mdao.selectMovieWithNum(movie_num);
		
		movie_title = movie.getMovie_title();
		movie_date = movie.getMovie_date();
		
		movie_date = movie_date.replace("-", "").substring(0,8);
		
		forward.setRedirect(false);
		forward.setPath("/movie/MovieDetails.mv?movie_title="+movie_title+"&movie_date="+movie_date);
		
		return forward;
	}
}
