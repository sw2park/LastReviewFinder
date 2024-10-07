package com.reviewfinder.movie_favorite_list;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie_favorite_list.dao.MovieFavoriteListDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserWishList implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		int movie_num = Integer.parseInt(req.getParameter("movie_num"));
		String userid = req.getParameter("userid");
		
		MovieFavoriteListDAO mfdao =  new MovieFavoriteListDAO();
		
		if(mfdao.checkWishList(userid,movie_num)==0) {
			mfdao.insertWishList(userid, movie_num);
			try {
				resp.setContentType("text/html;charset=UTF-8");
				resp.getWriter().write("목록에 추가되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.setContentType("text/html;charset=UTF-8");
				resp.getWriter().write("이미 등록되어있습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
}
