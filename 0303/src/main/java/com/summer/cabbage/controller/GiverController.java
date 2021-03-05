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
	
	
	
	
}
