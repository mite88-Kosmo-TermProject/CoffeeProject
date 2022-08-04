package com.coffice.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminStoreOwnerMemberController {

	// 관리자 점주회원리스트
	@RequestMapping(value = "/admin/storeOwnerMember/list.do", method = RequestMethod.GET)
	public String storeOwnerMember_list() {

		return "/admin/storeOwnerMember/list";
	}

	// 관리자 점주회원보기
	@RequestMapping(value = "/admin/storeOwnerMember/view.do", method = RequestMethod.GET)
	public String storeOwnerMember_view() {

		return "/admin/storeOwnerMember/view";
	}

	// 관리자 점주회원 승인여부
	@RequestMapping(value = "/admin/storeOwnerMember/ajax_check.do", method = RequestMethod.POST)
	@ResponseBody
	public void storeOwnerMember_ajax_check() {

		//return "/admin/storeOwnerMember/ajax_check.do";
	}
	
	
	
	//-----------------------------------------------------------
	
	// 관리자 구독관리 리스트
		@RequestMapping(value = "/admin/storeOwnerSub/list.do", method = RequestMethod.GET)
		public String storeOwnerSub_list() {

			return "/admin/storeOwnerSub/list";
		}

		// 관리자 구독관리 승인여부
		@RequestMapping(value = "/admin/storeOwnerMemberSub/ajax_Check.do", method = RequestMethod.POST)
		@ResponseBody
		public void storeOwnerSub_ajax_check() {

			//return "/admin/storeOwnerMember/ajax_check.do";
		}

}
