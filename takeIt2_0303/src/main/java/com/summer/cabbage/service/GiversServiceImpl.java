package com.summer.cabbage.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	// 03-04 강필규 수정
	
	@Override
	public Map<String, Object> getGiverOrderCheckList(int giverNo, String startDate, String productNoStr) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		int productNo = 0;
		
		try {
			productNo = Integer.parseInt(productNoStr);	
		} catch (Exception e) {
			
		}
		
		if(startDate == "") {
			startDate = null;
		}
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, -7);
		Date date = calendar.getTime();
		String date7 = new SimpleDateFormat("yyyyMMdd").format(date);		
		map.put("days7", date7);
		
		calendar.add(Calendar.DAY_OF_MONTH, -23);
		date = calendar.getTime();
		date7 = new SimpleDateFormat("yyyyMMdd").format(date);
		map.put("days30", date7);
		
		calendar.add(Calendar.DAY_OF_MONTH, -60);
		date = calendar.getTime();
		date7 = new SimpleDateFormat("yyyyMMdd").format(date);
		map.put("days90", date7);
		
		calendar.add(Calendar.DAY_OF_MONTH, -90);
		date = calendar.getTime();
		date7 = new SimpleDateFormat("yyyyMMdd").format(date);
		map.put("days180", date7);
		
		//기본 메인페이지
		//시작날짜 선택을 하고 상품명을 선택안했을때
		//시작날짜 선택을 안하고 상품명을 선택했을때 
		//시작날짜와 상품명 둘다 선택했을때
		
		System.out.println("기버번호" + giverNo);
		System.out.println("시작날짜" + startDate);
		System.out.println("상품번호" + productNo);
		Subscribe subscribe = new Subscribe(giverNo, startDate, productNo);
		
		List<Subscribe> list = subscribesDAO.selectOrderCheckList(subscribe);
		
		for (Subscribe subscribe1 : list) {
			subscribe1.setDays(deliveryDaysDAO.selectOrderCheckListDays(subscribe1.getProductNo()));
		}
		
		map.put("count",subscribesDAO.selectOrderCheckListCount(subscribe));
		map.put("list",list);
		map.put("options",productsDAO.selectByGiverNo(giverNo));
		
		return map;
	}
	// 03-03 강필규 등록 end
	
	// 03-04 강필규 등록
	@Override
	public void deleteOrderCheckList(int[] nos) {
		
		for (int no : nos) {
			subscribesDAO.deleteOrderCheckList(no);	
		}
		
	}
	// 03-04 강필규 등록 end
}
