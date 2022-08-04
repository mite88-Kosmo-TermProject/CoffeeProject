package com.coffice.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminAllianceController {

	// 점주신청페이지
	@RequestMapping(value = "/admin/alliance.do", method = RequestMethod.GET)
	public String alliance() {

		return "/admin/alliance";
	}

}
