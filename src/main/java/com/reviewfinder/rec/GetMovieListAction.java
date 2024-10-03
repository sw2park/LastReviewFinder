package com.reviewfinder.rec;

import java.util.List;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.rec.dao.RecDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GetMovieListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		String round = req.getParameter("rounds");	
		HttpSession roundSession = req.getSession();
		round = round.replace("강", "");
		RecDAO rdao = new RecDAO();
		
		// RECOMMEND_MOVIE 테이블에 데이터가 남아있으면 전부 삭제 
		rdao.deleteRecMovieAll();
		
		// 라운드 수 만큼 movie 가져오기
		List<MovieDTO> movieList = rdao.selectMovieByRound(Integer.parseInt(round));

		// 가져온 리스트에서 num만 insert
		if(rdao.insertRecMovie(movieList)) {
			System.out.println("RECOMMEND_MOVIE 저장 성공!");
			roundSession.setAttribute("roundSession", round);
			forward.setRedirect(true);
			forward.setPath("/rec/rec_pick.jsp");
		}else {
			System.out.println("RECOMMEND_MOVIE 저장 실패!");
			forward.setRedirect(true);
			forward.setPath("/");
		}
		return forward;
	}
}
