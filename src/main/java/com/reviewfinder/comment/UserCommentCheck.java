package com.reviewfinder.comment;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.comment.dao.CommentDAO;
import com.reviewfinder.comment.dao.CommentDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserCommentCheck implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		CommentDAO cdao = new CommentDAO();
		CommentDTO comment = new CommentDTO();
		
		String userid = req.getParameter("userid");
		int movie_num = Integer.parseInt(req.getParameter("movie_num"));
		
		comment.setUserid(userid);
		comment.setMovie_num(movie_num);
		
		String contents = cdao.checkComment(comment);
		
		if(contents !=null) {
			contents = contents.trim();
		}
		
		if (contents == null || contents.equals("")) {
			try {
				resp.getWriter().write("_1");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.getWriter().write(contents);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
}
