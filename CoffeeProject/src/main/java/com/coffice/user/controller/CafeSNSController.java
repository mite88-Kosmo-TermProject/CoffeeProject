package com.coffice.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class CafeSNSController {

	//SNS리뷰
	@RequestMapping(value = "/cafeSNS/review.do", method = RequestMethod.GET)
	public String review() {
	

		return "/user/cafeSNS/review";
	}
	

}
