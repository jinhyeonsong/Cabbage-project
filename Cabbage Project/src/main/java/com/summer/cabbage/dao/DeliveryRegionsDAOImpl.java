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
	
	// 2021 0304 방 배송지 옵션받아오기
	@Override
	public List<DeliveryRegion> selectList(int productNo) {
		return session.selectList("deliveryRegions.selectDeliveryOptions", productNo);
	}

	// 03-09 방 배송지 옵션 확인
	@Override
	public List<DeliveryRegion> selectWhether(int productNo) {
		return session.selectList("deliveryRegions.selectWhether", productNo);
	}

	// 03-11 방 전체 배송인 지역 번호
	@Override
	public List<DeliveryRegion> selectOptsWithPrimaryRegion(int productNo) {
		return session.selectList("deliveryRegions.selectOptsWithPrimaryRegion", productNo);
	}

	// 03-11 방 전체 배송하는 지역의 이름
	@Override
	public DeliveryRegion selectOptPrimaryRegionName(DeliveryRegion drNoPrNo) {
		return session.selectOne("deliveryRegions.selectOptPrimaryRegionName", drNoPrNo);
	}

	// 03-11 방 시도+시도구군 조합 지역의 이름, prior_no
	@Override
	public List<DeliveryRegion> selectOptRegion(int productNo) {
		return session.selectList("deliveryRegions.selectOptRegion", productNo);
	}

	// 03-15 방 시도+시도구군 지역에서 시도
	@Override
	public DeliveryRegion selectOptPrimaryRegionName2(DeliveryRegion drNoPrNo) {
		return session.selectOne("deliveryRegions.selectOptPrimaryRegionName2", drNoPrNo);
	}
	//배송지역 옵션들 - 송진현
	@Override
	public List<DeliveryRegion> selectListRegion(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryRegions.selectListRegion",productNo);
	}
	//구독 등록하기 210304 박형우
	@Override
	public int insertDeliveryRegions(DeliveryRegion deliveryRegion) {
		return session.insert("deliveryRegions.insertDeliveryRegions", deliveryRegion);
	}
	
}
