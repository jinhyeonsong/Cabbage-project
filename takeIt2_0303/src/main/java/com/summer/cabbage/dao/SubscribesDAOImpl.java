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
	public List<Subscribe> selectOrderCheckList(Subscribe subscribe) {
		return session.selectList("subscribes.selectOrderCheckList",subscribe);
	}
	public int selectOrderCheckListCount(Subscribe subscribe) {
		return session.selectOne("subscribes.selectOrderCheckListCount",subscribe);
	}
	@Override
	public int deleteOrderCheckList(int no) {
		return session.update("subscribes.deleteOrderCheckList",no);
	}
	
}
