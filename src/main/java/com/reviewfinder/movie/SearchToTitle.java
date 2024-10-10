package com.reviewfinder.movie;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.parser.ParseException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.api.KobisJson;
import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.util.StringSlice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchToTitle implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		String movie_title = req.getParameter("movie_title");
		List<MovieDTO> movieList = new ArrayList<MovieDTO>();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			movieList = new KobisJson().searchToMovieName(movie_title);
			
			List<Integer> deleteList = new ArrayList<Integer>();
			for(int i=0;i<movieList.size();i++) {
				if(movieList.get(i).getMovie_poster()==null || movieList.get(i).getMovie_poster().trim().equals("")) {
					deleteList.add(i);
				}else {
					movieList.get(i).setMovie_poster(StringSlice.slicePosterUrl(movieList.get(i)));
					movieList.get(i).setMovie_still_image(StringSlice.sliceStillUrl(movieList.get(i)));
					
					String strDate = movieList.get(i).getMovie_date();
					
					Calendar cal = Calendar.getInstance();
					int yy = Integer.parseInt(strDate.substring(0,4));
					int mm = Integer.parseInt(strDate.substring(4,6))-1;
					int dd = Integer.parseInt(strDate.substring(6,8));
					
					cal.set(yy, mm, dd);
					Date date = cal.getTime();
					String day = format.format(date);
					movieList.get(i).setMovie_date(day);
				}
			}
			
			for(int i=0;i<deleteList.size();i++) {
				int delete_num= deleteList.get(i);
				movieList.remove(delete_num);
			}
			
			req.setAttribute("movieList", movieList);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		} 
		
		forward.setRedirect(false);
		forward.setPath("/search/searchResult.jsp");
		
		return forward;
	}
}
