package com.reviewfinder.comment.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.mybatis.SqlMapConfig;

public class CommentDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public CommentDAO() {
		session = factory.openSession(true);
	}

	public List<CommentDTO> getCommentList(MovieDTO movie) {
		List<CommentDTO> commentList = new ArrayList<CommentDTO>();
		
		movie.setMovie_date(movie.getMovie_date().substring(0,10));
		commentList = session.selectList("Comment.getCommentList", movie);
		
		return commentList;
	}

	public void insertComment(CommentDTO comment) {
		session.insert("Comment.insertComment",comment);
	}

	public String checkComment(CommentDTO comment) {
		return session.selectOne("Comment.checkComment", comment);
	}

	public void updateComment(CommentDTO comment) {
		session.update("Comment.updateComment",comment);
	}

	public void deleteComment(String userid) {
		session.delete("Comment.deleteComment",userid);
	}

	
}
