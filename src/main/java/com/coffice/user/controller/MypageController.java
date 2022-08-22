package com.coffice.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	// 마이페이지 메인
	@RequestMapping(value = "/mypage/main.do", method = RequestMethod.GET)
	public String main() {

		return "/user/mypage/main";
	}

	// 구독연장 /해지페이지
	@RequestMapping(value = "/mypage/subpay.do", method = RequestMethod.GET)
	public String subpay() {

		return "/user/mypage/subpay";
	}

}
