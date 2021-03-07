package com.summer.cabbage.dao;

import java.util.List;
import java.util.Map;

public interface PaymentsDAO {

	//0304 이성정 추가 ================
	public List<Map<String, Object>> selectPaymentCountByDate(int giverNo);
	public List<Map<String, Object>> selectPriceSumByDate(int giverNo);
	
	//0305 이성정 추가 ==========
	public int selectTodaySales(int giverNo);
	public int selectTotalSales(int giverNo);
	
	//이성정 최종 추가 ====
	public List<Map<String, Object>> selectSalesByMonth(int giverNo);
	
	//금주의 핫 아이템 번호 가져오는 0306 박형우
	public List<Integer> selectThisWeekProductNoC();
	public List<Integer> selectThisWeekProductNoF();
	public List<Integer> selectThisWeekProductNoH();
	// 03-06박형우 end
	
}
