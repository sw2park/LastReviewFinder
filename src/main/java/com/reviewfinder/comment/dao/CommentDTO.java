package com.reviewfinder.comment.dao;

public class CommentDTO {
	private int comment_num;
	private String userid;
	private String username;
	private int movie_num;
	private String comment_contents;
	private String comment_date;
	private int comment_like;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public int getComment_like() {
		return comment_like;
	}
	public void setComment_like(int comment_like) {
		this.comment_like = comment_like;
	}
	
}
