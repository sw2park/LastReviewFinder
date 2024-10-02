package com.reviewfinder.rec;

import java.util.Iterator;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.rec.dao.RecDAO;
import com.reviewfinder.util.PosterSlice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ShowResultAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		HttpSession roundSession = req.getSession();
		roundSession.removeAttribute("roundSession");
		
		RecDAO rdao = new RecDAO();
		MovieDTO movie = new MovieDTO();
		int movie_num = 0;
		
		movie_num = rdao.getWinnerNum();
		movie = rdao.getMovieByMovieNum(movie_num);
		
		String poster = PosterSlice.slicePosterUrl(movie);
		movie.setMovie_poster(poster);
		
		// 날짜에서 시간 자르기
		String movie_date = movie.getMovie_date();
		int idx = movie_date.indexOf(" ");
		movie_date = movie_date.substring(0,idx);
		movie.setMovie_date(movie_date);
		
		req.setAttribute("movie", movie);
		
		forward.setRedirect(false);
		forward.setPath("/rec/rec_result.jsp");
		
		return forward;
	}
}
