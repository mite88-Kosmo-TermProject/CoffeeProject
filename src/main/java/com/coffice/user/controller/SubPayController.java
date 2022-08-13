package com.coffice.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SubPayController {

	//Mybatis를 사용하기 위한 빈 자동주입
	@Autowired
	public SqlSession sqlSession;
	
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

	
//	@RequestMapping(value = "/insertPayCoupon.do")
//	@ResponseBody
//	public int pay(@RequestBody Payed_listVO pvo) {
//		System.out.println("pvo.getMerchant_uid : " + pvo.getMerchant_uid());
//		
//		int res = paySV.insert_pay(pvo);
//		
//		if(res == 1) {
//			Biz_memberVO bvo = memberSV.selectBizMember(pvo.getBiz_email());
//			
//			bvo.setPay_coupon(bvo.getPay_coupon()+5);
//			
//			System.out.println("paycoupon: " + bvo.getPay_coupon());
//			
//			res = paySV.updateBiz_pay(bvo);
//			
//			if(res == 1)
//				System.out.println("biz_member pay coupon insert complete");
//		}
//		
//		return res;
//	}
	
	// 패스구매완료
	@RequestMapping(value = "/order/subPayResult.do", method = RequestMethod.POST)
	public String subPayResult() {
		
		
		
		return "/user/order/subPayResult";
	}

//	@PostMapping("/payment1")
//	public @ResponseBody void getImportToken(@RequestParam Map<String, Object> map)
//			throws JsonMappingException, JsonProcessingException {
//		int customer_uid = Integer.parseInt((String) map.get("customer_uid"));
//		int price = Integer.parseInt((String) map.get("price"));
//		long merchant_uid =  Long.parseLong((String) map.get("merchant_uid"));
//
//		if(getPayementStatus.paymentStatus(merchant_uid).equals("paid")) {
//			scheduler.startScheduler(customer_uid,price);
//		}
//	}
	
	
//	@RequestMapping(value = "/coupon_cancel.do")
//	@ResponseBody
//	public String cancel(@RequestParam(value= "biz_email") String biz_email) {
//		System.out.println("biz_email = " + biz_email);
//		Payed_listVO pvo = paySV.recentlyPay(biz_email);
//					
//		PaymentCheck obj = new PaymentCheck();
//		String token = obj.getImportToken();
//		System.out.println("merchant_uid :" + pvo.getMerchant_uid());
//		int res = obj.cancelPayment(token, pvo.getMerchant_uid());
//		
//		if(res == 1) {
//			Biz_memberVO bvo = memberSV.selectBizMember(pvo.getBiz_email());
//			bvo.setPay_coupon(bvo.getPay_coupon()-5);
//			System.out.println("paycoupon: " + bvo.getPay_coupon());
//			res = paySV.updateBiz_refund(bvo);
//			if(res ==1) {
//				res = paySV.refund_pay(pvo.getMerchant_uid());
//				if(res ==1) { return "Success";}
//			}else {	return "biz_refund Failure"; }
//			return "thanks";
//		}
//		else 
//			return "anyway Failure"; 
//	}
//	
	
}
