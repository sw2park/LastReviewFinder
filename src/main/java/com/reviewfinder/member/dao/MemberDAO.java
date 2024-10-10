package com.reviewfinder.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reviewfinder.mybatis.SqlMapConfig;

public class MemberDAO {
	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession Session;
	
	public MemberDAO() {
		Session = factory.openSession(true);
	}

	public MemberDTO login(String userid, String userpw) {
		MemberDTO member = null;

		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		
		member = Session.selectOne("Member.login",datas);
		
		return member;
	}
	
	public boolean join(MemberDTO mdto) {
		boolean result = false;
		if(Session.insert("Member.join", mdto) == 1) {
			result = true;
		}
		return result;
	}
	
	public int checkID(String userid) {
		int cnt = 0;
		cnt = Session.selectOne("Member.checkId", userid);
		return cnt;
	}
	
	public int checkName(String username) {
		int cnt = 0;
		cnt = Session.selectOne("Member.checkName", username);
		return cnt;
	}

	public boolean updatePassword(String userid, String userpw) {
		boolean result = false;
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		if (Session.update("Member.UpdatePassword", datas) == 1) {
			result = true;
		}
		return result;
	}

	public boolean updateName(String userid, String username) {
		boolean result = false;
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("username", username);
		// 게시판에서 회원 이름 변경
		Session.update("Member.UpdateContentsUserName", userid);
		//실제 회원 이름 변경
		if (Session.update("Member.UpdateName", datas) == 1) {
			result = true;
		}
		return result;
	}
	
	public boolean updateProfile(String userid, String profile) {
		boolean result = false;
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("profile", profile);
		if (Session.update("Member.UpdateProfile", datas) == 1) {
			result = true;
		}
		return result;
	}

	public boolean deleteMember(String userid) {

		boolean result = false;
		//찜목록 삭제
		Session.delete("Member.DeleteMemberContents", userid);
		//실제 회원 삭제
		if (Session.delete("Member.DeleteMember", userid) == 1) {
			result = true;
			}
		return result;
	}
	
	public List<MemberContentsDTO> getContentsList(String userid){
		return Session.selectList("Member.getContentsList", userid);
	}
	
	
	
}
