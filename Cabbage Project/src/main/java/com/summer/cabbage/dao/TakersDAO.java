package com.summer.cabbage.dao;

import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Taker;

public interface TakersDAO {

	//03-04정진하 테이커 마이페이지에서 정보 가져오기 위해 작성함. 
	public Taker selectOneByNo(int no);

	public int updateProfile(Member member);
	
	public int selectCheckNickname(String nickname);
	
	public int updateNickname(Taker taker);
	
	//03-16 이아림 수정
	//테이커 회원가입 후 insert
	public int insertTaker(Taker taker);
	//03-16 이아림 수정 end
	
}
