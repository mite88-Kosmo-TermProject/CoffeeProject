package com.coffice.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class homeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	

		return "home";
	}
	

	@RequestMapping("/login.do")
	public String login() {

		return "/user/member/login";
	}

	@RequestMapping("/SignUp.do")
	public String signup() {

		return "/user/member/signup";
	}

	@RequestMapping("/Nextsignup.do")
	public String nextsignup() {

		return "/user/member/nextsignup";
	}

	@RequestMapping("/write.do")
	public String write() {

		return "/user/member/write";
	}
	@RequestMapping("/table.do")
	public String table() {
		
		return "/user/member/table";
	}
	@RequestMapping("/pay.do")
	public String pay() {
		
		return "/user/order/subPay";
	}
	@RequestMapping("/subPayResult.do")
	public String paypay() {
		
		return "/user/order/subPayResult";
	}

	

}
