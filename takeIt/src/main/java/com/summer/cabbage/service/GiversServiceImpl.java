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
import com.summer.cabbage.dao.PaymentsDAO;
import com.summer.cabbage.dao.ProductsDAO;
import com.summer.cabbage.dao.RepliesDAO;
import com.summer.cabbage.dao.ReviewsDAO;
import com.summer.cabbage.dao.SubscribesDAO;
import com.summer.cabbage.util.PaginateUtil;
import com.summer.cabbage.util.chartUtil;
import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.PageVO;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Reply;
import com.summer.cabbage.vo.Review;
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
	@Autowired
	private PaymentsDAO paymentsDAO;
	//03-02 이소현
	@Autowired
	private ReviewsDAO reviewsDAO;
	//0304 이소현
	@Autowired
	private RepliesDAO repliesDAO;

	
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
	
	
	//0304이성정
		
	//0304 이성정==================================================
		@Override
		public int getProductsCount(int giverNo) {
			// TODO Auto-generated method stub
			return subscribesDAO.selectNowProductCount(giverNo);
		}
		
		//현재 총 구독자수
		@Override
		public int getSubscribers(int giverNo) {
			// TODO Auto-generated method stub
			return subscribesDAO.selectSubscriberCount(giverNo);
		}
		
		//오늘의 구독자수
		@Override
		public int getTodaySubscribers(int giverNo) {
			// TODO Auto-generated method stub
			return subscribesDAO.selectTodaySubscriberCount(giverNo);
		}
		
		@Override
		public List<Map<String, Object>> getProductCountByDate(int giverNo) {
			// TODO Auto-generated method stub
			return subscribesDAO.selectProductCountByDate(giverNo);
		}
		
		@Override
		public List<Map<String, Object>> getPaymentCountByDate(int giverNo) {
			// TODO Auto-generated method stub
			return paymentsDAO.selectPaymentCountByDate(giverNo);
		}
		
		@Override
		public List<Map<String, Object>> getPriceSumByDate(int giverNo) {
			// TODO Auto-generated method stub
			return paymentsDAO.selectPriceSumByDate(giverNo);
		}
		//0305 이성정 =================================================
		//기버메인페이지에 출력할 정보들 mapping해주는 서비스
		@Override
		public Map<String, Object> getMainFeature(int giverNo) {
			//총구독자수, 오늘의 구독자 수 , 총 구독상품 수 를 받아온다
			int subscribersCount = getSubscribers(giverNo);
			int todaySubscribersCount = getTodaySubscribers(giverNo);
			int productsCount = getProductsCount(giverNo);
			
			// 날짜, 구독자수 를 맵으로 받아서 리스트에 넣어준다 generic이 map인 List 
			List<Map<String, Object>> subscriberCountList = getProductCountByDate(giverNo);
			List<Map<String, Object>> paymentCountList = getPaymentCountByDate(giverNo);
			List<Map<String, Object>> priceSumList = getPriceSumByDate(giverNo);

			
			//System.out.println(subscriberCountList.get(0).get("DATE").toString().substring(4));
			//System.out.println(subscriberCountList.size());
			List<String> dateList = chartUtil.getDateList();
			List<Map<String, Object>> countListBysubscriber = chartUtil.getChartList(subscriberCountList);
			List<Map<String, Object>> countListByPayment = chartUtil.getChartList(paymentCountList);
			List<Map<String, Object>> countListByPriceSum = chartUtil.getChartList(priceSumList);
			
			
			
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			map.put("subscribersCount", subscribersCount);
			map.put("todaySubscribersCount", todaySubscribersCount);
			map.put("productsCount", productsCount);
			//map.put("subscriberCountList", subscriberCountList);
			map.put("countListBysubscriber", countListBysubscriber);
			map.put("countListByPayment", countListByPayment);
			map.put("countListByPriceSum", countListByPriceSum);
			map.put("dateList", dateList);
			
			return map;
		}
		
		//오늘의 매출금액
		@Override
		public int getToaySales(int giverNo) {
			// TODO Auto-generated method stub
			return paymentsDAO.selectTodaySales(giverNo);
		}
		
		//총 매출금액
		@Override
		public int getTotalSales(int giverNo) {
			// TODO Auto-generated method stub
			return paymentsDAO.selectTotalSales(giverNo);
		}
		
		//매출관리페이지에 출력할 데이터 호출하는 서비스
		@Override
		public Map<String, Object> getSalesFeature(int giverNo) {
			// TODO Auto-generated method stub
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			
			//오늘 매출 데이터
			try {
				map.put("todaySales", getToaySales(giverNo));
			} catch (Exception e) {
				map.put("todaySales", 0);
			}
			//총 매출
			try {
				map.put("totalSales", getTotalSales(giverNo));
			} catch (Exception e) {
				map.put("totalSales", 0);
			}
			//오늘의 구독자 수
			try {
				map.put("todaySubscribers",getTodaySubscribers(giverNo));
			} catch (Exception e) {
				map.put("todaySubscribers",0);
			}
			//총 구독자수
			try {
				map.put("totalSubscribers", getSubscribers(giverNo));
			} catch (Exception e) {
				map.put("totalSubscribers",0);
			}
			
			return map;
		}
		
		
		//=================================================================
		
		// 0302 판매자 정보 더보기 : 오승주 ===============================
		@Override
		public Map<String, Object> getGiverDetail(int no) {
			// TODO Auto-generated method stub
			Map<String, Object> map=new ConcurrentHashMap<String, Object>();
			
			map.put("giver", giversDAO.selectDetail(no));  // 기버의 상세 정보 
			map.put("review",giversDAO.selectAvgAndCount(no));   // 기버의 리뷰 평균 평점과 개수
			map.put("subCount", giversDAO.selectSubCount(no));  // 기버의 구독자 수
			
			return map;
		}
		// =================================================================

		
		// 0304 : 오승주 ///////////////////////////////// 기버가 가진 상품들 
		@Override
		public Map<String,Object> getGiverItems(int giverNo, int page, String sort) {
			// TODO Auto-generated method stub
			Map<String,Object> map=new ConcurrentHashMap<String, Object>();
			
			PageVO pageVO=new PageVO(page,3,giverNo,sort);
			
			int total=giversDAO.selectItemCount(giverNo);
			
			String paginate=PaginateUtil.getPaginate(page, total, 3, 3,"/giver/"+giverNo+"/items");
			
			map.put("itemList", giversDAO.selectGiverItems(pageVO));
			map.put("paginate", paginate);
			
			return map;
		}
		//=======================================================================
		
		//03-04 이아림 추가
		//기버마이페이지 판매자정보 탭에서 기버 정보 출력
		@Override
		public Giver getGiverInfo(int no) {
		
			return giversDAO.selectGiverInfo(no);
		}//getGiverInfo() end
		
		//기버마이페이지 프로필 수정 메서드 구현
		@Override
		   public boolean updateProfile(Member member) {
		      return 1==giversDAO.updateProfile(member);
		}
		//03-04 이아림 추가 end		
		
		
		//========================이성정 최종 추가====================================
		
		@Override
		public List<Map<String, Object>> getSalesByMonth(int giverNo) {
			// TODO Auto-generated method stub
			return paymentsDAO.selectSalesByMonth(giverNo);
		}
		@Override
		public List<Map<String, Object>> getSubscribersByMonth(int giverNo) {
			// TODO Auto-generated method stub
			return subscribesDAO.selectSubscribersByMonth(giverNo);
		}
		
		@Override
		public List<Map<String, Object>> getSalesChartFeature(int giverNo) {
			// TODO Auto-generated method stub

			List<Map<String, Object>> salesByMonthList =getSalesByMonth(giverNo);
			
			List<String> monthList = chartUtil.getMonthList(); 
			
		
			
			return chartUtil.getChartByMonth(salesByMonthList);
		}
		
		@Override
		public List<Map<String, Object>> getSubscribersChartFeature(int giverNo) {
			// TODO Auto-generated method stub
			List<Map<String, Object>> subscribersByMonthList = getSubscribersByMonth(giverNo);
			
			return chartUtil.getChartByMonth(subscribersByMonthList);
		}
		
		//=============================================================================
	//03-04 이소현 추가
	//03-03 이소현 _ 기버 번호로 제품 목록 & 리뷰 리스트  불러오기
	@Override
	public List<Product> selectProductListByGiverNo(int giverNo) {
		
		return productsDAO.selectProductListByGiverNo(giverNo);
	}
	
	//03-03 이소현 _ (기버 마이페이지 리뷰관리) 리뷰 + 답글 받아오기	
	  @Override 
	  public  List<Review> getReviewList(int productNo) {
	  
		  //System.out.println(reviewsDAO.selectReviewsByProductNo(review));
		  
		  List<Review> reviews = reviewsDAO.selectReviewsByProductNo(productNo);
		  
		  //리뷰에 맞는 답글 set으로 넣어주기.
		  for (Review review : reviews) {
			  
			//  System.out.println(review.getNo());
			
			  review.setReply(repliesDAO.selectOneReply(review.getNo()));
		  
		  }//for() end
		  
		  return reviews; 
	  }//getReviewList() end
	
	//0304 이소현 _ (리뷰 관리) 답글 등록
	@Override
	public int registerReply(Reply reply) {
		
		System.out.println(reply.getGiverNo()+"서비스");
		System.out.println(reply.getReply()+"서비스");
			
		return repliesDAO.insertReply(reply);
	}
	
	//0305 이소현 _ (리뷰 관리) 답글 수정
	@Override
	public int modifyReply(Reply reply) {
		
		return repliesDAO.updateReply(reply);
	}
	
	//0305 이소현 _ (리뷰 관리) 답글 삭제
	@Override
	public int removeReply(int no) {
	
		return repliesDAO.deleteReply(no);
	}
	//03-04 이소현 추가 end

		
	
}
