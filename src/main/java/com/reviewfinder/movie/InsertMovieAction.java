package com.reviewfinder.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.json.simple.parser.ParseException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.api.KobisJson;
import com.reviewfinder.movie.dao.MovieDAO;
import com.reviewfinder.movie.dao.MovieDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertMovieAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		KobisJson kobisJson = new KobisJson();
//		HashMap<String, MovieDTO> boxOfficeList = null;
		List<MovieDTO> movieList = null;
		
		try {
//			boxOfficeList = kobisJson.getBoxOffice();
			movieList = kobisJson.getRecommendList();
		} catch (ParseException | IOException e) {
			e.printStackTrace();
		}
		
		MovieDAO mdao = new MovieDAO();
//		mdao.insertMovieDB(boxOfficeList);
		mdao.insertMovieDB(movieList);
		
		forward.setRedirect(true);
		
		forward.setPath("/movie/InsertBoxoffice.mv");
		
		return forward;
	}
	
}
