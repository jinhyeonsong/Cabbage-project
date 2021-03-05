package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.DeliveryDay;

public interface DeliveryDaysDAO {
	//구독상품 배송가능한 요일들 받아오기 - 송진현
	public List<DeliveryDay> selectListDay(int productNo);
}
