package com.coffice.storeowner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreownerHomeController {
	//메인
	@RequestMapping(value = "/storeowner/index.do", method = RequestMethod.GET)
	public String index() {
		System.out.println("!!!");
		return "/storeowner/index";
	}
	

}
