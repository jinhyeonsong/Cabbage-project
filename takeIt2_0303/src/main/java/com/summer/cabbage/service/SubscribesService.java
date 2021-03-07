package com.summer.cabbage.service;

import java.util.List;
import java.util.Map;

import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Region;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerAddr;

public interface SubscribesService {

	// 03-04 정진하 추가
	public List<Subscribe> getMonthlySubscriptions(int takerNo);
	public List<SubscriptionDay> getSubscriptionDays(int no);
	
	// 유저 배송지 정보 출력 (selectList)
	public Map<String, Object> applySubscribes(int takerNo, int productNo);
	public int registerSubscribe(int takerNo, TakerAddr takerAddr, String addDeliveryList, String noAddr);
	
	//구독상품 detail 03-04 송진현 추가
	public Map<String, Object> getProductDetail(int productNo);
	
	//03-04 이소현 _ (카테고리 목록) 카테고리 번호로 목록 불러오기
	public Map<String, Object> getProductListByCategory(String category, int categoryNo, int page);
	
	//구독 등록 폼 서비스 03-04 박형우 추가
	public Map<String, Object> showRegisterSubsForm(int category);
	//210304 박형우------------------------------------------------------
	//해당 시,군의 속하는 Json
	public List<Region> getSubStateJson(int stateNo);
	//210304 박형우------------------------------------------------------
	//구독 등록하기
	public boolean registerProduct(Member loginMember, Product product, String editorContent, int[] days, int[] deliveryAvailSubState, int[] deliveryAvailTax);
	//210304 박형우 end--------------------------------------------------
		
	
}
