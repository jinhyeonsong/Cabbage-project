package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.DeliveryRegion;

public interface DeliveryRegionsDAO {

	//2021 0304 방 배송지 옵션받아오기
	List<DeliveryRegion> selectList(int productNo);

	// 03-09 방 배송지 옵션 확인
	public List<DeliveryRegion> selectWhether(int productNo);

	// 03-11 방 전체 배송인 지역 번호
	public List<DeliveryRegion> selectOptsWithPrimaryRegion(int productNo);

	// 03-11 시도만 있는 지역의 이름, 가격
	public DeliveryRegion selectOptPrimaryRegionName(DeliveryRegion drNoPrNo);

	// 03-11 일반 지역의 경우, 배송옵션 이름, 가격
	public List<DeliveryRegion> selectOptRegion(int productNo);

	// 03-15 방 시도+시도군구의 경우 시도 이름, 가격
	public DeliveryRegion selectOptPrimaryRegionName2(DeliveryRegion drNoPrNo);
	//배송지역 옵션들 - 송진현
	public List<DeliveryRegion> selectListRegion(int productNo);
	//구독 등록하기 210304 박형우
	public int insertDeliveryRegions(DeliveryRegion deliveryRegion);
	
	
}
