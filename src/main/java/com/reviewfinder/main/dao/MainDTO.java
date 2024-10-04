package com.reviewfinder.main.dao;

public class MainDTO {
	private int movie_num;
	private int movie_rank;
	private String boxoffice_date;
	private String movie_title;
	private String movie_date;
	private String movie_genre;
	private String movie_poster;
	
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
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
}