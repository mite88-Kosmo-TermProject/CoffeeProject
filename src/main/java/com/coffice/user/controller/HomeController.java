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


@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<StoresDTO>mainCafeList = new ArrayList<StoresDTO>();
		mainCafeList = sqlSession.getMapper(HomeImpl.class).getList();
		model.addAttribute("mainCafeList",mainCafeList);
//		System.out.println("메인카페리스트"+mainCafeList);
		ArrayList<ReviewDTO> mainPageReview = new ArrayList<>();
		mainPageReview = sqlSession.getMapper(HomeImpl.class).mainpage_review();
		
//		System.out.println(mainPageReview);
		
		ArrayList<Object> review_list = new ArrayList<>();
		for(ReviewDTO dto : mainPageReview) {
			MainPageReviewDTO mainPageReviewDTO = new MainPageReviewDTO();
			int index = dto.getImageDTO().getImage_save().lastIndexOf("/");
			String img = dto.getImageDTO().getImage_save().substring(0,index);
			mainPageReviewDTO.setContent(dto.getReview_content().replace("\r\n", "<br/>"));
			mainPageReviewDTO.setImg(img);
			mainPageReviewDTO.setLike_hit(dto.getLike_hit());
			mainPageReviewDTO.setMem_id(dto.getMem_id());
			mainPageReviewDTO.setStar(dto.getReview_star());
			mainPageReviewDTO.setStore_idx(dto.getStoresDTO().getStore_idx());
			mainPageReviewDTO.setStore_name(dto.getStoresDTO().getStore_name());
			
			review_list.add(mainPageReviewDTO);
		}
		model.addAttribute("review_list",review_list);
		return "home";
	}

}
