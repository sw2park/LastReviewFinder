package com.reviewfinder.movie;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.parser.ParseException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.api.KobisJson;
import com.reviewfinder.boxoffice.dao.BoxOfficeDTO;
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
		MovieDAO mdao = new MovieDAO();
		BoxOfficeDTO bDto = new BoxOfficeDTO();
		
		try {
			// BoxOfficeRank에 데이터 있는지 여부 확인 후
			if(!mdao.checkBoxOfficeRank()) { // 값이 없을때
				for(int i=0; i>-3; i--) {
					String month = ""+(Integer.parseInt(date.getDay(i))-1);
					// BoxOffice 데이터를 가져옴
					boxOffice = kobisJson.getBoxOffice(month);
					mdao.insertMovieDB(boxOffice);
					
					
					for(int j=1; j<=10; j++) {
						int movieNum = mdao.selectMovieNum(boxOffice, month, j);
						
						bDto.setBoxoffice_date(month);
						bDto.setMovie_num(movieNum);
						bDto.setMovie_rank(j);
						
						mdao.insertBoxOffice(bDto);
					}
				}
			}
		} catch (ParseException | IOException e) {
			e.printStackTrace();
		}
		
		forward.setRedirect(true);
		forward.setPath("/main/main.ma");
		
		return forward;
	}
}