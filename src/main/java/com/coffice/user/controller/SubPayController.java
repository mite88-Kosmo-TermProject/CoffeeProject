package com.coffice.user.controller;

import java.net.URLDecoder;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.SubPayDTO;
import com.coffice.user.service.SubPaylmpl;


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
	
	

	/*
	React를 통해 글쓰기를 처리하기 위한 메서드 추가. 앞에서 작성한 writeGet()과 요청명자체는 
	동일하지만 전송방식이 다르므로 각 요청방식에 따라 구분되어 호출된다.
	*/
	@RequestMapping(value="/order/insertSubscribe.do", method=RequestMethod.POST)
	@ResponseBody
	/*
	React에서 fetch() 함수를 통해 post방식으로 요청한 데이터를 받을때 
	body에 폼값을 실어서 서버로 보내게되므로 $RequestBody 어노테이션을 사용한다.
	*/
	public Map<String, String> writePost(@RequestBody String data, SubPayDTO subPayDTO) {
		
		//전송받은 데이터를 디코딩 처리한다.
		System.out.println("write 호출됨");
		data = URLDecoder.decode(data);
		System.out.println("data=" + data);
		
		//json-simple 의존설정 필요.
		//JSON데이터를 서버에서 파싱하기 위해 json-simple 라이브러리를 의존설정한다.
		//JSON파싱을 위한 객체
		JSONParser jsonParser = new JSONParser();
		//요청된 JSON데이터를 파싱한 후 JSON객체 저장용 참조변수
		//--만약 JSON배열이라면 JSONArray로 선언하면 된다.
		JSONObject jsonObj = null;
		
		try {
			//앞에서 디코딩 처리한 데이터를 파싱한다.
			jsonObj = (JSONObject) jsonParser.parse(data);
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		
		//로그를 통해 전송된 값 확인하기
		System.out.println("아이디=" + jsonObj.get("mem_id"));
		System.out.println("제목=" + jsonObj.get("pay_import_key"));
		System.out.println("내용=" + jsonObj.get("pay_idx"));
		System.out.println("내용=" + jsonObj.get("pay_price"));
		
		//전송된 값이 문제가 없다면 DTO객체에 저장한다.
//		subPayDTO.setId(jsonObj.get("id").toString());
//		subPayDTO.setTitle(jsonObj.get("title").toString());
//		subPayDTO.setContent(jsonObj.get("content").toString());
		
		//Mapper를 호출해서 insert 처리한다.
//		int affected = sqlSession.getMapper(SubPaylmpl.class).write(subPayDTO);
		Map<String, String> map = new HashMap<String, String>();
		
		//처리된 결과에 따라 성공 혹은 실패를 출력한다.
//		if(affected == 1) 
//			map.put("result", "success");
//		else
//			map.put("result", "fail");
		
		return map;
	}
	
	
//	@RequestMapping(value = "/order/insertSubscribe.do")
//	@ResponseBody
//	public int pay(SubPayDTO dto) {
//		System.out.println("dto.getMerchant_uid : " + dto.getMerchant_uid());
//		
//		int res = paySV.insert_pay(dto);
//		
//		if(res == 1) {
//			Biz_memberVO bvo = memberSV.selectBizMember(dto.getBiz_email());
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
//	
	
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
