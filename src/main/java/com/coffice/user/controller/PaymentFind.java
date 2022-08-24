package com.coffice.user.controller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class PaymentFind {

	@Autowired
	private ImportPay pay;
	
	public String paymentFind(String imp_uid) {
		String token = pay.getToken();
		String access_token = "";
		System.out.println("tokenReq======="+token);
		
		JSONParser jsonParser = new JSONParser();
		
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) jsonParser.parse(token);
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}

		if((Long)jsonObj.get("code")  == 0){

			JSONObject getToken = (JSONObject) jsonObj.get("response");

			System.out.println("getToken==>>"+getToken.get("access_token") );

			access_token = (String)getToken.get("access_token");

		}
		
		RestTemplate restTemplate = new RestTemplate();
		 
		String url = "https://api.iamport.kr/payments/"+imp_uid+"?_token="+access_token;

		String json = restTemplate.getForObject(url, String.class);
		 
		return json;
		 
//		 {"code":0,"message":null,"response":
//		 {"amount":22000,
//		"customer_uid":"admin",
//		"customer_uid_usage":"payment.scheduled",
//		"imp_uid":"imps_426515090382",
//			 "merchant_uid":"merchant_1661284500",
//		"name":"admin \uace0\uac1d\uc5d0 \ub300\ud55c 2022-08-24 04:55:00 \uc608\uc57d \uacb0\uc81c",
//			 "paid_at":1661284515,
//		"pay_method":"point",
//		"pg_id":"TCSUBSCRIP",
//		"pg_provider":"kakaopay",
//		"pg_tid":"T30530a30f5619158d9f"
//			 "started_at":1661284515,
//		
//		
//		"apply_num":null,"bank_code":null,"bank_name":null,"buyer_addr":null,"buyer_email":null,
//			 "buyer_name":null,"buyer_postcode":null,"buyer_tel":null,"cancel_amount":0,"cancel_history":[],
//			 "cancel_reason":null,"cancel_receipt_urls":[],"cancelled_at":0,"card_code":null,"card_name":null,
//			 "card_number":null,"card_quota":0,"card_type":null,"cash_receipt_issued":false,"channel":"api",
//			 "currency":"KRW","custom_data":null,
//			 "emb_pg_provider":null,"escrow":false,"fail_reason":null,"failed_at":0,
//			 ,"receipt_url":"https:\/\/mockup-pg-web.kakao.com\/v1\/confirmation\/p\/T30530a30f5619158d9f\/0654076a9607ac61b55de2e6ba8a5f54eff3779b09b1d9a854e2f930a412c59c",
//			"status":"paid",
//			"user_agent":null,"vbank_code":null,"vbank_date":0,"vbank_holder":null,
//			 "vbank_issued_at":0,"vbank_name":null,"vbank_num":null}}
		 

	}
}
