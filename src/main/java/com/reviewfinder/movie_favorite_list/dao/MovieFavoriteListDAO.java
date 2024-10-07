package com.reviewfinder.movie_favorite_list.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.mybatis.SqlMapConfig;

public class MovieFavoriteListDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public MovieFavoriteListDAO() {
		session = factory.openSession(true);
	}

	public void insertWishList(String userid, int movie_num) {
		HashMap<String, Object> id_num = new HashMap<>();
		id_num.put("userid", userid);
		id_num.put("movie_num", movie_num);
		
		session.insert("WishList.insertWishList", id_num);
	}

	public int checkWishList(String userid, int movie_num) {
		HashMap<String, Object> id_num = new HashMap<>();
		id_num.put("userid", userid);
		id_num.put("movie_num", movie_num);
		
		return session.selectOne("WishList.checkWishList", id_num);
	}
}
