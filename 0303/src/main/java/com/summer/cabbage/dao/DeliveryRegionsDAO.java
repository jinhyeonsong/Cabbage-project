package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.DeliveryRegion;

public interface DeliveryRegionsDAO {
	public List<DeliveryRegion> selectListRegion(int productNo);
}
