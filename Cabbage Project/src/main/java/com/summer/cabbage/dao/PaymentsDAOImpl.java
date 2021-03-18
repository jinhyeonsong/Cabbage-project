package com.summer.cabbage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Payment;

@Repository
public class PaymentsDAOImpl implements PaymentsDAO {
	@Autowired
	private SqlSession session;
	
	//날짜별 매출 건수
	@Override
	public List<Map<String, Object>> selectPaymentCountByDate(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectList("payments.selectPaymentCountByDate",giverNo);
	}
	
	//날짜별 매출 금액
	@Override
	public List<Map<String, Object>> selectPriceSumByDate(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectList("payments.selectPriceSumByDate",giverNo);
	}
	
	//오늘의 매출 금액
	@Override
	public int selectTodaySales(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectOne("payments.selectTodaySales",giverNo);
	}
	
	//기버의 총 매출 금액
	@Override
	public int selectTotalSales(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectOne("payments.selectTotalSales",giverNo);
	}
	

	
	//달별 매출 금액
	@Override
	public List<Map<String, Object>> selectSalesByMonth(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectList("payments.selectSalesByMonth",giverNo);
	}
	//금주의 핫 아이템 번호 가져오는 03-06 박형우
	@Override
	public List<Integer> selectThisWeekProductNoC() {
		return session.selectList("payments.selectThisWeekProductNoC");
	}
	@Override
	public List<Integer> selectThisWeekProductNoF() {
		return session.selectList("payments.selectThisWeekProductNoF");
	}
	@Override
	public List<Integer> selectThisWeekProductNoH() {
		return session.selectList("payments.selectThisWeekProductNoH");
	}
	//03-06 박형우 end
	
	// 03-09 방 결제정보 입력
	@Override
	public void insertPaymentInfo(Payment payment) {
		session.insert("payments.insertPaymentInfo", payment);
		
	}
		
}
