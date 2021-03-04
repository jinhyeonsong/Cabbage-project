package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Giver;

@Repository
public class GiversDAOImpl implements GiversDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public Giver selectDetail(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectDetail",no);
	}
	
	@Override
	public Giver selectbusinessNum(Giver giver) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectbusinessNum",giver);
	}
	
	@Override
	public int insertGiver(Giver giver) {
		// TODO Auto-generated method stub
		return session.insert("givers.insertGiver",giver);
	}
	
	@Override
	public Giver selectDetailOne(int productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectDetailOne",productNo);
	}
}
