package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.TakerAddr;

public interface TakerAddrsDAO {
	
	//03-04 방현수 추가 
	// 유저 배송지 출력(목록)
	public List<TakerAddr> selectList(int takerNo);
	
	// 유저 기본 배송지 출력
	public TakerAddr selectOne(int takerNo);

	// 유저 배송지 입력 
	public int insertAddr(TakerAddr takerAddr);

	public int updateSetOthersNormal(int takerNo);
	//03-04 방현수 추가 end	
}
