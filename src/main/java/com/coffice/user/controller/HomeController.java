package com.coffice.user.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.*;
import com.coffice.user.service.HomeImpl;
import com.coffice.user.service.UserMemberImpl;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;


@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String home(Model model, StoresDTO storesDTO) {
		System.out.println("호출");
		JSONArray storeArr = new JSONArray();
		ArrayList<StoresDTO>mainCafeList = new ArrayList<StoresDTO>();
		mainCafeList = sqlSession.getMapper(HomeImpl.class).getList();
		
//		ArrayList<Object> mainstore = new ArrayList<>();
//		for(StoresDTO sl : mainCafeList) {
//			String str = sl.getStore_img();
//			List<String> list = Arrays.asList(str.split("/"));
//			list.toArray();
//			
//			MainPageStoreDTO mainpagestoreDTO = new MainPageStoreDTO();
////			int idx = sl.getStore_img().indexOf("/");
////			if(idx!=-1) {
////				
////				System.out.println("idx "+idx);
////				String storeimg = sl.getStore_img().substring(0, idx);
////				sl.setStore_img(storeimg);
////				
////					
////			}
//			System.out.println(list);
//			mainpagestoreDTO.setImg(list);
//			//mainpagestoreDTO.setStore_img(sl.getStore_img());
//			mainpagestoreDTO.setJjim_hit(sl.getJjim_hit());
//			mainpagestoreDTO.setMem_id(sl.getMem_id());
//			mainpagestoreDTO.setStore_idx(sl.getStore_idx());
//			mainpagestoreDTO.setStore_name(sl.getStore_name());
//			mainpagestoreDTO.setStore_localaddr(sl.getStore_localaddr());
//			
//			
//			mainstore.add(mainpagestoreDTO);
//			 
//		}
		//System.out.println("mainstore : "+mainstore);
		//System.out.println("이미지 이름 찾기 : "+storesDTO.getStore_img());
		
		//System.out.println("mainCafeList:"+mainCafeList);
		
//		model.addAttribute("mainCafeList",mainstore);
		model.addAttribute("mainCafeList", mainCafeList);
		
		
		
		return "home";
	}
	

}
