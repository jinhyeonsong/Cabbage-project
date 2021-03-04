package com.summer.cabbage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.GiversDAO;
import com.summer.cabbage.dao.MembersDAO;
import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;

@Service
public class MembersServiceImpl implements MembersService {

	@Autowired
	private MembersDAO membersDAO;
	
	@Autowired
	private GiversDAO giversDAO;
	
	@Override
	public Member login(Member member) {
		// TODO Auto-generated method stub
		return membersDAO.selectLogin(member);
	}
	
	@Override
	public Giver getGiverBusinessNum(Giver giver) {
		// TODO Auto-generated method stub
		return giversDAO.selectbusinessNum(giver);
	}
	
	@Override
	public boolean checkBusinessName(String businessName) {
		// TODO Auto-generated method stub
		return 1==membersDAO.selectBusinessName(businessName);
	}
	@Override
	public boolean checkId(String id) {
		// TODO Auto-generated method stub
		return 1==membersDAO.selectId(id);
	}
	
	@Override
	public void singUpGiver(Member member, Giver giver) {
		 membersDAO.insertMember(member);
		 	
		 giver.setNo(member.getNo());
		
		 giversDAO.insertGiver(giver);
	}
}
