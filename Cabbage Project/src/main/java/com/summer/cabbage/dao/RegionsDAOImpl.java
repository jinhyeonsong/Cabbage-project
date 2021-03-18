package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Region;

@Repository
public class RegionsDAOImpl implements RegionsDAO {
	@Autowired
	private SqlSession session;
	
	//시,도만 가져오는
	@Override
	public List<Region> selectStates() {
		return session.selectList("regions.selectStates");
	}
	//210304 박형우-----------------------------------------

	//해당 시,도에 해당하는 구들 가져오기
	@Override
	public List<Region> selectSubStates(int stateNo) {
		return session.selectList("regions.selectSubStates", stateNo);
	}
	//210304 박형우-----------------------------------------
}
