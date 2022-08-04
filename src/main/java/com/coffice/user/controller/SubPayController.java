package com.coffice.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SubPayController {

	// 패스구매
	@RequestMapping(value = "/order/subPay.do", method = RequestMethod.GET)
	public String subPay() {

		return "/user/order/subPay";
	}

	// 패스구매완료
	@RequestMapping(value = "/order/subPayResult.do", method = RequestMethod.GET)
	public String subPayResult() {

		return "/user/order/subPayResult";
	}

}
