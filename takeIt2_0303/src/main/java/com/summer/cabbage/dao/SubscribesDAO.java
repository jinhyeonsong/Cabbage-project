package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Subscribe;

public interface SubscribesDAO {

	//기버의 주문조회 총 리스트	
	List<Subscribe> selectOrderCheckList(int giverNo);
	//기버의 주문조회 총 리스트카운트
	int selectOrderCheckListCount(int giverNo);

}
