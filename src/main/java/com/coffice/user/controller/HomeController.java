package com.coffice.user.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.dto.*;
import com.coffice.user.service.HomeImpl;
import com.coffice.user.service.UserMemberImpl;


@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String home(Model model, StoresDTO storesDTO) {
		System.out.println("호출");
		ArrayList<StoresDTO>mainCafeList = new ArrayList<StoresDTO>();
		mainCafeList = sqlSession.getMapper(HomeImpl.class).getList();
		System.out.println(mainCafeList);
		model.addAttribute("mainCafeList",mainCafeList);
		
		return "home";
	}

}
