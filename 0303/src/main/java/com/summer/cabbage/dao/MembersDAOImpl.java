package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Member;

@Repository
public class MembersDAOImpl implements MembersDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public Member selectLogin(Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("members.selectLogin",member);
	}

	@Override
	public int selectBusinessName(String businessName) {
		return session.selectOne("members.selectBusinessName",businessName);
	}
	
	@Override
	public int selectId(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("members.selectId",id);
	}
	
	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return session.insert("members.insertMember",member);
	}
}
