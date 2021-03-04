package com.summer.cabbage.service;

import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;

public interface MembersService {

	Member login(Member member);
	public Giver getGiverBusinessNum(Giver giver);
	public boolean checkBusinessName(String businessName);
	public boolean checkId(String id);
	public void singUpGiver(Member member, Giver giver);
}
