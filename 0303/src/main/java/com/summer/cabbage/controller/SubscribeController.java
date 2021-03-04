package com.summer.cabbage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SubscribeController {

	
	@RequestMapping(value="ProductDetail", method=RequestMethod.GET)
	public String index() {
		return "ProductDetail";
	}
}
