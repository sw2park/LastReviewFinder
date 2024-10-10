package com.reviewfinder.comment;

import java.io.IOException;

import com.reviewfinder.action.Action;
import com.reviewfinder.action.ActionForward;
import com.reviewfinder.comment.dao.CommentDAO;
import com.reviewfinder.comment.dao.CommentDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertComment implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		CommentDAO cdao = new CommentDAO();
		CommentDTO comment = new CommentDTO();
		
		
		String contents = req.getParameter("comment_contents");
		String userid = req.getParameter("userid");
		String username = req.getParameter("username");
		int movie_num = Integer.parseInt(req.getParameter("movie_num"));
		
		comment.setComment_contents(contents);
		comment.setUserid(userid);
		comment.setUsername(username);
		comment.setMovie_num(movie_num);
		
		String previousComment = cdao.checkComment(comment);
		
		if(previousComment==null || previousComment.equals("")) {
			cdao.insertComment(comment);
			try {
				resp.getWriter().write("코멘트가 등록되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			cdao.updateComment(comment);
			try {
				resp.getWriter().write("코멘트가 수정되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
}
