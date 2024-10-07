package com.reviewfinder.comment.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.mybatis.SqlMapConfig;

public class CommentDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public CommentDAO() {
		session = factory.openSession(true);
	}

	public List<CommentDTO> getCommentList() {
		List<CommentDTO> commentList = new ArrayList<CommentDTO>();
		
		commentList = session.selectList("Comment.getCommentList");
		
		return commentList;
	}

	
}
