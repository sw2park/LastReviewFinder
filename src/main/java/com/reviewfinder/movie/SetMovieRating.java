package com.reviewfinder.movie;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDAO;
import com.reviewfinder.movie.dao.MovieDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SetMovieRating implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		int rating = Integer.parseInt((String)req.getParameter("rating"));
		int movie_num = Integer.parseInt((String)req.getParameter("movie_num"));
		
		MovieDAO mdao = new MovieDAO();
		
		mdao.updateRatingCount(movie_num);
		mdao.updateRating(rating,movie_num);
		double total_rating = mdao.selectTotalRating(movie_num);
		
		try {
			resp.setContentType("text/html;charset=UTF-8");
			resp.getWriter().write(""+((int) total_rating));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
