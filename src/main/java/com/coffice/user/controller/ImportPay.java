package com.coffice.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

@Component
public class ImportPay {
	
	public String getToken() {
			
		RestTemplate restTemplate = new RestTemplate();
	
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("imp_key", "6830327705823154");
	    map.put("imp_secret", "3MK5ZkkAl4POqZUqodVcxB8cskrg2ElwYtyRkjGo0A5EbCL3pRyD1ppXxjkKHNXmbXGrhwPLkQZrOfOM");
	    
	    Gson var = new Gson();
	    String json= var.toJson(map);
	    
		//서버로 요청할 Body
	    HttpEntity<String> entity = new HttpEntity<>(json,headers);
	    
		return restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, String.class);
	}
}
