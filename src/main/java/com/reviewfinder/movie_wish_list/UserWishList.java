package com.reviewfinder.movie_wish_list;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.movie_wish_list.dao.MovieWishListDAO;
import com.reviewfinder.movie_wish_list.dao.MovieWishListDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserWishList implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		int movie_num = Integer.parseInt(req.getParameter("movie_num"));
		String userid = req.getParameter("userid");
		
		MovieWishListDAO mfdao =  new MovieWishListDAO();
		MovieWishListDTO wishList = new MovieWishListDTO();
		
		wishList.setMovie_num(movie_num);
		wishList.setUserid(userid);
		
		if(mfdao.checkWishList(wishList)==0) {
			mfdao.insertWishList(wishList);
			try {
				resp.setContentType("text/html;charset=UTF-8");
				resp.getWriter().write("목록에 추가되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			mfdao.deleteWishList(wishList);
			try {
				resp.setContentType("text/html;charset=UTF-8");
				resp.getWriter().write("목록에서 제거되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
}
