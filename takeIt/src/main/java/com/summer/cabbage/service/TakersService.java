package com.summer.cabbage.service;

import java.util.Map;

import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Taker;

public interface TakersService {

	Map<String, Object> getSubList(int takerNo, String status, int page);
	
	//03-04 정진하 추가 
	
	public Taker getTaker(int no);
	//taker my page profile update
	public boolean updateProfile(Member member);
	//테이커 닉네임 유효성검사
	public boolean checkNickname(String nickname);
	//테이커 닉네임 수정
	public boolean updateNickname(Taker taker);
	
	//03-04 정진하 end
	
	
	
}
