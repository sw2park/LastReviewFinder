package com.reviewfinder.movie;

import java.util.List;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDAO;
import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.util.PosterSlice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MovieDetails implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
			
		String movie_title = req.getParameter("movie_title");
		String movie_date = req.getParameter("movie_date");
		
		MovieDAO mdao = new MovieDAO();
		MovieDTO movie = new MovieDTO();
		
		movie = mdao.selectMovieFromDB(movie_title, movie_date);
		
		String poster = PosterSlice.slicePosterUrl(movie);
		String still_img = PosterSlice.sliceStillUrl(movie);
		List<String> still_list = PosterSlice.getStillUrlArray(movie);
		
		movie.setMovie_poster(poster);
		movie.setMovie_still_image(still_img);
		
//		System.out.println(still_list.get(0));
//		System.out.println(still_list.get(1));
		
		req.setAttribute("moviedto", movie);
		req.setAttribute("still_list", still_list);
		
		
		forward.setRedirect(false);
		forward.setPath("/movie/moviedetails.jsp");
		
		return forward;
	}
}
