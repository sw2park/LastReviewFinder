package com.reviewfinder.rec;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.rec.dao.RecDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SelectMovieAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		RecDAO rdao = new RecDAO();
		
		int movie_num = Integer.parseInt(req.getParameter("movie_num"));
		
		// 선택되지 않은 영화는 RECOMMEND_MOVIE 테이블에서 삭제
		rdao.deleteUnSelectedMovie(movie_num);
		
		// /rec/RecGetSelectMovie.rec 로 flag=null 로 보내기
		try {
			Thread.sleep(2500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		forward.setRedirect(true);
		forward.setPath("/rec/RecGetSelectMovie.rec");
		
		return forward;
	}
}
