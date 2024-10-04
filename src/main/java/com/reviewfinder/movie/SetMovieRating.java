package com.reviewfinder.movie;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SetMovieRating implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		int rating = Integer.parseInt((String)req.getParameter("rating"));
		
		MovieDAO mdao = new MovieDAO();
		
		mdao.insertRating(rating);
		
		try {
			resp.getWriter().write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
