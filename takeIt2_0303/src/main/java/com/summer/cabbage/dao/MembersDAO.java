package com.summer.cabbage.dao;

import com.summer.cabbage.vo.Member;

public interface MembersDAO {

	// 로그인 하는 메서드
	Member selectLogin(Member member);
	//비밀번호 변경 03-04 강필규
	int updatePw(Member member);
	
	//03-04 이아림 추가
	// 아이디 체크 메서드
	public int selectCheckId(String id);
	//닉네임 체크 메서드
	public int selectNickname(String nickname);
	//03-04 이아림 추가 end
	
	//03-04 송진현 추가
	//상호명 중복여부-송진현
	public int selectBusinessName(String businessName);
	//아이디 중복여부-송진현
	public int selectId(String id);
	//기버회원가입-송진현
	public int insertMember(Member member);
	//03-04 송진현 추가 end

}
