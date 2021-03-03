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
}
