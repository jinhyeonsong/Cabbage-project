package com.summer.cabbage.service;

import java.util.List;
import java.util.Map;

import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Region;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerAddr;
import com.summer.cabbage.vo.TakerCard;

public interface SubscribesService {

	// 03-04 정진하 추가
	public List<Subscribe> getMonthlySubscriptions(int takerNo);
	public List<SubscriptionDay> getSubscriptionDays(int no);
	
	// 유저 배송지 정보 출력 (selectList)
	// 03-09 방 수정
	public Map<String, Object> applySubscribes(int takerNo, int productNo);
	public int registerSubscribe(int takerNo, TakerAddr takerAddr, String addDeliveryList, String noAddr, Subscribe subscribe, TakerCard takerCard);
	
	//구독상품 detail 03-04 송진현 추가
	public Map<String, Object> getProductDetail(int productNo);

	
	//구독 등록 폼 서비스 03-04 박형우 추가
	public Map<String, Object> showRegisterSubsForm(int category);
	//210304 박형우------------------------------------------------------
	//해당 시,군의 속하는 Json
	public List<Region> getSubStateJson(int stateNo);
	//210304 박형우------------------------------------------------------
	//구독 등록하기
	public boolean registerProduct(Member loginMember, Product product, String editorContent, int[] days, int[] deliveryAvailSubState, int[] deliveryAvailTax);
	//210304 박형우 end--------------------------------------------------
	
	//0312 이소현 _ (목록페이지) 카테고리 이름으로 2차 카테고리 목록 얻어오기
	public Map<String, Object> getSecondCategoryList(String category);
	
	//0312 이소현 _ (목록페이지) 카테고리 no로 상품 목록 얻어오기
	public Map<String, Object> getProductList(int categoryNo, int page, String sort);
	
	//0313 이소현 _ (목록페이지) 지역 팝업
	public Map<String, Object> getRegionListForPopup();
	
	//0314 이소현 _ (검색 결과) 
	public String getSearchResult(String keyword);
	
	//0315 이소현 _ (검색 결과페이지) 결과 목록 나타내기
	public Map<String, Object> getResultProductList(String keyword, int page, String sort, String category);
	
		
	
}
