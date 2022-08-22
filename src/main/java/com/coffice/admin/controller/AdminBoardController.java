package com.coffice.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminBoardController {

	// 어드민 게시판리스트
	@RequestMapping(value = "/admin/board/list.do", method = RequestMethod.GET)
	public String list() {

		return "/admin/board/list";
	}

	// 어드민 게시판쓰기
	@RequestMapping(value = "/admin/board/write.do", method = RequestMethod.GET)
	public String write() {

		return "/admin/board/write";
	}

	// 어드민 게시판보기
	@RequestMapping(value = "/admin/board/view.do", method = RequestMethod.GET)
	public String view() {

		return "/admin/board/view";
	}

	// 어드민 게시판수정
	@RequestMapping(value = "/admin/board/edit.do", method = RequestMethod.GET)
	public String edit() {

		return "/admin/board/edit";
	}

	// 어드민 게시판삭제
	@RequestMapping(value = "/admin/board/delete.do", method = RequestMethod.GET)
	public String delete() {

		return "/admin/board/delete";
	}

}
