package com.reviewfinder.movie.dao;

public class UserRateDTO {
	private int movie_num;
	private String userid;
	private int user_star_rate;
	
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getUser_star_rate() {
		return user_star_rate;
	}
	public void setUser_star_rate(int user_star_rate) {
		this.user_star_rate = user_star_rate;
	}
	
}
