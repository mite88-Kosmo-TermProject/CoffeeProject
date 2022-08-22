package com.coffice.admin.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Case;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.admin.service.MemberDAOImpl;
import com.coffice.admin.service.ShopMemberImpl;
import com.coffice.dto.MemberDTO;
import com.coffice.dto.StoresDTO;
import com.coffice.user.service.UserMemberImpl;

import common.TESTImpl;

@Controller
public class AdminStoreOwnerMemberController {
	@Autowired
	SqlSession sqlSession;

	// 관리자 점주회원리스트
	@RequestMapping(value = "/admin/storeOwnerMember/list.do", method = RequestMethod.GET)
	public String storeOwnerMember_list() {

		return "/admin/storeOwnerMember/list";
	}

	// 관리자 점주회원보기

	@RequestMapping(value = "/admin/getshoplist.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getShopList(HttpServletRequest req, Model model) throws Exception {
		String afltd;
		JSONArray JsonLists = new JSONArray();
		JSONObject data = new JSONObject();
		ArrayList<StoresDTO> storeList = sqlSession.getMapper(ShopMemberImpl.class).getshopLists();

		for (StoresDTO store : storeList) {
			JSONObject storeObj = new JSONObject();
			// JSONObject storeInfo = new JSONObject();
			// System.out.println("StoresDTO:"+store.getStore_name());
			storeObj.put("storeNum", store.getStore_idx());
			storeObj.put("storeName", store.getStore_name());
			storeObj.put("adress", store.getStore_roadaddr());
			if (store.getStore_afltd() == 0)
				afltd = Integer.toString(store.getStore_afltd()).replace("0", "비제휴");
			else if (store.getStore_afltd() == 1)
				afltd = Integer.toString(store.getStore_afltd()).replace("1", "제휴완료");
			else
				afltd = Integer.toString(store.getStore_afltd()).replace("2", "제휴신청중");
			storeObj.put("agree", afltd);
			storeObj.put("ownerId", store.getMem_id());
			storeObj.put("ownerName", store.getStore_owner());
			JsonLists.add(storeObj);

		}
		data.put("data", JsonLists);

		data.toString();

		return data;
	}

	// 관리자 점주회원 승인여부

	@RequestMapping(value = "/admin/storeOwnerMember/ajax_check.do", method = RequestMethod.POST)
	@ResponseBody
	public void storeOwnerMember_ajax_check(HttpServletRequest req, Model model) {
		int data_case = Integer.valueOf(req.getParameter("case"));//가게 존재여부 유형
		
		
		String store_name = String.valueOf(req.getParameter("store_name"));
		String mem_id = String.valueOf(req.getParameter("mem_id"));
		String store_owner = String.valueOf(req.getParameter("store_owner"));
		
		// 제휴 승인 및 회원레벨 변경
		if(data_case ==1) {
			//가게 비존재시 추가
			int store_idx = Integer.valueOf(req.getParameter("store_idx"));
			sqlSession.getMapper(ShopMemberImpl.class).update_Agree(mem_id, store_owner, store_idx);
			sqlSession.getMapper(ShopMemberImpl.class).update_User(mem_id);
			
		}
		else if(data_case ==2) {
			//가게 비존재시 추가
			System.out.println("data2:"+store_name+"/"+mem_id+"/"+store_owner);
			
			sqlSession.getMapper(ShopMemberImpl.class).Insert_Stores(store_name, mem_id, store_owner);
			
			//가게 검색
			StoresDTO dto = sqlSession.getMapper(ShopMemberImpl.class).check_Storename(store_name, mem_id);
			
			//추가
			sqlSession.getMapper(ShopMemberImpl.class).update_Agree(mem_id, store_owner, dto.getStore_idx());
			sqlSession.getMapper(ShopMemberImpl.class).update_User(mem_id);
			
		}


		// return "/admin/storeOwnerMember/ajax_check.do";
	}

	// ------------------------------------------------------------------------------------------------------------

	// 관리자 제휴리스트
	@RequestMapping(value = "/admin/allianceMember_list/list.do", method = RequestMethod.GET)
	public String allianceMember_list() {

		return "/admin/allianceMember_list/list";
	}

	// 관리자 제휴전 회원보기

	@RequestMapping(value = "/admin/getAlliancelist.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getAlliancelist(HttpServletRequest req, Model model) throws Exception {
		JSONArray JsonLists = new JSONArray();
		JSONObject data = new JSONObject();
		ArrayList<MemberDTO> MemberList = sqlSession.getMapper(MemberDAOImpl.class).Alliancelist();
		
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		for (MemberDTO member : MemberList) {
			JSONObject storeObj = new JSONObject();
			// JSONObject storeInfo = new JSONObject();
			// System.out.println("StoresDTO:"+store.getStore_name());
			storeObj.put("mem_id", member.getMem_id());
			storeObj.put("mem_name", member.getMem_name());
			storeObj.put("mem_email", member.getMem_email());
			storeObj.put("mem_gender", member.getMem_gender());
			storeObj.put("mem_redidate", dateFormat.format(member.getMem_regidate()));
			JsonLists.add(storeObj);

		}
		data.put("data", JsonLists);

		data.toString();

		return data;
	}

	// 가게 중복 검사(AJAX)
	@RequestMapping("/admin/store/nameCheck.do")
	@ResponseBody
	public JSONObject nameCheck(HttpServletResponse resp) throws Exception {
		JSONArray JsonLists = new JSONArray();
		JSONObject data = new JSONObject();
		// ArrayList<StoresDTO> storeList =
		// sqlSession.getMapper(ShopMemberImpl.class).check_name(store_name);
		ArrayList<StoresDTO> storeList = sqlSession.getMapper(ShopMemberImpl.class).getshopLists();

		for (StoresDTO store : storeList) {
			JSONObject storeObj = new JSONObject();
			// JSONObject storeInfo = new JSONObject();
			// System.out.println("StoresDTO:"+store.getStore_name());
			storeObj.put("mem_id", store.getMem_id());
			storeObj.put("store_idx", store.getStore_idx());
			storeObj.put("store_owner", store.getStore_owner());
			storeObj.put("store_name", store.getStore_name());
			JsonLists.add(storeObj);

		}
		data.put("data", JsonLists);

		data.toString();

		return data;
	}

	// -----------------------------------------------------------

	// 관리자 구독관리 리스트
	@RequestMapping(value = "/admin/storeOwnerSub/list.do", method = RequestMethod.GET)
	public String storeOwnerSub_list() {

		return "/admin/storeOwnerSub/list";
	}

}
