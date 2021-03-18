package com.summer.cabbage.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.DeliveryDaysDAO;
import com.summer.cabbage.dao.ReviewsDAO;
import com.summer.cabbage.dao.SubscribesDAO;
import com.summer.cabbage.dao.TakersDAO;
import com.summer.cabbage.util.PaginateUtil;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Review;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.Taker;
import com.summer.cabbage.vo.TakerPageVO;

@Service
public class TakersServiceImpl implements TakersService {
	
	@Autowired
	private SubscribesDAO subscribesDAO;
	@Autowired
	private DeliveryDaysDAO deliveryDaysDAO;
	//03-04 정진하 추가
	@Autowired
	private TakersDAO takersDAO;
	// 0311 필드 추가 
	@Autowired
	private ReviewsDAO reviewsDAO;
//////////////////////////////////////////////////////////////////////////////////////////////////	
	//0311 메서드 수정 (0314 수정 : 리뷰 수정 때문에)
	public Map<String, Object> getSubList(int takerNo, String status, int page){
		
		Map<String,Object> map=new ConcurrentHashMap<String, Object>();
		
		TakerPageVO pageVO=new TakerPageVO(page,3,takerNo,status);
		
		int total=subscribesDAO.selectItemCount(takerNo);
		
		String paginate=PaginateUtil.getPaginate(page, total, 3, 3,"/taker/"+takerNo+"/items");
		
		List<Subscribe> list=subscribesDAO.selectSubList(pageVO);
		
		
		Calendar cal=Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    // thisPaymentDate = null;
//		
		for (Subscribe subscribe : list) {
			// 배송일 넣어주기
			subscribe.setDeliveryDays(deliveryDaysDAO.selectListByproductNo(subscribe.getProductNo()));
			// 결제일 넣어주기 
			subscribe.setThisPayment(subscribesDAO.selectThisPayment(subscribe.getNo()));
		
			// 리뷰 있는 지 없는지에 관한 메서드 
			subscribe.setReviewOnOff(reviewsDAO.selectReviewOnOff(subscribe));
			try {
				cal.setTime(subscribe.getThisPayment());
				
				cal.add(Calendar.MONTH,1);
				
				subscribe.setNextPayment(df.format(cal.getTime()));
			
			}catch(NullPointerException e){
				continue;
			}
			
			
		}//for end
		
		map.put("itemList", list);
		map.put("paginate", paginate);
		
	

		return map;
	}
///////////////////////////////////////////////////////////////////////////////////////////		
	
	//03-04 정진하 추가
	@Override
	public Taker getTaker(int no) {
		return takersDAO.selectOneByNo(no);
	}
	
	@Override
	public boolean updateProfile(Member member) {
		return 1==takersDAO.updateProfile(member);
	}
	
	@Override
	public boolean checkNickname(String nickname) {
		return 1==takersDAO.selectCheckNickname(nickname);
	}
	
	@Override
	public boolean updateNickname(Taker taker) {
		return 1==takersDAO.updateNickname(taker);
	}
	//03-04 정진하 end
	// 0311 리뷰 작성 : 오승주
	@Override
	public void reviewRegister(Review review) {
		// TODO Auto-generated method stub
		reviewsDAO.insertReview(review);
	}
	
	// 0311 구독 취소 : 오승주
	@Override
	public void cancelSub(int subsNo) {
		// TODO Auto-generated method stub
		subscribesDAO.updateSub(subsNo);
	}
	
	// 0314 : 오승주 : 리뷰 수정시 기존 데이터 불러오기 위함 
	@Override
	public Review getReviewData(Review review) {
		// TODO Auto-generated method stub
		return reviewsDAO.selectReview(review);
	}
	
	
	// 0314 : 오승주 : 리뷰 수정 
	@Override
	public void updateReview(Review review) {
		// TODO Auto-generated method stub
		reviewsDAO.updateReview(review);
	}
	
}
