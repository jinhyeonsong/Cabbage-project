package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.DeliveryRegion;

public interface DeliveryRegionsDAO {
	//배송지역 옵션들 - 송진현
	public List<DeliveryRegion> selectListRegion(int productNo);
}
