package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.DeliveryRegion;

@Repository
public class DeliveryRegionsDAOImpl implements DeliveryRegionsDAO {
	@Autowired
	private SqlSession session;
	
	//배송지역 옵션들 - 송진현
	@Override
	public List<DeliveryRegion> selectListRegion(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryRegions.selectListRegion",productNo);
	}
}
