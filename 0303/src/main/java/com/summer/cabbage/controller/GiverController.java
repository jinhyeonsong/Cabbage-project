package com.summer.cabbage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
}
