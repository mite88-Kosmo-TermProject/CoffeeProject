package com.coffice.admin.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.membership.MemberImpl;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.MemberDTO;

@Controller
public class AdminAllianceController {
	
	@Autowired
	private SqlSession sqlSession;

	// 점주신청페이지
	@RequestMapping(value = "/admin/alliance.do", method = RequestMethod.GET)
	public String alliance() {

		return "/admin/alliance";
	}
	
	//신청페이지 결과
	/*
	 * @RequestMapping(value = "/admin/alliance_Result.do", method =
	 * RequestMethod.POST) public String alliance_Result(MemberDTO memberDTO) {
	 * 
	 * 
	 * }
	 */
	
		
}
