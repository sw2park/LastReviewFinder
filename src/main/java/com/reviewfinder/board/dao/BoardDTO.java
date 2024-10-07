package com.reviewfinder.board.dao;

public class BoardDTO {

	private int boardnum;
	private String boardcate;
	private String username;
	private String boardtitle;
	private String boardcontents;
	private String boarddate;
	private String admin_reply;
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardcate() {
		return boardcate;
	}
	public void setBoardcate(String boardcate) {
		this.boardcate = boardcate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontents() {
		return boardcontents;
	}
	public void setBoardcontents(String boardcontents) {
		this.boardcontents = boardcontents;
	}
	public String getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(String boarddate) {
		this.boarddate = boarddate;
	}
	public String getAdmin_reply() {
		return admin_reply;
	}
	public void setAdminreply(String admin_reply) {
		this.admin_reply = admin_reply;
	}
}
