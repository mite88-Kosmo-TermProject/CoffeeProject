package com.coffice.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.dto.StoresDTO;
import com.coffice.user.service.CafeImpl;


@Controller
public class CafeController {
	
	@Autowired
	private SqlSession sqlSession;
	private CafeImpl cafeImpl;
	StoresDTO dto = new StoresDTO();

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
	public  String info(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
		
		int store_idx = Integer.parseInt(req.getParameter("store_idx"));
		cafeImpl = sqlSession.getMapper(CafeImpl.class);
		 List<StoresDTO> resultList = cafeImpl.getCafeData(store_idx);
		 
		System.out.println("!!"+store_idx);

		model.addAttribute("resultList", resultList);
		return "/user/cafe/info";
	}
	

}
