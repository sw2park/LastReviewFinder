package com.reviewfinder.movie;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie.dao.MovieDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class TotalRatingCnt implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		MovieDAO mdao = new MovieDAO();
		HttpSession session_ratingCnt = req.getSession();
		
		int totalRatingCnt = mdao.getTotalRatingCnt();
		
		session_ratingCnt.setAttribute("totalRatingCnt", totalRatingCnt);
		
		return null;
	}
}
