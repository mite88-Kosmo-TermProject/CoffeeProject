package com.coffice.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminChttController {

	// 어드민 채팅리스트
	@RequestMapping(value = "/admin/chtt/list.do", method = RequestMethod.GET)
	public String list() {

		return "/admin/chtt/list";
	}
	
	
	@RequestMapping(value = "/admin/chat", method = { RequestMethod.GET })
	public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "/admin/chtt/chat";
	}

	/*
	 * // 어드민 채팅하기
	 * 
	 * @RequestMapping(value = "/admin/chtt/EchoServer.do", method =
	 * RequestMethod.POST) public String EchoServer() {
	 * 
	 * return "/admin/chtt/EchoServer"; }
	 */

}