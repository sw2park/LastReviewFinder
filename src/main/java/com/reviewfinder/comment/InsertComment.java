package com.reviewfinder.comment;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.comment.dao.CommentDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertComment implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		CommentDAO cdao = new CommentDAO();
		
		String contents = req.getParameter("comment_contents");
		
		
		
		return null;
	}
}
