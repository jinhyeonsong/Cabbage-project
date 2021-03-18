package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.PageVO;
import com.summer.cabbage.vo.Product;

public interface GiversDAO {
	
	Giver selectDetail(int no); // 0302 오승주 ///////기버 정보 더보기 
	Giver selectAvgAndCount(int no); // 0303 오승주 //// 기버의 평균평점과 리뷰수 
	int selectSubCount(int no);  // 0303 오승주 ///// 기버의 구독자수 
	List<Product> selectGiverItems(PageVO pageVO);  //0304 오승주 기버의 아이템들 
	int selectItemCount(int giverNo); // 0304 오승주 기버가 가진 상품의 개수
	

	//기버마이페이지 판매자정보 03-04 이아림 추가
	Giver selectGiverInfo(int no);
	public int updateProfile(Member member);
	
	//03-04 송진현 추가
	
	//기버 사업자번호 받아오기-송진현
	Giver selectbusinessNum(Giver giver);
	//기버  회원가입-송진현
	public int insertGiver(Giver giver);
	//기버 구독상품번호로 기버 정보받아오기-송진현
	public Giver selectDetailOne(int productNo);
	
	//03-04 송진현 추가 end

	//03-16 이아림 추가
	//기버마이페이지 연락처 수정
	public int updatePhone(Giver giver);
	//03-16 이아림 추가 end
	
}
