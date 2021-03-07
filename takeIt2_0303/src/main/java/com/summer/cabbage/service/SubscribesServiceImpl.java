package com.summer.cabbage.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.summer.cabbage.dao.CategoriesDAO;
import com.summer.cabbage.dao.DeliveryDaysDAO;
import com.summer.cabbage.dao.DeliveryRegionsDAO;
import com.summer.cabbage.dao.GiversDAO;
import com.summer.cabbage.dao.ProductsDAO;
import com.summer.cabbage.dao.RegionsDAO;
import com.summer.cabbage.dao.ReviewsDAO;
import com.summer.cabbage.dao.SubscribesDAO;
import com.summer.cabbage.dao.TakerAddrsDAO;
import com.summer.cabbage.util.PaginateUtil;
import com.summer.cabbage.vo.DeliveryDay;
import com.summer.cabbage.vo.DeliveryRegion;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.PageVO;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Region;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerAddr;

@Service
public class SubscribesServiceImpl implements SubscribesService {

	@Autowired
	private SubscribesDAO subscribesDAO;
	
	// 03-04 정진하 추가
	@Autowired
	private DeliveryDaysDAO deliveryDaysDAO;
	
	// 03-04 방현수 추가
	@Autowired
	private TakerAddrsDAO takerAddrsDAO;
	
	@Autowired
	private ProductsDAO productsDAO;
	
	@Autowired
	private DeliveryRegionsDAO deliveryRegionsDAO;
	
	//03-04 송진현 추가
	@Autowired
	private GiversDAO giversDAO;

	@Autowired
	private ReviewsDAO reviewsDAO;
	// 03-04 이소현 추가
	@Autowired
	private CategoriesDAO categoriesDAO; 
	//03-04 박형우 추가
	@Autowired
	private RegionsDAO regionsDAO;
	@Autowired
	private ProductsDAO productDAO;
	
	
	// 03-04 정진하 추가
	@Override
	public List<Subscribe> getMonthlySubscriptions(int takerNo) {
		return subscribesDAO.selectMonthlySubscriptions(takerNo);
	}

	
	@Override
	public List<SubscriptionDay> getSubscriptionDays(int takerNo) {
		
		List<SubscriptionDay> list = subscribesDAO.selectSubscriptionDays(takerNo);
		
		for (SubscriptionDay subscriptionDay : list) {
			subscriptionDay.setDeliveryDays(deliveryDaysDAO.selectList(subscriptionDay.getProductNo()));
		}//for end
		
		return list;
	}
	// 03-04 정진하 추가 end
	
	// 03-04 방현수 추가
	@Override
	public Map<String, Object> applySubscribes(int takerNo, int productNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		// 주소 목록 받아오기
		map.put("takerAddrs", takerAddrsDAO.selectList(takerNo));
		// 기본 배송지 받아오기
		try {
			map.put("takerOneAddr", takerAddrsDAO.selectOne(takerNo));
		} catch (Exception e) {
			
		}

		// 구독 상품 정보 받아오기
		map.put("product", productsDAO.selectOne(productNo));
		
		// 구독 상품의 배송지 받아오기
		map.put("deliveryOpt", deliveryRegionsDAO.selectList(productNo)); 
		
		// 구독 상품의 배송 요일 받아오기
		map.put("daysOpt", deliveryDaysDAO.selectListDays(productNo));
		return map;
	}
	
	@Transactional
	@Override
	public int registerSubscribe(int takerNo, TakerAddr takerAddr, String addDeliveryList, String noAddr) {
		
		int result =0;
		// 먼저 해당 유저가 등록된 배송지가 하나도 없으면(noAddr==Y -> noAddr!=null) 기본배송지로 저장
		takerAddr.setTakerNo(takerNo);
		if(noAddr!=null) {
			
			// 무조건 기본 배송지
			takerAddr.setType("Y");
			result = takerAddrsDAO.insertAddr(takerAddr);
			
		} 
		
		if(addDeliveryList!=null&&takerAddr.getType()!=null){
			// 다른 배송지를 일반으로 바꿔준 뒤에
			takerAddrsDAO.updateSetOthersNormal(takerNo);
						
			// 새로 입력하는 배송지를 기본배송지로 
			result = takerAddrsDAO.insertAddr(takerAddr);
			
			//배송지가 있는 유저면서, 배송지 추가만 누른 경우
		} else if(addDeliveryList!=null){
			
			takerAddr.setType("N");
			result = takerAddrsDAO.insertAddr(takerAddr);
			
			
			//기본배송지만 설정한 경우
		} else if(takerAddr.getType()!=null) {
			
			// 다른 배송지를 일반으로 바꿔준 뒤에
			int updateResult = takerAddrsDAO.updateSetOthersNormal(takerNo);
			
			// 새로 입력하는 배송지를 기본배송지로 
			result = takerAddrsDAO.insertAddr(takerAddr);
			
		}
		
		return result;
	}
	
	//송진현 구독상품 detail 03-04 추가//
	@Override
	public Map<String, Object> getProductDetail(int productNo) {
		Map<String, Object> map= new ConcurrentHashMap<String, Object>();
		
		map.put("product",productsDAO.selectDetailOne(productNo));
		map.put("giver",giversDAO.selectDetailOne(productNo));
		map.put("deliveryDays",deliveryDaysDAO.selectListDay(productNo));
		map.put("deliveryRegions",deliveryRegionsDAO.selectListRegion(productNo));
		map.put("reviews",reviewsDAO.selectListreview(productNo));
		
		return map;
	}
	//송진현//
	
//03-04 이소현 _ (카테고리 목록) 카테고리 번호로 목록 불러오기 + 페이징 처리
	@Override
	public Map<String, Object> getProductListByCategory(String category, int categoryNo, int page) {  
			
		Map<String, Object> map  = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(page, 5);
		
		int total = productsDAO.selectTotal();
		
		String paginate = PaginateUtil.getPaginate(page, total, 5, 12, "/"+category+"/"+categoryNo);
		
		//pathVariable로 카테고리 이름을 받아오기 때문에 그걸 category의 priorNo 로 바꾸기
		int priorNo = 0;
		
		if(category.equals("clothes")) {
			priorNo = 1;
		} else if(category.equals("food")) {
			priorNo = 2;
		} else if(category.equals("living")) {
			priorNo = 3;
		} else {
			priorNo = 4;
		}//if~else if~else if~else end
		
		//priorNo 값을 set 으로 넣어준다. 
		pageVO.setPriorNo(priorNo);
		pageVO.setCategoryNo(categoryNo);
		
		//2차 카테고리 나타내기 위해서.
		map.put("categories", categoriesDAO.selectListByCategory(priorNo));
		
		//? 
		map.put("category", categoriesDAO.selectSecondCategory(priorNo));
		
		//카테고리 번호로 상품 목록 나타내기 + 페이징처리
		map.put("subsList", productsDAO.selectProductListByCategory(pageVO));

		//페이징처리
		map.put("paginate",paginate);
					
		System.out.println("여기?");
		
		return map;
	}
	
	//구독 등록 폼 서비스
	@Override
	public Map<String, Object> showRegisterSubsForm(int category) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		map.put("categories", categoriesDAO.selectSecondCategories(category));
		map.put("states", regionsDAO.selectStates());
		
		return map;
	}
	//210304 박형우------------------------------------------------------
	
	//해당 시,군의 속하는 Json
	@Override
	public List<Region> getSubStateJson(int stateNo) {
		return regionsDAO.selectSubStates(stateNo);
	}
	//210304 박형우------------------------------------------------------

	//구독 등록하기
	@Override
	@Transactional
	public boolean registerProduct(Member loginMember, Product product, String editorContent, int[] days, int[] deliveryAvailSubState,
			int[] deliveryAvailTax) {
		product.setGiverNo(loginMember.getNo());
		product.setDetails(editorContent);
		
		System.out.println(product.getDetails()+" : 서비스에서 상세");
		
		int result1 = productDAO.insertProduct(product);
		
		DeliveryDay tempDelDay = new DeliveryDay();
		tempDelDay.setProductNo(product.getNo());
		int result2 = 1;
		for(int day : days) {
			tempDelDay.setDay(day);
			result2 *= deliveryDaysDAO.insertDeliveryDays(tempDelDay);
		}
		
		DeliveryRegion tempDelRegion = new DeliveryRegion();
		tempDelRegion.setProductNo(product.getNo());
		int result3 = 1;
		for(int i=0; i<deliveryAvailSubState.length; i++) {
			tempDelRegion.setAreaNo(deliveryAvailSubState[i]);
			tempDelRegion.setPrice(deliveryAvailTax[i]);
			result3 *= deliveryRegionsDAO.insertDeliveryRegions(tempDelRegion);
		}
		
		return 1==result1*result2*result3;
	}
	//210304 박형우------------------------------------------------------
	
}
