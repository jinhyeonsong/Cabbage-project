package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Giver;

@Repository
public class GiversDAOImpl implements GiversDAO {
	@Autowired
	private SqlSession session;
	
	//기버 정보받아오기-송진현
	@Override
	public Giver selectDetail(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectDetail",no);
	}
	//기버 사업자번호 받아오기-송진현
	@Override
	public Giver selectbusinessNum(Giver giver) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectbusinessNum",giver);
	}
	//기버  회원가입-송진현
	@Override
	public int insertGiver(Giver giver) {
		// TODO Auto-generated method stub
		return session.insert("givers.insertGiver",giver);
	}
	//기버 구독상품번호로 기버 정보받아오기-송진현
	@Override
	public Giver selectDetailOne(int productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectDetailOne",productNo);
	}
}
