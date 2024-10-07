package com.reviewfinder.main;

import java.util.List;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.date.DateController;
import com.reviewfinder.main.dao.MainDAO;
import com.reviewfinder.main.dao.MainDTO;
import com.reviewfinder.util.StringSlice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetBoxOfficeAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		MainDAO mdao = new MainDAO();
		DateController date = new DateController();
		
		String month = ""+(Integer.parseInt(date.getDay(0))-1);
		List<MainDTO> mainDTO = mdao.selectBoxOffce(month);
		
		for(int i=0; i<10; i++) {
			String poster = StringSlice.slicePosterUrl(mainDTO.get(i));
			String movieDate = mainDTO.get(i).getMovie_date();
			
			movieDate = movieDate.substring(0, 11);
			
			mainDTO.get(i).setMovie_poster(poster);;
			mainDTO.get(i).setMovie_date(movieDate);
		}
		
		String last = ""+(Integer.parseInt(date.getDay(-1))-1);
		List<MainDTO> lastDTO = mdao.selectBoxOffce(last);
		
		for(int i=0; i<10; i++) {
			String poster = StringSlice.slicePosterUrl(lastDTO.get(i));
			String movieDate = lastDTO.get(i).getMovie_date();
			
			movieDate = movieDate.substring(0, 11);
			
			lastDTO.get(i).setMovie_poster(poster);;
			lastDTO.get(i).setMovie_date(movieDate);
		}
		
		String lastlast = ""+(Integer.parseInt(date.getDay(-2))-1);
		List<MainDTO> lastLastDTO = mdao.selectBoxOffce(lastlast);
		
		for(int i=0; i<10; i++) {
			String poster = StringSlice.slicePosterUrl(lastLastDTO.get(i));
			String movieDate = lastLastDTO.get(i).getMovie_date();
			
			movieDate = movieDate.substring(0, 11);
			
			lastLastDTO.get(i).setMovie_poster(poster);;
			lastLastDTO.get(i).setMovie_date(movieDate);
		}
		
		req.setAttribute("mainDTO", mainDTO);
		req.setAttribute("lastDTO", lastDTO);
		req.setAttribute("lastLastDTO", lastLastDTO);
		
		forward.setRedirect(false);
		forward.setPath("/main/main.jsp");
		
		return forward;
	}
}
