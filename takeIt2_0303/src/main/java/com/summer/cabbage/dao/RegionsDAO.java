package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Region;

public interface RegionsDAO {

	//시,도만 가져오는
	public List<Region> selectStates();
	//210304 박형우-----------------------------------------
	//해당 시,도에 해당하는 구들 가져오기
	public List<Region> selectSubStates(int stateNo);
	//210304 박형우-----------------------------------------
	
}
