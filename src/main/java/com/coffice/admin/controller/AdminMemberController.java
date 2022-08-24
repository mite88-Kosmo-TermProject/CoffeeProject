package com.coffice.admin.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.admin.service.MemberDAOImpl;
import com.coffice.dto.MemberDTO;

@Controller
public class AdminMemberController {

	@Autowired
	private SqlSession sqlSession;
	// 어드민 회원리스트
	@RequestMapping(value = "/admin/member/list.do", method = RequestMethod.GET)
	public String list(Model model) {
		
		
		return "/admin/member/list";
	}
	

	// 어드민 회원보기
	@RequestMapping(value = "/admin/member/view.do", method = RequestMethod.GET)
	public String view() {

		return "/admin/member/view";
	}

	// 어드민 회원수정
	@RequestMapping(value = "/admin/member/modify.do", method = RequestMethod.GET)
	public String modify() {

		return "/admin/member/modify.do";
	}

	// 어드민 회원삭제
	@RequestMapping(value = "/admin/member/delete.do", method = RequestMethod.GET)
	public String delete() {

		return "/admin/member/delete.do";
	}
	
	

}
