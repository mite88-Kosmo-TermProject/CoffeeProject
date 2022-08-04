package com.coffice.storeowner.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreownerReviewController {

	// 어드민 댓글신고리스트
	@RequestMapping(value = "/storeowner/report/list.do", method = RequestMethod.GET)
	public String list() {

		return "/storeowner/report/list";
	}

	// 어드민 댓글신고처리
	@RequestMapping(value = "/storeowner/report/ajax_check.do", method = RequestMethod.POST)
	@ResponseBody
	public void viewajax_checkw() {

		//return "/storeowner/member/view.do";
	}

}
