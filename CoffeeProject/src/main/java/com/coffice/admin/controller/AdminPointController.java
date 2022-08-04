package com.coffice.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminPointController {

	// 어드민 포인트기본설정
	@RequestMapping(value = "/admin/point/index1.do", method = RequestMethod.GET)
	public String index1() {

		return "/admin/point/index1";
	}

	// 어드민 출책이벤트설정(룰렛)
	@RequestMapping(value = "/admin/point/index2.do", method = RequestMethod.GET)
	public String index2() {

		return "/admin/point/index2";
	}

	// 어드민 회원포인트조회
	@RequestMapping(value = "/admin/point/list.do", method = RequestMethod.GET)
	public String list() {

		return "/admin/point/list";
	}

	// 어드민 회원포인트상세보기
	@RequestMapping(value = "/admin/point/view.do", method = RequestMethod.GET)
	public String view() {

		return "/admin/point/view";
	}

	// 어드민 회원포인트지급
	@RequestMapping(value = "/admin/point/pay.do", method = RequestMethod.GET)
	public String pay() {

		return "/admin/point/pay";
	}

}
