package com.reviewfinder.movie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.boxoffice.dao.BoxOfficeDTO;
import com.reviewfinder.mybatis.SqlMapConfig;

public class MovieDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;

	public MovieDAO() {
		session = factory.openSession(true);
	}

	// DB에 영화가 있으면 true, 없으면 false
	public boolean checkMoiveDB() {
		boolean result = false;
		int cnt = session.selectOne("Movie.checkMoiveDB");
		if (cnt > 0) {
			result = true;
		}

		return result;
	}

	// 첫 로딩 때 MOVIE_DB에 영화 넣기
	public void insertMovieDB(HashMap<String, MovieDTO> moviemap) {
		List<MovieDTO> movie = new ArrayList<MovieDTO>();
		for (int i = 1; i <= moviemap.size(); i++) {
			movie.add(moviemap.get("" + i + ""));
		}
		for (int i = 0; i < movie.size(); i++) {
			if (!checkDistinct(movie.get(i))) {
				if (session.insert("Movie.insertMovieDB", movie.get(i)) == 1) {
					System.out.println("db저장 성공");
				} else {
					System.out.println("실패");
				}
			} else {
				System.out.println(movie.get(i).getMovie_title() + "중복 감지");
			}
		}
	}

	// 오버로딩
	public void insertMovieDB(List<MovieDTO> movie) {
		for (int i = 0; i < movie.size(); i++) {
			if (!checkDistinct(movie.get(i))) {
				if (session.insert("Movie.insertMovieDB", movie.get(i)) == 1) {
					System.out.println("db저장 성공");
				} else {
					System.out.println("실패");
				}
			} else {
				System.out.println(movie.get(i).getMovie_title() + " 중복 감지");
			}
		}
	}

	// 박스오피스 테이블 추가
	public void insertBoxOffice(HashMap<String, MovieDTO> moviemap) {
		List<MovieDTO> movie = new ArrayList<MovieDTO>();
		for (int i = 1; i <= moviemap.size(); i++) {
			movie.add(moviemap.get("" + i + ""));
		}
		for (int i = 0; i < movie.size(); i++) {
			if (session.insert("Movie.insertBoxOffice", movie.get(i)) == 1) {
				System.out.println("BOXOFFICE_RANK db저장 성공");
			} else {
				System.out.println("BOXOFFICE_RANK db저장 실패");
			}
		}
	}

	public MovieDTO selectMovieFromDB(String movie_title, String movie_date) {
		MovieDTO movie = new MovieDTO();
		HashMap<String, String> title_date = new HashMap<String, String>();
		title_date.put("movie_title", movie_title);
		title_date.put("movie_date", movie_date);

		movie = session.selectOne("Movie.selectMovieFromDB", title_date);

		return movie;
	}

	// 영화 넣기 전 중복 확인 => 중복이면 ture / 중복 아니면 false
	public boolean checkDistinct(MovieDTO movie) {
		boolean result = false;

		int cnt = session.selectOne("Movie.checkDistinct", movie);
		if (cnt != 0) {
			result = true;
		}

		return result;
	}

	// 박스오피스 테이블 추가
	public void insertBoxOffice(BoxOfficeDTO bDto) {
		session.insert("Movie.insertBoxOffice", bDto);
	}

	public int selectMovieNum(HashMap<String, MovieDTO> boxOffice, String date, int _rank) {
		int month = Integer.parseInt(date);
		String rank = "" + _rank;

		String movieTitle = boxOffice.get(rank).getMovie_title();

		return session.selectOne("Movie.selectMovieNum", movieTitle);

	}

	// BOXOFFICE_RANK에 값이 있으면 true, 없으면 false
	public boolean checkBoxOfficeRank() {
		boolean result = false;
		int cnt = session.selectOne("Movie.checkBoxOfficeRank");
		if (cnt > 0) {
			result = true;
		}

		return result;
	}

	public void updateRating(int rating, int movie_num) {
		HashMap<String, Integer> rating_num = new HashMap<String, Integer>();
		rating_num.put("rating", rating);
		rating_num.put("movie_num", movie_num);

		session.update("Movie.updateRating", rating_num);
	}

	public void updateRatingCount(int movie_num) {
		session.update("Movie.updateRatingCount", movie_num);
	}

	public double selectTotalRating(int movie_num) {
		return session.selectOne("Movie.selectTotalRating", movie_num);
	}
}
