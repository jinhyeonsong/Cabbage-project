package com.summer.cabbage.service;

import java.util.List;
import java.util.Map;

import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Reply;
import com.summer.cabbage.vo.Review;
import com.summer.cabbage.vo.Subscribe;

public interface GiversService {

	Map<String,Object> getGiverDetail(int no);  // 0302 기버의 상세 정보
	Map<String,Object> getGiverItems(int giverNo, int page, String sort); // 0304 기버의 상품들 
	
	
	//03-04 강필규 등록
	public Map<String, Object> getGiverOrderCheckList(int giverNo, String startDate, String productNoStr);
	public void deleteOrderCheckList(int[] no);
	
	//0304이성정 =============================
		public int getSubscribers(int giverNo);
		public int getTodaySubscribers(int giverNo);
		public int getProductsCount(int giverNo);
		public List<Map<String, Object>> getProductCountByDate(int giverNo);
		public List<Map<String, Object>> getPaymentCountByDate(int giverNo);
		public List<Map<String, Object>> getPriceSumByDate(int giverNo);
		public Map<String, Object> getMainFeature(int giverNo);
		
	//==============================================
	
	//0305이성정 ============
	public int getToaySales(int giverNo);
	public int getTotalSales(int giverNo);
	public Map<String, Object> getSalesFeature(int giverNo);

	
	//03-04 이아림 추가
	//기버마이페이지 판매자정보 출력
	Giver getGiverInfo(int no);
	//기버마이페이지 프로필수정
	public boolean updateProfile(Member member);
	
	//이성정 최종추가===========
	public List<Map<String, Object>> getSalesByMonth(int giverNo);
	public List<Map<String, Object>> getSubscribersByMonth(int giverNo);
	public List<Map<String, Object>> getSalesChartFeature(int giverNo);
	public List<Map<String, Object>> getSubscribersChartFeature(int giverNo);

	//03-04 이소현 추가
	//03-03 이소현 _ 기버 번호로 제품 리스트 불러오기
	public List<Product> selectProductListByGiverNo(int giverNo);
	
	//03-03 이소현 _ (기버 마이페이지 리뷰관리) 리뷰 받아오기
	public List<Review> getReviewList(int productNo);
	
	//0304 이소현 _ 답글 등록
	public int registerReply(Reply reply);
	
	//0304 이소현 _ 답글 수정
	public int modifyReply(Reply reply);
	
	//0305 이소현 _ 답글 삭제
	public int removeReply(int no);
	//03-04 이소현 추가 end
}
