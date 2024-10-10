package com.reviewfinder.movie;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDAO;
import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.movie.dao.UserRateDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SetMovieRating implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		int rating = Integer.parseInt(req.getParameter("rating"));
		int movie_num = Integer.parseInt(req.getParameter("movie_num"));
		String userid = req.getParameter("userid");
		
		MovieDAO mdao = new MovieDAO();
		UserRateDTO userRate = new UserRateDTO();
		
		userRate.setMovie_num(movie_num);
		userRate.setUser_star_rate(rating);
		userRate.setUserid(userid);
		
		mdao.updateRatingCount(movie_num);
		mdao.updateRating(rating,movie_num);
		mdao.insertUserRating(userRate);
		
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
