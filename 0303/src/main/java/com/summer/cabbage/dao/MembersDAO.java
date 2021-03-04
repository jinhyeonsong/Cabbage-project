package com.summer.cabbage.dao;


import com.summer.cabbage.vo.Member;

public interface MembersDAO {

	// 로그인 하는 메서드
	Member selectLogin(Member member);
	public int selectBusinessName(String businessName);
	public int selectId(String id);
	public int insertMember(Member member);
}
