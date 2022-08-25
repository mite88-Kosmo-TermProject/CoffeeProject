package com.coffice.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.MemberDTO;
import com.coffice.dto.MypageDTO;
import com.coffice.dto.MypagejjimDTO;
import com.coffice.dto.StoresDTO;
import com.coffice.user.service.UserMemberImpl;
import com.google.gson.JsonArray;

@Controller
public class MypageController {
	@Autowired
	SqlSession sqlSession;
	// 마이페이지 메인
	@RequestMapping(value = "/mypage/main.do", method = RequestMethod.GET)
	public String main() {

		return "/user/mypage/main";
	}
	
	//myPage 리뷰데이터출력 
		 @RequestMapping("/mypage/loadinfo.do")
		 @ResponseBody
		 public JSONArray loaduserinfo (HttpSession session ,Model model) {
			 JSONArray topArr= new JSONArray();
			 MemberDTO mem_info = (MemberDTO)session.getAttribute("siteUserInfo");
			 System.out.println("mem_info"+ mem_info);
			 ArrayList<MypageDTO> myinfo = sqlSession.getMapper(UserMemberImpl.class).loaduserinfo(mem_info.getMem_id());
			 System.out.println(myinfo);
			 for(MypageDTO dto : myinfo) {
				 JSONObject infoObj = new JSONObject();
				 JSONObject storeObj = new JSONObject();
				 infoObj.put("review_content",dto.getReview_content().replace("\n","").replace("\t", ""));
				 infoObj.put("review_postdate", dto.getReview_postdate().toString());
				 infoObj.put("review_star", dto.getReview_star());
				 infoObj.put("review_img", dto.getReview_img());
				 storeObj.put("store_name", dto.getStoresDTO().getStore_name());
				 infoObj.put("store_info", storeObj);
				 topArr.add(infoObj);
			 }
			 return topArr;
			 
		 }
	//MyPage 찜리스트데이터 출력
		 @RequestMapping("/mypage/loadjjiminfo.do")
		 @ResponseBody
		 public JSONArray loaduserjjim (HttpSession session) {
			 JSONArray jjimArr = new JSONArray();
			 MemberDTO mem_info = (MemberDTO)session.getAttribute("siteUserInfo");
			 ArrayList<MypagejjimDTO> jjimList = sqlSession.getMapper(UserMemberImpl.class).loadjjimlist(mem_info.getMem_id());
			 for(MypagejjimDTO dto : jjimList) {
				 JSONObject jjimObj = new JSONObject();
				 JSONObject storeObj = new JSONObject();
				 jjimObj.put("jjim_idx", dto.getJjim_idx());
				 jjimObj.put("jjim_postdate", dto.getJjim_postdate().toString());
				 storeObj.put("store_idx", dto.getStoresdto().getStore_idx());
				 storeObj.put("store_name", dto.getStoresdto().getStore_name());
				 storeObj.put("store_img", dto.getStoresdto().getStore_img());
				 jjimObj.put("store_info", storeObj);
				 jjimArr.add(jjimObj);
				 
			 }
			 System.out.println(jjimArr);
			 return jjimArr;
		 }
		 
		 

	// 구독연장 /해지페이지
	@RequestMapping(value = "/mypage/subpay.do", method = RequestMethod.GET)
	public String subpay() {

		
		return "/user/mypage/subpay";
	}

}
