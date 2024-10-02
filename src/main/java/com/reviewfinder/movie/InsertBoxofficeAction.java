package com.reviewfinder.movie;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.parser.ParseException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.api.KobisJson;
import com.reviewfinder.date.DateController;
import com.reviewfinder.movie.dao.MovieDAO;
import com.reviewfinder.movie.dao.MovieDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertBoxofficeAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		DateController date = new DateController();
		KobisJson kobisJson = new KobisJson();
		HashMap<String, MovieDTO> boxOffice  = null;
		
		try {
			// BoxOffice 데이터를 가져옴
			boxOffice = kobisJson.getBoxOffice(date.getToday());
			System.out.println(boxOffice.values());
		} catch (ParseException | IOException e) {
			e.printStackTrace();
		}
		
		if(boxOffice != null) {
			MovieDAO mdao = new MovieDAO();
			mdao.insertBoxOffice(boxOffice);
		} else {
			System.out.println("boxOffice is null");
		}
		
		forward.setRedirect(true);
		forward.setPath("/main/main.ma");
		
		return forward;
	}
}
