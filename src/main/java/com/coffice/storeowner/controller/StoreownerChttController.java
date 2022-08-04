package com.coffice.storeowner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreownerChttController {

	// 채팅관련페이지
	@RequestMapping(value = "/storeowner/chtt/EchoServer.do", method = RequestMethod.GET)
	public String cafe_Edit() {

		return "/storeowner/chtt/EchoServer";
	}
}
