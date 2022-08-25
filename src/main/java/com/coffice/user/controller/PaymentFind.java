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
		 
	}
}
