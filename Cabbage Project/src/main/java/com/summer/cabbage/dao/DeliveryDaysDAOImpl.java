package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.DeliveryDay;

@Repository
public class DeliveryDaysDAOImpl implements DeliveryDaysDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<DeliveryDay> selectOrderCheckListDays(int productNo) {
		return session.selectList("deliveryDays.selectOrderCheckListDays",productNo);
	}
	
	@Override
	public List<Integer> selectListByproductNo(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryDays.selectListByproductNo",productNo);
	}
	// 03-04 정진하 추가
	@Override
	public List<Integer> selectList(int productNo) {
		return session.selectList("deliveryDays.selectList",productNo);
	}
	
	//03-04 방현수 추가
	@Override
	public List<DeliveryDay> selectListDays(int productNo) {
		return session.selectList("deliveryDays.selectDaysOpt",productNo);
	}
	//구독상품 배송가능한 요일들 받아오기-송진현
	@Override
	public List<DeliveryDay> selectListDay(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryDays.selectListDay",productNo);
	}
	
	//구독 등록하기 210304 박형우
	@Override
	public int insertDeliveryDays(DeliveryDay deliveryDay) {
		return session.insert("deliveryDays.insertDeliveryDays", deliveryDay);
	}

	
}
