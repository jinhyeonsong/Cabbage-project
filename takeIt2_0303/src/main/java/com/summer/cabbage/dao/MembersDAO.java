package com.summer.cabbage.dao;

import com.summer.cabbage.vo.Member;

public interface MembersDAO {

	// 로그인 하는 메서드
	Member selectLogin(Member member);

	int updatePw(Member member);

}
