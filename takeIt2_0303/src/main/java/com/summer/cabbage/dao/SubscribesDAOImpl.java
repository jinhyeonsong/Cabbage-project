package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Subscribe;

@Repository
public class SubscribesDAOImpl implements SubscribesDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Subscribe> selectOrderCheckList(int giverNo) {
		return session.selectList("subscribes.selectOrderCheckList",giverNo);
	}
	public int selectOrderCheckListCount(int giverNo) {
		return session.selectOne("subscribes.selectOrderCheckListCount",giverNo);
	}
	
}
