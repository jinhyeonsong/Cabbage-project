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
	
	//구독상품 배송가능한 요일들 받아오기-송진현
	@Override
	public List<DeliveryDay> selectListDay(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryDays.selectListDay",productNo);
	}
}
