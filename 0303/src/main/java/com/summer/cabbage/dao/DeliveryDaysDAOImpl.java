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
	public List<DeliveryDay> selectListDay(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryDays.selectListDay",productNo);
	}
}
