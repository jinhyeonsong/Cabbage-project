package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Review;

public interface ReviewsDAO {

	//03-04 송진현 추가
	public List<Review> selectListreview(int productNo);
	
	//03-03 이소현 _ (기버 마이페이지 리뷰관리) 리뷰 받아오기
	public List<Review> selectReviewsByProductNo(int productNo);
	
}
