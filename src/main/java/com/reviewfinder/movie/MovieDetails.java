package com.reviewfinder.movie;

import java.util.List;
import javax.xml.stream.events.Comment;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.comment.dao.CommentDAO;
import com.reviewfinder.comment.dao.CommentDTO;
import com.reviewfinder.movie.dao.MovieDAO;
import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.util.StringSlice;

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
		CommentDAO cdao = new CommentDAO();
		
		List<CommentDTO> commentList = cdao.getCommentList();
		
		movie = mdao.selectMovieFromDB(movie_title, movie_date);
		
		String poster = StringSlice.slicePosterUrl(movie);
		String still_img = StringSlice.sliceStillUrl(movie);
		List<String> still_list = StringSlice.getStillUrlArray(movie);
		List<String> actors = StringSlice.getActors(movie);
		List<String> directors = StringSlice.getDirectors(movie);
		
		movie.setMovie_poster(poster);
		movie.setMovie_still_image(still_img);
		
//		System.out.println(still_list.get(0));
//		System.out.println(still_list.get(1));
		
		req.setAttribute("moviedto", movie);
		req.setAttribute("still_list", still_list);
		req.setAttribute("actors", actors);
		req.setAttribute("directors", directors);
		req.setAttribute("commentList", commentList);
		
		forward.setRedirect(false);
		forward.setPath("/movie/moviedetails.jsp");
		
		return forward;
	}
}
