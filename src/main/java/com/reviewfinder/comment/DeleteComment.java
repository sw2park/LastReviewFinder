package com.reviewfinder.comment;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.comment.dao.CommentDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteComment implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		CommentDAO cdao = new CommentDAO();
		
		String userid = req.getParameter("userid");
		
		cdao.deleteComment(userid);
		
		return null;
	}
}
