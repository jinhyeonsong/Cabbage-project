package com.summer.cabbage.service;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.MembersDAO;
import com.summer.cabbage.util.SendEmailUtil;
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
	@Override
	public void findPw(Member member) {
		
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 10; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			//랜덤 비밀번호 set
			member.setPassword(pw);
			
			//member dao에 update 구문
			membersDAO.updatePw(member);

			// 비밀번호 변경 메일 발송
			SendEmailUtil.sendEmail(member, "findpw");
		
	}
}
