package com.reviewfinder.boxoffice.dao;

public class BoxOfficeDTO {
	private int movie_num;
	private int movie_rank;
	private String boxoffice_date;
	
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getMovie_rank() {
		return movie_rank;
	}
	public void setMovie_rank(int movie_rank) {
		this.movie_rank = movie_rank;
	}
	public String getBoxoffice_date() {
		return boxoffice_date;
	}
	public void setBoxoffice_date(String boxoffice_date) {
		this.boxoffice_date = boxoffice_date;
	}
}