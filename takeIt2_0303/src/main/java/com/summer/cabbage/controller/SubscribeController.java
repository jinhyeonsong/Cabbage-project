package com.summer.cabbage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.summer.cabbage.service.SubscribesService;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerAddr;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribesService service;
	
	//20210304 정진하 풀캘린더에 뜨게하기 위함
	@RequestMapping(value="/ajax/taker/{no}/subscriptions", method=RequestMethod.GET)
	@ResponseBody
	public List<SubscriptionDay> getMonthlySubscriptions(@PathVariable int no) throws IOException {
		return service.getSubscriptionDays(no);
	}
	
	//03-04 방현수 추가
	@RequestMapping(value="/subscribe/{productNo}", method=RequestMethod.GET)
	public String subscribe(Subscribe subscribe, Model model, HttpSession session , @PathVariable int productNo) {
		 
			 //구현해야 하는 내용 -> 필요한 정보
		 
		 /*
		  *  1. 유저 정보를 통한 배송지 정보 출력 -> 유저 번호 위한 HttpSession, 배송지 정보 위한 Model 필요 
		  *  2. 이전 구독
		 *	 상세 페이지에서 넘어온 파라미터(유저가 선택한 옵션)를 받아서 출력 -> Subscribe VO 
		 *	3. 구독 서비스의 상세 정보 ->
		 *   subsNo를 통해 select 후 출력 -> Model 필요
		 */
			 
		//서블릿과 달리 session 저장 안해도 바로 불러올 수 있다. 멤버 정보를 얻어옴
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(loginMember.getNo());
		 
		// 유저 배송지 
		model.addAllAttributes(service.applySubscribes(loginMember.getNo(), productNo));
		 
		return "/subscribe"; 
	}
	
	
	@RequestMapping(value="/subscribe", method=RequestMethod.POST)
	public String subscribe(HttpSession session, TakerAddr takerAddr,
			@RequestParam(required = false) String addDeliveryList, @RequestParam(required = false) String noAddr) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(addDeliveryList);
		System.out.println(takerAddr.getType());
		service.registerSubscribe(loginMember.getNo(), takerAddr, addDeliveryList, noAddr);
		
		return "redirect:/index";
	}
	//03-04 방현수 추가 end
	
	//-- 송진현 --//
	//구독상품 detail
	@RequestMapping(value="/taker/subscribe/{productNo}",method=RequestMethod.GET)
	public String adad(Model model,@PathVariable int productNo) {
		
		model.addAllAttributes(service.getProductDetail(productNo));
		
		return "subscribeDetail";
	}
	//-- 03-04 송진현 --//
	//03-04 이소현 _ 카테고리 있는 메인 목록 페이지
	@RequestMapping(value="/{category}/{categoryNo}/page/{page}", method = RequestMethod.GET)
	public String mainList(@PathVariable String category, @PathVariable int categoryNo, @PathVariable int page, Model model) {
		
		System.out.println(category);
		System.out.println(categoryNo);
		
		model.addAllAttributes(service.getProductListByCategory(category, categoryNo, page)); 

		return "category_list";
		
	}
	
	
}
