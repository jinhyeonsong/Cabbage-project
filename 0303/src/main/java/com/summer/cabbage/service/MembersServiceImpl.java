package com.summer.cabbage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.MembersDAO;
import com.summer.cabbage.vo.Member;

@Service
public class MembersServiceImpl implements MembersService {

	@Autowired
	private MembersDAO membersDAO;
	
	@Override
	public Member login(Member member) {
		// TODO Auto-generated method stub
		return membersDAO.selectLogin(member);
	}
}
