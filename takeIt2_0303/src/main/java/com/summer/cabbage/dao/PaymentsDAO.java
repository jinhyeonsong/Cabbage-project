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
	
}
