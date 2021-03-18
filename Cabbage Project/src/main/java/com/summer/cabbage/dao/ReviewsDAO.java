package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Review;
import com.summer.cabbage.vo.Subscribe;

public interface ReviewsDAO {

	//03-04 송진현 추가
	public List<Review> selectListreview(int productNo);
	
	//03-03 이소현 _ (기버 마이페이지 리뷰관리) 리뷰 받아오기
	public List<Review> selectReviewsByProductNo(int productNo);
	
	//0311 추가 : 오승주
		public void insertReview(Review review);

	    // 0314 추가 : 오승주 (리뷰가 있는지 없는지 확인용)
		public int selectReviewOnOff(Subscribe subscribe);

		// 0314 추가 : 리뷰 수정시 기존의 리뷰를 불러오기 위함 
		public Review selectReview(Review review);

		// 0314 : 오승주 : 리뷰 수정
		public void updateReview(Review review);
	
}
