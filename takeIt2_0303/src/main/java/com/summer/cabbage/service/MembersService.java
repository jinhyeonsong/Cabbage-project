package com.summer.cabbage.service;

import javax.servlet.http.HttpServletResponse;

import com.summer.cabbage.vo.Member;

public interface MembersService {

	Member login(Member member);
	public void findPw(Member member);

}
