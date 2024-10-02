package com.reviewfinder.rec.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.movie.dao.MovieDTO;
import com.reviewfinder.mybatis.SqlMapConfig;

public class RecDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public RecDAO() {
		session = factory.openSession(true);
	}
	
	// 우선 라운드 숫자 만큼 영화 select
	public List<MovieDTO> selectMovieByRound(int round) {
		List<MovieDTO> movieList = null;
		
		movieList = session.selectList("Rec.selectMovie",round);
		
		return movieList;
	}
	
	// selectMovie로 받아온 영화의 movie_num 넣음 // is_selected 컬럼은 기본적으로 0
	public boolean insertRecMovie(List<MovieDTO> movieList) {
		boolean result = false;
		for(MovieDTO movie : movieList) {
			if(session.insert("Rec.insertRecMovie",movie.getMovie_num())==1) {
				result = true;
			}
		}
		return result;
	}
	
	// rec페이지 초기 세팅 (테이블 데이터 초기화)
	public void deleteRecMovieAll() {
		session.delete("Rec.deleteRecMovie");
	}
	
	// RECOMMEND_MOVIE 테이블에서 movie_num 낮은 순으로 select
	public List<RecDTO> selectTopUnselectedMovies() {
		List<RecDTO> recList = null;
		
		recList = session.selectList("Rec.selectTopUnselectedMovies");
		
		return recList;
	}
	// 이건 여러개
	public List<MovieDTO> getMoviesByMovieNumList(List<RecDTO> recList) {
		List<MovieDTO> movieList = new ArrayList<MovieDTO>();
		
		for(RecDTO rec : recList) {
			movieList.add(session.selectOne("Rec.getMoviesByMovieNumList",rec));
		}
		
		return movieList;
	}
	// 이건 movie_num으로 하나만 가져오기
	public MovieDTO getMovieByMovieNum(int movie_num) {
		return session.selectOne("Rec.getMovieByMovieNum",movie_num);
	}
	
	// 뽑아온 List들 RECOMMEND_MOVIE 테이블에서 is_selected 1로 세팅
	public void updateIsSelected(List<RecDTO> recList) {
		for(RecDTO rec : recList) {
			session.update("Rec.updateIsSelected",rec);
		}
	}

	public void deleteUnSelectedMovie(int movie_num) {
		session.delete("Rec.deleteUnSelectedMovie",movie_num);
	}

	// RECOMMEND_MOVIE 테이블의 현재 selected 안된 수
	public int selectRecMovieCnt() {
		return session.selectOne("Rec.selectRecMovieCnt");
	}

	public void updateIsSelectedAll() {
		session.update("Rec.updateIsSelectedAll");
	}

	public int getWinnerNum() {
		return session.selectOne("Rec.getWinnerNum");
	}
	
	
}
