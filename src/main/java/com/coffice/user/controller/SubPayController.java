package com.coffice.user.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.MemberDTO;
import com.coffice.dto.SubPayDTO;
import com.coffice.dto.SubscriptionDTO;
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
	@Autowired
	PaymentFind find;
	
	// 패스구매(로그인 상태에서만 이용가능)
	@RequestMapping(value = "/order/subPay.do", method = RequestMethod.GET)
	public String subPay(Model model, HttpSession session, HttpServletRequest req, MemberDTO memberDTO) {

		//만약 세션영역에 siteUserInfo속성이 없다면 로그아웃 상태이므로...
		if(session.getAttribute("siteUserInfo")==null) {
			
			//로그인 완료후 진입을 위한 backUrl
			model.addAttribute("backUrl", "/user/order/subPay");
			//로그인 페이지로 이동한다. 
			return "redirect:/member/login.do";
		}
		
		//회원정보 결제창에 가져오기
		memberDTO = sqlSession.getMapper(SubPaylmpl.class)
			.user(((MemberDTO)session.getAttribute("siteUserInfo")).getMem_id());
		
		ArrayList<SubscriptionDTO> lists = sqlSession.getMapper(SubPaylmpl.class).subList();
		
		model.addAttribute("lists", lists);
		model.addAttribute("dto", memberDTO);
		
		//로그인상태라면 패스구매페이지 진입
		return "/user/order/subPay";
	}

	//첫결제
	@RequestMapping(value = "/order/insertSubscribe.do", method = RequestMethod.POST)
	public void insertSubscribe(HttpSession session, SubPayDTO subPayDTO) {
		
		int row = sqlSession.getMapper(SubPaylmpl.class).paymentInfo(subPayDTO);
		System.out.println("입력된 구독수 = "+ row);
		
	}
	
//	tokenReq======={"code":0,"message":null,"response":
//	{"access_token":"b1f3e410ed1b1782782013172d4ae1e37c21eff2","now":1661292378,"expired_at":1661293996}}
//	timestamp=1661292420
//	getToken==>>b1f3e410ed1b1782782013172d4ae1e37c21eff2
//	json{"customer_uid":"admin","schedules":[{"merchant_uid":"merchant_1661292420","schedule_at":1661292420,
//		"currency ":"KRW","amount":"92500","name":"CoffeePass50잔"}]}
	
	//정기결제 예약
	@RequestMapping(value = "/order/payment.do", method = RequestMethod.POST)
	@ResponseBody
	public void payment(@RequestParam Map<String, Object> map)
			throws JsonMappingException, JsonProcessingException {
		String customer_uid = (String)map.get("customer_uid");
		String price = (String)map.get("price");
		String merchant_uid = (String)map.get("merchant_uid");
		String sub_name = (String)map.get("sub_name");
		scheduler.startScheduler(customer_uid, price, merchant_uid, sub_name);
	}
	
	//예약 중지
	@RequestMapping(value = "/order/subStop.do", method = RequestMethod.GET)
	public String subStop() {
		System.out.println("subStop()들어옴");
		scheduler.stopScheduler();
		System.out.println("예약 중지함");
		return "/user/order/subPayResult";
	}
	
	// 패스구매완료
	@RequestMapping(value = "/order/subPayResult.do", method = RequestMethod.GET)
	public String subPayResult() {
		
		return "/user/order/subPayResult";
	}
	
	//WebHook 으로 정기결제 정보받아서 저장
	@RequestMapping(value = "/order/subResult.do", method = RequestMethod.POST)
	public void subResult(@RequestBody JSONObject jsonObject, Model model, SubPayDTO subPayDTO) {
		
		System.out.println("jsonObject.get()="+ jsonObject.get("imp_uid"));
		String imp_uid = jsonObject.get("imp_uid").toString();
		
		String json = find.paymentFind(imp_uid);
		
//		 {"code":0,"message":null,
//		"response": 
//		{
//		"amount":22000,
//		"customer_uid":"admin",
//		"customer_uid_usage":"payment.scheduled",
//		"imp_uid":"imps_426515090382",
//		"merchant_uid":"merchant_1661284500",
//		"name":"admin \uace0\uac1d\uc5d0 \ub300\ud55c 2022-08-24 04:55:00 \uc608\uc57d \uacb0\uc81c",
//		"paid_at":1661284515,
//		"pay_method":"point",
//		"pg_id":"TCSUBSCRIP",
//		"pg_provider":"kakaopay",
//		"pg_tid":"T30530a30f5619158d9f"
//		"started_at":1661284515,
		
		JSONParser jsonParser = new JSONParser();
		
		JSONObject jsonObj = null;
		
		try {
			jsonObj = (JSONObject) jsonParser.parse(json);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject resultJson = (JSONObject) jsonObj.get("response");
		
		subPayDTO.setPay_idx(resultJson.get("merchant_uid").toString());
		subPayDTO.setMem_id(resultJson.get("customer_uid").toString());
		subPayDTO.setPay_import_key(resultJson.get("imp_uid").toString());
		subPayDTO.setPay_price(resultJson.get("amount").toString());
		subPayDTO.setPay_result_status(resultJson.get("status").toString());
		subPayDTO.setSub_name(resultJson.get("name").toString());
		subPayDTO.setPay_successed_at(resultJson.get("paid_at").toString());
		subPayDTO.setPay_case(resultJson.get("pg_provider").toString());
		
		int result = sqlSession.getMapper(SubPaylmpl.class).paymentInfo(subPayDTO);
		
		System.out.println("정기구독 입력수 = "+ result);
	}
}
