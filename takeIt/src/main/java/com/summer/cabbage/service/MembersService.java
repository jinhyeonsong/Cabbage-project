package com.summer.cabbage.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;

public interface MembersService {

	Member login(Member member);
	public void findPw(Member member);
	
	//03-04 이아림 추가
	//아이디체크
	public boolean checkId(String id);
	//닉네임체크
	public boolean checkNickname(String nickname);
	//03-04 이아림 추가 end
	
	//03-04 송진현 추가
	public Giver getGiverBusinessNum(Giver giver);
	public boolean checkBusinessName(String businessName);
	public boolean checkGiverId(String id);
	public void singUpGiver(Member member, Giver giver);
	//03-04 송진현 추가 end
	
	//메인 폼 서비스
	public Map<String, Object> showMainForm();
	//210305 박형우-------------------------------------------------------

}
