package com.coffice.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.dto.MemberDTO;
import com.coffice.dto.ParameterDTO;
import com.coffice.user.service.UserMemberImpl;


@Controller
public class MypageController {

	@Autowired
	private SqlSession sqlSession;
	// 마이페이지 메인
	@RequestMapping(value = "/mypage/main.do", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest req, HttpSession session) {
			
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setMem_id(req.getParameter("mem_id"));
		
	
		MemberDTO dto = sqlSession.getMapper(UserMemberImpl.class).view(parameterDTO);
		model.addAttribute("dto", dto);
		return "/user/mypage/main";
	}

	// 구독연장 /해지페이지
	@RequestMapping(value = "/mypage/subpay.do", method = RequestMethod.GET)
	public String subpay() {

		return "/user/mypage/subpay";
	}

}
