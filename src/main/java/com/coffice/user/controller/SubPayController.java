package com.coffice.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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


	/*
	React를 통해 글쓰기를 처리하기 위한 메서드 추가. 앞에서 작성한 writeGet()과 요청명자체는 
	동일하지만 전송방식이 다르므로 각 요청방식에 따라 구분되어 호출된다.
	*/
	/*
	React에서 fetch() 함수를 통해 post방식으로 요청한 데이터를 받을때 
	body에 폼값을 실어서 서버로 보내게되므로 $RequestBody 어노테이션을 사용한다.
	 */
//	@RequestMapping(value="/order/insertSubscribe.do", method=RequestMethod.GET)
//	@ResponseBody
//	public Map<String, String> insertPost(@RequestBody String data, SubPayDTO subPayDTO) {
//		
//		//전송받은 데이터를 디코딩 처리한다.
//		System.out.println("insert 호출됨");
//		data = URLDecoder.decode(data);
//		System.out.println("data=" + data);
//		
//		//json-simple 의존설정 필요.
//		//JSON데이터를 서버에서 파싱하기 위해 json-simple 라이브러리를 의존설정한다.
//		//JSON파싱을 위한 객체
//		JSONParser jsonParser = new JSONParser();
//		//요청된 JSON데이터를 파싱한 후 JSON객체 저장용 참조변수
//		//--만약 JSON배열이라면 JSONArray로 선언하면 된다.
//		JSONObject jsonObj = null;
//		
//		try {
//			//앞에서 디코딩 처리한 데이터를 파싱한다.
//			jsonObj = (JSONObject) jsonParser.parse(data);
//		}
//		catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		
//		//로그를 통해 전송된 값 확인하기
//		System.out.println("멤버아이디=" + jsonObj.get("customer_id"));
//		System.out.println("아임포트 고유 결제번호=" + jsonObj.get("pay_import_key"));
//		System.out.println("가맹점에서 생성/관리하는 고유 주문번호=" + jsonObj.get("pay_idx"));
//		System.out.println("결제금액=" + jsonObj.get("pay_price"));
//		System.out.println("결제상태 옵션 값=" + jsonObj.get("pay_result_status"));
//		System.out.println("주문명=" + jsonObj.get("sub_idx"));
//		System.out.println("결제승인시각=" + jsonObj.get("pay_successed_at"));
//		
//		//전송된 값이 문제가 없다면 DTO객체에 저장한다.
//		subPayDTO.setCustomer_id(jsonObj.get("customer_id").toString());
//		subPayDTO.setPay_import_key(jsonObj.get("pay_import_key").toString());
//		subPayDTO.setPay_idx(jsonObj.get("pay_idx").toString());
//		subPayDTO.setPay_price(jsonObj.get("pay_price").toString());
//		subPayDTO.setPay_result_status(jsonObj.get("pay_result_status").toString());
//		subPayDTO.setSub_idx(jsonObj.get("sub_idx").toString());
//		subPayDTO.setPay_successed_at(jsonObj.get("pay_successed_at").toString());
//		
//		//Mapper를 호출해서 insert 처리한다.
//		int affected = sqlSession.getMapper(SubPaylmpl.class).insert(subPayDTO);
//		Map<String, String> map = new HashMap<String, String>();
//		
//		//처리된 결과에 따라 성공 혹은 실패를 출력한다.
//		if(affected == 1) 
//			map.put("result", "success");
//		else
//			map.put("result", "fail");
//		
//		return map;
//	}
//	
	@RequestMapping("/order/insertSubscribe.do")
	public String modifyAction(HttpSession session, SubPayDTO subPayDTO) {
		
		
		int applyRow = sqlSession.getMapper(SubPaylmpl.class).insert(subPayDTO);
		System.out.println("수정처리된 레코드수 :" + applyRow);
		
		return "redirect:subPayResult.do";
	}
	
	
	
	@RequestMapping(value = "/order/payment.do", method = RequestMethod.POST)
	@ResponseBody
	public void getImportToken(@RequestParam Map<String, Object> map)
			throws JsonMappingException, JsonProcessingException {
		int customer_uid = Integer.parseInt((String) map.get("customer_uid"));
		int price = Integer.parseInt((String) map.get("price"));

		scheduler.startScheduler(customer_uid, price);
	}
	
	// 패스구매완료
	@RequestMapping(value = "/order/subPayResult.do", method = RequestMethod.GET)
	public String subPayResult() {
		
		return "/user/order/subPayResult";
	}


}
