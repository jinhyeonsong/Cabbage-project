package com.summer.cabbage.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.summer.cabbage.service.GiversService;


@Controller
public class GiverController {

	@Autowired
	private GiversService service;
	
	@RequestMapping(value="/giver/{no}",method=RequestMethod.GET)
	public String giverInform(@PathVariable int no,Model model) {
		// 여기다가 기버에 대한 정보랑 기버가 리뷰평점과 구독자 수 나타내기 
		model.addAllAttributes(service.getGiverDetail(no));
		return "giverInform";
	}
	
	//03-03 강필규 추가
	@RequestMapping(value = "/giver/{giverNo}/order/check",method = RequestMethod.GET )
	private String getSubList(@PathVariable int giverNo, Model model, @RequestParam(required = false)String startDate, @RequestParam(required = false)String productNo) {
	
		model.addAllAttributes(service.getGiverOrderCheckList(giverNo, startDate, productNo));
		return "orderCheck";
		
	}
	
	// 03-04 강필규 추가
	@RequestMapping(value = "/giver/{giverNo}/order/check",method = RequestMethod.PUT)
	private String SubDelete(@PathVariable int giverNo,@RequestParam(required = false) int[] no) {
		
		service.deleteOrderCheckList(no);
		
		return "redirect:/giver/"+giverNo+"/order/check";
		
	}

}
