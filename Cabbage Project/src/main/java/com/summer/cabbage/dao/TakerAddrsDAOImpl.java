package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.TakerAddr;

@Repository
public class TakerAddrsDAOImpl implements TakerAddrsDAO {
	@Autowired
	private SqlSession session;
	
	//03-04 방현수 추가 
	//배송지 목록
	@Override
	public List<TakerAddr> selectList(int takerNo) {
		return session.selectList("takerAddrs.selectTakerAddrs", takerNo);
	}
	
	// 기본 배송지
	@Override
	public TakerAddr selectOne(int takerNo) {
		return session.selectOne("takerAddrs.selectOneAddr", takerNo);
	}
	
	// 배송지 입력
	@Override
	public int insertAddr(TakerAddr takerAddr) {
		return session.insert("takerAddrs.insertAddr", takerAddr);
	}
	
	// 다른 배송지 일반으로 변경
	@Override
	public int updateSetOthersNormal(int takerNo) {
		return session.update("takerAddrs.updateSetOthersNormal", takerNo);
	}
	//03-04 방현수 추가 end
}
