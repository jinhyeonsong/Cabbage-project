package com.summer.cabbage.controller;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.summer.cabbage.service.SubscribesService;
import com.summer.cabbage.vo.Product;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribesService service;

	//-- 송진현 --//
	//구독상품 detail
	@RequestMapping(value="/subscribe/{productNo}",method=RequestMethod.GET)
	public String adad(Model model,@PathVariable int productNo) {
		
		model.addAllAttributes(service.getProductDetail(productNo));
		
		return "subscribeDetail";
	}
	//-- 송진현 --//
}
