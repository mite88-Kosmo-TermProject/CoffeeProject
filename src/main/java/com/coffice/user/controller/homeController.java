package com.coffice.user.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.dto.storeDTO;
import com.coffice.user.service.HomeImpl;


@Controller
public class homeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		System.out.println("호출");
		ArrayList<storeDTO>mainCafeList = new ArrayList<storeDTO>();
		mainCafeList = sqlSession.getMapper(HomeImpl.class).getList();
		System.out.println(mainCafeList);
		model.addAttribute("mainCafeList",mainCafeList);
		return "home";
	}

}
