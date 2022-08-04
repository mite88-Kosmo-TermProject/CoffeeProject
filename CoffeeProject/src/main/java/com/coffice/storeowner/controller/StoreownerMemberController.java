package com.coffice.storeowner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreownerMemberController {
	// 점주관리자 회원리스트
		@RequestMapping(value = "/storeowner/member/list.do", method = RequestMethod.GET)
		public String list() {

			return "/storeowner/member/list";
		}

		// 점주관리자 회원보기
		@RequestMapping(value = "/storeowner/member/view.do", method = RequestMethod.GET)
		public String view() {

			return "/storeowner/member/view";
		}

		// 점주관리자 회원수정
		@RequestMapping(value = "/storeowner/member/modify.do", method = RequestMethod.GET)
		public String modify() {

			return "/storeowner/member/modify.do";
		}

		// 점주관리자 회원삭제
		@RequestMapping(value = "/storeowner/member/delete.do", method = RequestMethod.GET)
		public String delete() {

			return "/storeowner/member/delete.do";
		}

}
