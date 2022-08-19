package com.coffice.dto;

import lombok.Data;

@Data
public class GetTokenVO {

	private String Access_token;
	private long now;
	private long expired_at;
	
}
