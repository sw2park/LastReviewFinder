package com.reviewfinder.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.mybatis.SqlMapConfig;

public class BoardDAO {

	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession Session;
	
	public BoardDAO() {
		Session = factory.openSession(true);
	}

	public int getBoardCnt() {
		return Session.selectOne("Board.getBoardCnt");
	}

	public List<BoardDTO> getBoardList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		
		List<BoardDTO> boardList = new ArrayList<>();
		boardList = Session.selectList("Board.getBoardList", datas);
		
		return boardList;
	}

	public int getCategoryCnt(String boardcate) {
		return Session.selectOne("Board.getCategoryCnt");
	}
	
	

	public boolean insertBoard(BoardDTO bdto) {
		boolean result = false;
		System.out.println();
		if(Session.insert("Board.insertBoard", bdto ) == 1) {
			result = true;
		}
		return result;
	}

	public int getSeq() {
		return Session.selectOne("Board.getSeq");
	}
	
	
	public BoardDTO getDetail(int boardnum) {
		return(BoardDTO)Session.selectOne("Board.getDetail", boardnum);
	}
	
	public List<BoardDTO> CategoryView(String boardcate, int startRow, int endRow) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("boardcate", boardcate);
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		
		List<BoardDTO> boardList = new ArrayList<>();
		boardList = Session.selectList("Board.getCategory", datas);
		
		return boardList;
	}

	
	public boolean updateBoard(int boardnum, String boardcate, String boardtitle, String boardcontents) {
		boolean result = false;
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("boardnum", boardnum);
		datas.put("boardcate", boardcate);
		datas.put("boardtitle", boardtitle);
		datas.put("boardcontents", boardcontents);
		
		if (Session.update("Board.UpdateBoard", datas) == 1) {
			result = true;
		}
		return result;
	}
	
	public boolean updateReply(int boardnum, String adminreply) {
		boolean result = false;
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("boardnum", boardnum);
		datas.put("adminreply", adminreply);
		
		if (Session.update("Board.UpdateReply", datas) == 1) {
			result = true;
		}
		return result;
	}

	public boolean deletReply(int boardnum) {
		boolean result = false;
		
		if (Session.update("Board.deleteReply", boardnum) == 1) {
			result = true;
		}
		return result;
	}
	
	public boolean deleteBoard(int boardnum) {
		boolean result = false;
		if (Session.delete("Board.deleteBoard", boardnum) == 1) {
			result = true;
		}
		return result;
	}

	
	
}
