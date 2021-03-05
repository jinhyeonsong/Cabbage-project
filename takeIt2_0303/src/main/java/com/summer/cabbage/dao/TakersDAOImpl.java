package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Taker;

@Repository
public class TakersDAOImpl implements TakersDAO {
	@Autowired
	private SqlSession session;
	
	// 03-04 정진하 추가
	@Override
	public Taker selectOneByNo(int no) {
		return session.selectOne("takers.selectOneByNo", no);
	}

	@Override
	public int updateProfile(Member member) {
		return session.update("members.updateProfile", member);
	}
	
	@Override
	public int selectCheckNickname(String nickname) {
		return session.selectOne("takers.selectCheckNickname", nickname);
	}

	@Override
	public int updateNickname(Taker taker) {
		return session.update("takers.updateNickname",taker);
	}
	// 03-04 정진하 end
}
