package com.summer.cabbage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.summer.cabbage.service.MembersService;
import com.summer.cabbage.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MembersService service;

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	
	@RequestMapping(value="/log",method=RequestMethod.GET)
	public String loginForm() {
		return "/login";
	}
	
	@RequestMapping(value="/log",method=RequestMethod.POST)
	public String login(Member member, HttpSession session, RedirectAttributes ra) {
		// 서비스 메서드 이용해서 로그인 처리 해주기 
	
		session.setAttribute("loginMember",service.login(member));
	
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		if(loginMember!=null) {
			if(loginMember.getType()=="G") {
				// 회원의 유형이 기버일 경우 
				// 기버 마이페이지로 가자 
				System.out.println("기버마이페이지 아직 페이지 없어서 잘되나 그냥 확인용");
				return "redirect:/giver/"+member.getNo();
			}else{
				// 회원의 유형이 테이커 일 경우 
				return "redirect:/index";
			}
		}
		else {
			ra.addFlashAttribute("msg", "아이디 혹은 비밀번호 혹은 회원 유형선택이 틀렸습니다.");
			return "redirect:/log";
		}
	}
}
