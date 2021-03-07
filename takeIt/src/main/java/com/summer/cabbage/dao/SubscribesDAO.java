package com.summer.cabbage.dao;

import java.util.List;
import java.util.Map;

import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerPageVO;

public interface SubscribesDAO {

	// 03-04 강필규 기버의 주문조회 총 리스트	
	List<Subscribe> selectOrderCheckList(Subscribe subscribe);
	// 03-04 강필규 기버의 주문조회 총 리스트카운트 
	int selectOrderCheckListCount(Subscribe subscribe);
	int deleteOrderCheckList(int no);
	
	//0304이성정 추가 =========================
	public int selectSubscriberCount(int giverNo);
	
	public int selectTodaySubscriberCount(int giverNo);
	
	public int selectNowProductCount(int giverNo);
	
	public List<Map<String, Object>> selectProductCountByDate(int giverNo);
	//================================================
	
	//03-04 오승주 추가
	int selectItemCount(int takerNo);
	
	
	//이성정 최종 추가 ====
	public List<Map<String, Object>> selectSubscribersByMonth(int giverNo);

	List<Subscribe> selectSubList(TakerPageVO takerNo);
	//03-04 오승주 추가 end
	
	//03-04 정진하 추가
	public List<Subscribe> selectMonthlySubscriptions(int takerNo);
	public List<SubscriptionDay> selectSubscriptionDays(int takerNo);

}
