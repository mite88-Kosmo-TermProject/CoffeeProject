package com.coffice.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class CafeController {

	//지도검색
	@RequestMapping(value = "/cafe/map.do", method = RequestMethod.GET)
	public String map() {
	

		return "/user/cafe/map";
	}
	
	//일반검색
	@RequestMapping(value = "/cafe/list.do", method = RequestMethod.GET)
	public String list() {
	

		return "/user/cafe/list";
	}
	
	//카페상세
	@RequestMapping(value = "/cafe/info.do", method = RequestMethod.GET)
	public String info() {
	

		return "/user/cafe/info";
	}
	

}
