package com.coffice.user.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.coffice.dto.GetTokenVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Service
public class SchedulePayment {

	@Autowired
	private ImportPay pay;
	
	public String schedulePay(String customer_uid, String price, String merchant_uid) {
		String token = pay.getToken();
		String access_token = "";
		System.out.println("tokenReq======="+token);
		
		long timestamp = 0;
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MINUTE, +1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm", Locale.KOREA);
		String date = sdf.format(cal.getTime());
		try {
			Date stp = sdf.parse(date);
			timestamp = stp.getTime()/1000;
			System.out.println("timestamp="+timestamp);
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		
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
		
		 Gson str = new Gson(); 
		 RestTemplate restTemplate = new RestTemplate();
		 HttpHeaders headers = new HttpHeaders();
		 headers.setContentType(MediaType.APPLICATION_JSON);
		 headers.setBearerAuth(access_token);
		 
		 JsonObject jsonObject = new JsonObject();
		 jsonObject.addProperty("merchant_uid", merchant_uid);
		 jsonObject.addProperty("schedule_at", timestamp);
		 jsonObject.addProperty("currency ", "KRW");
		 jsonObject.addProperty("amount", price);
		 
		 JsonArray jsonArr = new JsonArray();
		 
		 jsonArr.add(jsonObject); 
		 JsonObject reqJson = new JsonObject();
		 
		 reqJson.addProperty("customer_uid", customer_uid); 
		 reqJson.add("schedules",jsonArr);
		 String json = str.toJson(reqJson); 
		 System.out.println("json"+json);
		 HttpEntity<String> entity = new HttpEntity<>(json, headers);
		 return restTemplate.postForObject("https://api.iamport.kr/subscribe/payments/schedule", entity, String.class);
		 
	}
}
