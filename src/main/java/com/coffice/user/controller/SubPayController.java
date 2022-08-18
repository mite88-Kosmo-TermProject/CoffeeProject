package com.coffice.user.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.SubPayDTO;
import com.coffice.user.service.SubPaylmpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;


@Controller
public class SubPayController {

	//Mybatis를 사용하기 위한 빈 자동주입
	@Autowired
	public SqlSession sqlSession;
	@Autowired
	public ReqPaymentScheduler scheduler;
	
	
	// 패스구매(로그인 상태에서만 이용가능)
	@RequestMapping(value = "/order/subPay.do", method = RequestMethod.GET)
	public String subPay(Model model, HttpSession session, HttpServletRequest req) {

		//만약 세션영역에 siteUserInfo속성이 없다면 로그아웃 상태이므로...
//		if(session.getAttribute("siteUserInfo")==null) {
//			
//			//로그인 완료후 진입을 위한 backUrl
//			model.addAttribute("backUrl", "/user/order/subPay");
//			//로그인 페이지로 이동한다. 
//			return "redirect:/member/login.do";
//		}
		
		//로그인상태라면 패스구매페이지 진입
		return "/user/order/subPay";
	}


	@RequestMapping(value = "/order/insertSubscribe.do", method = RequestMethod.POST)
	public String modifyAction(HttpSession session, SubPayDTO subPayDTO) {
		
		
		int applyRow = sqlSession.getMapper(SubPaylmpl.class).insert(subPayDTO);
		System.out.println("수정처리된 레코드수 :" + applyRow);
		
		return "redirect:subPayResult.do";
	}
	
	
	
	@RequestMapping(value = "/order/payment.do", method = RequestMethod.POST)
	@ResponseBody
	public void getImportToken(@RequestParam Map<String, Object> map)
			throws JsonMappingException, JsonProcessingException {
		String customer_uid = (String)map.get("customer_uid");
		String price = (String)map.get("price");
		String merchant_uid = (String)map.get("merchant_uid");
		scheduler.startScheduler(customer_uid, price, merchant_uid);
	}
	
	// 패스구매완료
	@RequestMapping(value = "/order/subPayResult.do", method = RequestMethod.GET)
	public String subPayResult() {
		
		return "/user/order/subPayResult";
	}

}
