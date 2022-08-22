package com.coffice.admin.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.admin.service.MemberDAOImpl;
import com.coffice.dto.MemberDTO;
import com.coffice.user.service.UserMemberImpl;

@Controller
public class AdminAllianceController {

	@Autowired
	private SqlSession sqlSession;

	// 점주신청페이지
	@RequestMapping(value = "/admin/alliance.do", method = RequestMethod.GET)
	public String alliance() {

		return "/admin/alliance";
	}

	// 신청페이지 결과
	@RequestMapping(value = "/admin/alliance_Result.do", method = RequestMethod.POST)
	public String alliance_Result(MemberDTO memberDTO) {
			
			System.out.println("dto:"+memberDTO.getMem_id());
			System.out.println("dto:"+memberDTO.getMem_pw());
			System.out.println("dto:"+memberDTO.getMem_name());
			System.out.println("dto:"+memberDTO.getMem_email());
			System.out.println("dto:"+memberDTO.getMem_phone());
			System.out.println("dto:"+memberDTO.getMem_gender());
			
			int result = sqlSession.getMapper(MemberDAOImpl.class).join(memberDTO);
			
			System.out.println("입력결과:"+result);
			return "redirect:/admin/main.do";

	}

}
