package com.coffice.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import DTO.StoreDTO;
import service.ShopMemberImpl;

@Controller
public class AdminStoreOwnerMemberController {
	@Autowired
	SqlSession sqlSession;
	// 관리자 점주회원리스트
	@RequestMapping(value = "/admin/storeOwnerMember/list.do", method = RequestMethod.GET)
	public String storeOwnerMember_list() {

		return "/admin/storeOwnerMember/list";
	}

	/*
	 * // 관리자 점주회원보기
	 * 
	 * @RequestMapping(value = "/admin/getshoplist.do", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public JSONObject getShopList (HttpServletRequest req , Model
	 * model) { String afltd; JSONArray JsonLists = new JSONArray(); JSONObject data
	 * = new JSONObject(); String searchField = req.getParameter("searchField") ==
	 * "" ? "agree" : req.getParameter("searchField") ;
	 * System.out.println(searchField); ArrayList<com.coffice.dto.StoreDTO>
	 * storeList =
	 * sqlSession.getMapper(ShopMemberImpl.class).getshopLists(searchField);
	 * 
	 * for(com.coffice.dto.StoreDTO store : storeList) { JSONObject storeObj = new
	 * JSONObject(); JSONObject storeInfo = new JSONObject();
	 * storeInfo.put("storeNum", store.getStore_idx()); storeInfo.put("storeName",
	 * store.getStore_name()); storeObj.put("adress", store.getStore_address());
	 * if(store.getStore_afltd() == 0) afltd =
	 * Integer.toString(store.getStore_afltd()).replace("0", "허가안됨"); else afltd =
	 * Integer.toString(store.getStore_afltd()).replace("1", "허가됨");
	 * storeObj.put("agree", afltd); storeObj.put("ownerId", store.getMem_id());
	 * storeObj.put("ownerName", store.getStore_owner()); storeObj.put("storeInfo",
	 * storeInfo); JsonLists.add(storeObj);
	 * 
	 * } data.put("data", JsonLists);
	 * 
	 * data.toString();
	 * 
	 * 
	 * return data; }
	 */
	// 관리자 점주회원 승인여부
	@RequestMapping(value = "/admin/storeOwnerMember/ajax_check.do", method = RequestMethod.POST)
	@ResponseBody
	public void storeOwnerMember_ajax_check() {

		//return "/admin/storeOwnerMember/ajax_check.do";
	}
	
	
	
	//-----------------------------------------------------------
	
	// 관리자 구독관리 리스트
		@RequestMapping(value = "/admin/storeOwnerSub/list.do", method = RequestMethod.GET)
		public String storeOwnerSub_list() {

			return "/admin/storeOwnerSub/list";
		}

		// 관리자 구독관리 승인여부
		@RequestMapping(value = "/admin/storeOwnerMemberSub/ajax_Check.do", method = RequestMethod.POST)
		@ResponseBody
		public void storeOwnerSub_ajax_check() {

			//return "/admin/storeOwnerMember/ajax_check.do";
		}

}
