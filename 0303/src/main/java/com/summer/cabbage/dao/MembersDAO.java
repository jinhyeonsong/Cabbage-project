package com.summer.cabbage.dao;


import com.summer.cabbage.vo.Member;

public interface MembersDAO {

	// 로그인 하는 메서드
	Member selectLogin(Member member);
	//상호명 중복여부-송진현
	public int selectBusinessName(String businessName);
	//아이디 중복여부-송진현
	public int selectId(String id);
	//기버회원가입-송진현
	public int insertMember(Member member);
}
