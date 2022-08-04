package com.coffice.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	// 공지, 이벤트게시판 리스트
	@RequestMapping(value = "/community/boardList.do", method = RequestMethod.GET)
	public String boardList() {

		return "/user/community/boardList";
	}

	// 공지, 이벤트게시판 상세
	@RequestMapping(value = "/community/boardView.do", method = RequestMethod.GET)
	public String boardView() {

		return "/user/community/boardView";
	}

}
