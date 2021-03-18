package com.summer.cabbage.service;

import java.util.Map;

import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Review;
import com.summer.cabbage.vo.Taker;

public interface TakersService {

	Map<String, Object> getSubList(int takerNo, String status, int page);
	
	// 03-04 정진하 추가

	public Taker getTaker(int no);

	// taker my page profile update
	public boolean updateProfile(Member member);

	// 테이커 닉네임 유효성검사
	public boolean checkNickname(String nickname);

	// 테이커 닉네임 수정
	public boolean updateNickname(Taker taker);

	// 03-04 정진하 end

	// 0311 오승주
	public void reviewRegister(Review review);

	public void cancelSub(int subsNo);
	// end 0311 오승주

	// 0314 기존의 리뷰 정보들을 불러온다.
	public Review getReviewData(Review review);

	// 0314: 오승주 리뷰 수정
	public void updateReview(Review review);
}
