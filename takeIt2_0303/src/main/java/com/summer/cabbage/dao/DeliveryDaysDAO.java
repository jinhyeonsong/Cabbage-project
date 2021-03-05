package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.DeliveryDay;

public interface DeliveryDaysDAO {

	
	//03-04 강필규 추가
	List<DeliveryDay> selectOrderCheckListDays(int productNo);
	//03-05 오승주 추가
	List<Integer> selectListByproductNo(int productNo);
	//03-04 정진하 추가
	public List<Integer> selectList(int productNo);
	//03-04 방현수 추가
	public List<DeliveryDay> selectListDays(int productNo);
	//구독상품 배송가능한 요일들 받아오기 - 송진현 03-04
	public List<DeliveryDay> selectListDay(int productNo);

}
