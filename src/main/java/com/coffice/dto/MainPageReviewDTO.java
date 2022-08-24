package com.coffice.dto;

import lombok.Data;

@Data
public class MainPageReviewDTO {

	private int store_idx;
	
	private String store_name;
	
	private String mem_id;
	
	private String img;
	
	private String content;
	
	private String star;
	
	private int like_hit;
}
