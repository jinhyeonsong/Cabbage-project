package com.summer.cabbage.dao;

import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Product;

public interface GiversDAO {

	//기버 정보받아오기-송진현
	Giver selectDetail(int no);
	//기버 사업자번호 받아오기-송진현
	Giver selectbusinessNum(Giver giver);
	//기버  회원가입-송진현
	public int insertGiver(Giver giver);
	//기버 구독상품번호로 기버 정보받아오기-송진현
	public Giver selectDetailOne(int productNo);
}
