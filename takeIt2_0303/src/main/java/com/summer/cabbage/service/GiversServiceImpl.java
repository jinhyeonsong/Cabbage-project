package com.summer.cabbage.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.DeliveryDaysDAO;
import com.summer.cabbage.dao.GiversDAO;
import com.summer.cabbage.dao.ProductsDAO;
import com.summer.cabbage.dao.SubscribesDAO;
import com.summer.cabbage.vo.Subscribe;

@Service
public class GiversServiceImpl implements GiversService {

	@Autowired
	private GiversDAO giversDAO;
	@Autowired
	private SubscribesDAO subscribesDAO;
	@Autowired
	private DeliveryDaysDAO deliveryDaysDAO; 
	@Autowired
	private ProductsDAO productsDAO;
	
	// 0302 판매자 정보 더보기 : 오승주 ===============================
	@Override
	public Map<String, Object> getGiverDetail(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=new ConcurrentHashMap<String, Object>();
		
		map.put("giver", giversDAO.selectDetail(no));
		//map.put("riviewAvg",null);
		
		
		return map;
	}
	// =================================================================
	
	// 03-03 강필규 등록 기버 주문조회 리스트 전체
	@Override
	public Map<String, Object> getGiverOrderCheckList(int giverNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("lists",subscribesDAO.selectOrderCheckList(giverNo));
		map.put("count",subscribesDAO.selectOrderCheckListCount(giverNo));
		List<Subscribe> list = subscribesDAO.selectOrderCheckList(giverNo);
		map.put("options",productsDAO.selectByGiverNo(giverNo));
		
		for (Subscribe subscribe : list) {
			
			map.put("days",deliveryDaysDAO.selectOrderCheckListDays(subscribe.getProductNo()));
			
		}
		
		return map;
	}
	// //03-03 강필규 등록 
	
}
