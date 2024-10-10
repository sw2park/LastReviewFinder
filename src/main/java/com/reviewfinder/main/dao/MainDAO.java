package com.reviewfinder.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.mybatis.SqlMapConfig;

public class MainDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public MainDAO() {
		session = factory.openSession(true);
	}

	// BOXOFFICE_RANK DB에 있는것 가져오기
	public List<MainDTO> selectBoxOffce(String _date) {
		String date = _date;
		List<MainDTO> mainDto = session.selectList("Main.selectBoxOffce", date);
		
		return mainDto;
	}

	public boolean selectCommentCnt() {
		boolean result = false;
		int commentCnt = session.selectOne("Main.selectCommentCnt");
		
		if(commentCnt > 0) {
			result = true;
		}
		
		return result;
	}

	public List<MainCommentDTO> selectCommentList() {
		List<MainCommentDTO> commentDTO = session.selectList("Main.selectCommentList");
		
		return commentDTO;
	}

	public String selectMoviePoster(int movie_num) {
		String posterUrl = session.selectOne("Main.selectMoviePoster", movie_num);
		
		return posterUrl;
	}

	public String selectMovieTitle(int movieNum) {
		String movieTitle = session.selectOne("Main.selectMovieTitle", movieNum);
		
		return movieTitle;
	}
}