package com.coffice.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.admin.service.SubDAOlmpl;
import com.coffice.dto.SubscriptionDTO;

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
	
	
	//구독권 리스트
	@RequestMapping(value = "/admin/storeOwnerSub/subList.do", method = RequestMethod.GET)
	public String subList(Model model) {
		
		//만약 세션영역에 siteUserInfo속성이 없다면 로그아웃 상태이므로...
//		if(session.getAttribute("siteUserInfo")==null) {
//			
//			//로그인 완료후 진입을 위한 backUrl
//			model.addAttribute("backUrl", "/admin/storeOwnerSub/subList.do");
//			//로그인 페이지로 이동한다. 
//			return "redirect:/member/login.do";
//		}
		
		ArrayList<SubscriptionDTO> lists = sqlSession.getMapper(SubDAOlmpl.class).listSub();
		
//		DecimalFormat df = new DecimalFormat("###,###");
		
//		for (SubscriptionDTO dto : lists) {
//			String price = df.format(dto.getSub_price());
//			dto.setSub_price(price);
//		}
		
		model.addAttribute("lists", lists);
		
		return "/admin/storeOwnerSub/subList";
	}
	
	//구독권 보기
	@RequestMapping(value = "/admin/storeOwnerSub/viewSub.do", method = RequestMethod.GET)
	public String viewSub(HttpServletRequest req, Model model) {
		
		SubscriptionDTO dto = sqlSession.getMapper(SubDAOlmpl.class)
				.viewSub(Integer.parseInt(req.getParameter("sub_idx")));
		
		model.addAttribute("dto", dto);
		
		return "/admin/storeOwnerSub/subModify";
	}
	
	
	//구독권 수정
	@RequestMapping(value = "/admin/storeOwnerSub/modifySub.do", method = RequestMethod.GET)
	public String modifySub(HttpServletRequest req, Model model) {
		
		int result = sqlSession.getMapper(SubDAOlmpl.class)
				.modifySub(
					req.getParameter("subName"),
					Integer.parseInt(req.getParameter("subPrice")),
					Integer.parseInt(req.getParameter("subCoffeeNum")),
					Integer.parseInt(req.getParameter("subIdx"))
					);
		
		System.out.println("수정한 행=" + result);
		
		return "redirect:subList.do";
	}
	
	//구독권 삭제
	@RequestMapping(value = "/admin/storeOwnerSub/deleteSub.do", method = RequestMethod.GET)
	public String deleteSub(HttpServletRequest req, Model model) {
		
		int result = sqlSession.getMapper(SubDAOlmpl.class)
				.deleteSub(Integer.parseInt(req.getParameter("sub_idx")));
		
		System.out.println("삭제한 행=" + result);
		
		return "redirect:subList.do";
	}
	
	
	//구독권 추가페이지
	@RequestMapping(value = "/admin/storeOwnerSub/subAdd.do", method = RequestMethod.GET)
	public String subAdd(HttpServletRequest req, Model model) {

		//만약 세션영역에 siteUserInfo속성이 없다면 로그아웃 상태이므로...
//		if(session.getAttribute("siteUserInfo")==null) {
//			
//			//로그인 완료후 진입을 위한 backUrl
//			model.addAttribute("backUrl", "/admin/storeOwnerSub/subList.do");
//			//로그인 페이지로 이동한다. 
//			return "redirect:/member/login.do";
//		}
		
		
		return "/admin/storeOwnerSub/subAdd";
	}
	
	//구독권 추가
	@RequestMapping(value = "/admin/storeOwnerSub/subAddAction.do", method = RequestMethod.POST)
	public String subAddAction(HttpServletRequest req, SubscriptionDTO subscriptionDTO) {
		
		String sub_name = req.getParameter("subName");
		int sub_price = Integer.parseInt(req.getParameter("subPrice"));
		int sub_coffee_num = Integer.parseInt(req.getParameter("subCoffeeNum"));
		
		
		int result = sqlSession.getMapper(SubDAOlmpl.class).addSub(sub_name, sub_price, sub_coffee_num);
		
		System.out.println("result=" + result);
		
		return "redirect:subList.do";
	}

}
