package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Review;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO {
	@Autowired
	private SqlSession session;
	
	//구독상품번호로 리뷰 03-04 송진현 추가
	@Override
	public List<Review> selectListreview(int productNo) {
		return session.selectList("reviews.selectListreview",productNo);
	}
	
	//03-03 이소현 _ (기버 마이페이지 리뷰관리) 리뷰 받아오기	
	 @Override 
	 public List<Review> selectReviewsByProductNo(int productNo) {
	  
		 return session.selectList("reviews.selectReviewsByProductNo", productNo); 
	 }
	
}
