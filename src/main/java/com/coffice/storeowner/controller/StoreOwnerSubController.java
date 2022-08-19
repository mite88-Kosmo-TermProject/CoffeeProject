package com.coffice.storeowner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreOwnerSubController {
	
	//구독리스트
	@RequestMapping(value = "/storeowner/storeOwnerSub/list.do", method = RequestMethod.GET)
	public String list() {

		return "/storeowner/storeOwnerSub/list";
	}
	
}
