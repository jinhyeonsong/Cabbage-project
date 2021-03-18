package com.summer.cabbage.service;

import java.util.ArrayList;
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
import com.summer.cabbage.dao.PaymentsDAO;
import com.summer.cabbage.dao.ProductsDAO;
import com.summer.cabbage.dao.RegionsDAO;
import com.summer.cabbage.dao.ReviewsDAO;
import com.summer.cabbage.dao.SubscribesDAO;
import com.summer.cabbage.dao.TakerAddrsDAO;
import com.summer.cabbage.dao.TakerCardsDAO;
import com.summer.cabbage.util.PaginateUtil;
import com.summer.cabbage.vo.DeliveryDay;
import com.summer.cabbage.vo.DeliveryRegion;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.PageVO;
import com.summer.cabbage.vo.Payment;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Region;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerAddr;
import com.summer.cabbage.vo.TakerCard;

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
	
	// 03-09 방현수 추가
	@Autowired
	private TakerCardsDAO takerCardsDAO;
	
	@Autowired
	private PaymentsDAO paymentsDAO;
	
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
	
	// 03-04 방현수 추가 (구독 결제단계 정보 불러오기)
	// 03-09 방 수정
	// 03-11
	@Override
	public Map<String, Object> applySubscribes(int takerNo, int productNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		// 주소 목록 받아오기
		map.put("takerAddrs", takerAddrsDAO.selectList(takerNo));

		// 기본 배송지 받아오기
		if (takerAddrsDAO.selectOne(takerNo) != null) {
			map.put("takerOneAddr", takerAddrsDAO.selectOne(takerNo));
		} else {
			System.out.println("배송지 정보가 없음");
		}

		// 구독 상품 정보 받아오기
		map.put("product", productsDAO.selectOne(productNo));

		// 구독 상품의 배송지 옵션 받아오기

		List<DeliveryRegion> dr = new ArrayList<DeliveryRegion>();
		DeliveryRegion drNoPrNo = new DeliveryRegion();

		// prior_no가 없는 경우 (서울 전체/ 경기 전체인 경우) 와 아닌 경우(서울 송파 / 경기도 안산시)를 나눠서 DAO 실행
		// prior_no SELECT결과가 null로 나온 경우
		if (deliveryRegionsDAO.selectWhether(productNo).contains(null)) {
			// prior_no가 없는 지역의 번호를 받아옴
			List<DeliveryRegion> regionNums = deliveryRegionsDAO.selectOptsWithPrimaryRegion(productNo);

			// 해당 지역의 이름을 추가함
			for (int i = 0; i < regionNums.size(); i++) {

				drNoPrNo.setNo(regionNums.get(i).getNo());
				drNoPrNo.setProductNo(productNo);

				dr.add(i, deliveryRegionsDAO.selectOptPrimaryRegionName(drNoPrNo));
			}
		} // if

		// 현재 no 에는 prior_no가 들어가 있음
		List<DeliveryRegion> optRegionNames = deliveryRegionsDAO.selectOptRegion(productNo);

		// optRegionNames의 idx에 번호(prior_no)로 selectOptPrimaryRegionName(지역이름 얻기) DAO를
		// 수행하고,
		// 리턴값인 DeliveryRegion VO에서 지역 이름을 얻어와 세팅
		for (int i = 0; i < optRegionNames.size(); i++) {

			drNoPrNo.setNo(optRegionNames.get(i).getNo());
			System.out.println(drNoPrNo.getNo());

			drNoPrNo.setProductNo(productNo);
			System.out.println(drNoPrNo.getProductNo());

			if (deliveryRegionsDAO.selectOptPrimaryRegionName(drNoPrNo) == null) {
				optRegionNames.get(i).setPrimaryRegionName(
						deliveryRegionsDAO.selectOptPrimaryRegionName2(drNoPrNo).getPrimaryRegionName());
			} else {

				optRegionNames.get(i).setPrimaryRegionName(
						deliveryRegionsDAO.selectOptPrimaryRegionName(drNoPrNo).getPrimaryRegionName());
			}
		}

		// 세팅된 위의 list 를 dr list에 추가
		dr.addAll(optRegionNames);

		for (DeliveryRegion item : dr) {
			System.out.println(item.getPrimaryRegionName());
			System.out.println(item.getRegionName());
		}

		map.put("deliveryOpt", dr);

		// 구독 상품의 배송 요일 받아오기
		map.put("daysOpt", deliveryDaysDAO.selectListDays(productNo));
		
		return map;
	}
		
		
	//0309 방현수 수정 (구독하기)
	@Transactional
	@Override
	public int registerSubscribe(int takerNo, TakerAddr takerAddr, String addDeliveryList, String noAddr, Subscribe subscribe, TakerCard takerCard) {
		
		
		/* 1. 배송지 insert */
		
		int result =0;
		// 먼저 해당 유저가 등록된 배송지가 하나도 없으면(noAddr==Y -> noAddr!=null) 기본배송지로 저장
		// 현재 takerAddr에는 회원번호는 없으니까 회워번호 넣어줌
		takerAddr.setTakerNo(takerNo);
		
		// 배송지가 하나도 없는 신규유저인 경우, 배송지 무조건 추가하고, 기본배송지로 설정
		if (addDeliveryList==null&&takerAddr.getType()==null &&noAddr!=null) {
			
			// 무조건 기본 배송지
			takerAddr.setType("Y");
			takerAddrsDAO.insertAddr(takerAddr);
	
		} else if(addDeliveryList!=null&&takerAddr.getType()!=null || takerAddr.getType()!=null){
		// 배송지 추가와 기본 배송지로 설정에 체크가 동시에 되어 있는 경우 // 또는 기본 배송지만 체크되어 있는 경우
			// 다른 배송지를 일반으로 바꿔준 뒤에
			takerAddrsDAO.updateSetOthersNormal(takerNo);
						
			// 새로 입력하는 배송지를 기본배송지로 
			result = takerAddrsDAO.insertAddr(takerAddr);
			
			// 배송지가 있는 유저면서, 배송지 추가만 누른 경우
		} else if(addDeliveryList!=null){
			
			takerAddr.setType("N");
			result = takerAddrsDAO.insertAddr(takerAddr);
			
		} 
		
		
		/* 2. 구독 리스트에 insert */
		
		subscribesDAO.insertSubscribe(subscribe);
		
		
		/* 3. 테이커 카드에 insert */
		
		takerCardsDAO.insertCardInfo(takerCard);
		
		
		/* 4. 결제 테이블에 insert
		 *  구독번호와 카드 번호를 가져와야함 -> selectKey */
		
		Payment payment = new Payment();
		
		payment.setSubNo(subscribe.getNo());
		payment.setCardNo(takerCard.getNo());
		payment.setPrice(subscribe.getPrice());
		
		paymentsDAO.insertPaymentInfo(payment);
		
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
	
	// 0308 수정 / 03-04 이소현 _ (카테고리 목록) 카테고리 번호로 목록 불러오기 + 페이징 처리
	@Override
	public Map<String, Object> getProductList(int categoryNo, int page, String sort) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		PageVO pageVO = new PageVO(page, 5, categoryNo, sort);

		// 목록 전체 크기
		int total = productsDAO.selectTotal(categoryNo);

		// 2차 카테고리 번호로 1차 카테고리 이름 받아오기
		String categoryName = categoriesDAO.selectCategoryEngNameByCategoryNo(categoryNo);

		// 페이징처리
		String paginate = PaginateUtil.getPaginate(page, total, 5, 12, "/" + categoryName);

		// 값을 set 으로 넣어준다. pageVO.setPriorNo(priorNo);
		pageVO.setCategoryNo(categoryNo);

		// 카테고리 번호로 상품 목록 나타내기 + 페이징처리
		map.put("subsList", productsDAO.selectProductListByCategory(pageVO));

		// 페이징처리
		map.put("paginate", paginate);

		return map;

	}

	// 0313 이소현 _ (목록페이지) 지역 리스트 가져오기
	@Override
	public Map<String, Object> getRegionListForPopup() {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		return map;
	}

	// 0313 이소현 _ (검색 결과) 페이지
	@Override
	public String getSearchResult(String keyword) {
		System.out.println("서비스 임플에서 " + keyword);
		return keyword;
	}

	// 0315 이소현 _ (검색 결과 페이지) 결과 목록 나타내기 + 정렬
	@Override
	public Map<String, Object> getResultProductList(String keyword, int page, String sort, String category) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		PageVO pageVO = new PageVO(page, 5, keyword, sort, category);

		// 목록 전체 크기
		int total = productsDAO.selectTotalProductListByKeyword(keyword);

		// 페이징처리
		String paginate = PaginateUtil.getPaginate(page, total, 5, 12, "/search/" + keyword);

		map.put("keyword", keyword);

		// 카테고리 번호로 상품 목록 나타내기 + 페이징처리
		map.put("subsList", productsDAO.selectSearchResultBykeyword(pageVO));
		System.out.println(productsDAO.selectSearchResultBykeyword(pageVO));

		// 페이징처리
		map.put("paginate", paginate);

		return map;
	}
	// 0312 이소현 _ (목록페이지) priorNo로 2차 카테고리 목록 받아오기
	@Override
	public Map<String, Object> getSecondCategoryList(String category) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		// pathVariable로 카테고리 이름을 받아오기 때문에 그걸 category의 priorNo 로 바꾸기
		int priorNo = 0;

		if (category.equals("clothes")) {
			priorNo = 1;
		} else if (category.equals("food")) {
			priorNo = 2;
		} else if (category.equals("living")) {
			priorNo = 3;
		} else if (category.equals("etc")) {
			priorNo = 4;
		} // if~else if~else if~else end

		map.put("categories", categoriesDAO.selectSecondCategoryByPriorNo(priorNo));
		// 지역 받아오기
		map.put("states", regionsDAO.selectStates());

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
