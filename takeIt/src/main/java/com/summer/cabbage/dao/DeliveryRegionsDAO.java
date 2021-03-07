package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.DeliveryRegion;

public interface DeliveryRegionsDAO {


	//2021 0304 방 배송지 옵션받아오기
	List<DeliveryRegion> selectList(int productNo);
	//배송지역 옵션들 - 송진현
	public List<DeliveryRegion> selectListRegion(int productNo);
	//구독 등록하기 210304 박형우
	public int insertDeliveryRegions(DeliveryRegion deliveryRegion);
	
	
}
