package com.coffice.storeowner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreownerCafeController {

	// 카페정보 입력
	@RequestMapping(value = "/storeowner/cafe/edit.do", method = RequestMethod.GET)
	public String cafe_Edit() {

		return "/storeowner/cafe/edit";
	}

}
