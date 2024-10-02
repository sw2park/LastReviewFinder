package com.reviewfinder.rec;

import java.util.List;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.rec.dao.RecDAO;
import com.reviewfinder.rec.dao.RecDTO;
import com.reviewfinder.util.PosterSlice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GetSelectMovieAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		List<MovieDTO> movieList = null;
		List<RecDTO> recList = null;
 		RecDAO rdao = new RecDAO();
 		
 		HttpSession roundSession = req.getSession();
		int round = Integer.parseInt((String)roundSession.getAttribute("roundSession"));
		int cur_round;
		int movie_cnt = rdao.selectRecMovieCnt();
		cur_round = (round/2) - (movie_cnt/2) + 1;
		
		if(cur_round > round/2) {
			roundSession.setAttribute("roundSession", ""+(round/2)+"");
			rdao.updateIsSelectedAll();
			cur_round = 1;
		}
 		
		req.setAttribute("cur_round", cur_round);
		
		// 월드컵에 사용 할 영화 num 2개 뽑아오기 (movie_num 낮은 순으로)
		recList = rdao.selectTopUnselectedMovies();
		
		// recList의 movieNum값으로 movieList 뽑아오기
		movieList = rdao.getMoviesByMovieNumList(recList);
		
		// 뽑아온 List들 RECOMMEND_MOVIE 테이블에서 is_selected 1로 세팅
		rdao.updateIsSelected(recList);
		
		// movieList의 포스터 URL 잘라주기
		for(int i=0;i<movieList.size();i++) {
			String poster = PosterSlice.slicePosterUrl(movieList.get(i));
			movieList.get(i).setMovie_poster(poster);
		}
		
		// 뽑아온 movieList request 객체에 넘겨주기
		req.setAttribute("movieList", movieList);
		
		forward.setRedirect(false);
		forward.setPath("/rec/rec_pick.jsp?flag=1");
		
		return forward;
	}
}







