package com.coffice.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminHomeController {

	// 어드민 로그인페이지
	@RequestMapping(value = "/admin/index.do", method = RequestMethod.GET)
	public String index() {

		return "/admin/index";
	}

	// 어드민 메인페이지
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String main() {

		return "/admin/main";
	}

}
