package com.reviewfinder.movie_wish_list.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.mybatis.SqlMapConfig;

public class MovieWishListDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public MovieWishListDAO() {
		session = factory.openSession(true);
	}

	public void insertWishList(MovieWishListDTO wishList) {
		session.insert("WishList.insertWishList", wishList);
	}

	public int checkWishList(MovieWishListDTO wishList) {
		return session.selectOne("WishList.checkWishList", wishList);
	}

	public void deleteWishList(MovieWishListDTO wishList) {
		session.delete("WishList.deleteWishList",wishList);
	}
}
