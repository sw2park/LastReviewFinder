package com.reviewfinder.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;import javax.xml.stream.events.Comment;

import org.json.simple.parser.ParseException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.api.KoreafilmJson;
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
		
		List<MovieDTO> similar_movie = new ArrayList<MovieDTO>();
		String first_genre = StringSlice.sliceGenre(movie).get(0);
		if(mdao.searchSimilarGenreCnt(first_genre)!=0) {
			similar_movie = mdao.selectSimilarMovie(first_genre);
		}else {
			try {
				similar_movie = new KoreafilmJson().searchToGenre(first_genre);
				mdao.insertMovieDB(similar_movie);
			} catch (IOException | ParseException e) {
				e.printStackTrace();
			}
		}
		for(int i=0;i<similar_movie.size();i++) {
			String similar_movie_poster = StringSlice.slicePosterUrl(similar_movie.get(i));
			String similar_movie_date = similar_movie.get(i).getMovie_date();
			similar_movie_date = similar_movie_date.replace("-", "").substring(0,8);
			similar_movie.get(i).setMovie_poster(similar_movie_poster);
			similar_movie.get(i).setMovie_date(similar_movie_date);
		}
		req.setAttribute("similar_movie_list", similar_movie);
		req.setAttribute("first_genre", first_genre);
		
		String poster = StringSlice.slicePosterUrl(movie);
		String still_img = StringSlice.sliceStillUrl(movie);
		List<String> still_list = StringSlice.getStillUrlArray(movie);
		List<String> actors = StringSlice.getActors(movie);
		List<String> directors = StringSlice.getDirectors(movie);
		
		movie.setMovie_poster(poster);
		movie.setMovie_still_image(still_img);
		
		String rating = "0";
		if(mdao.selectRatingCount(movie.getMovie_num())!=0) {
			rating = ""+((int)mdao.selectTotalRating(movie.getMovie_num()));
		}
		req.setAttribute("rating", rating);
		
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
