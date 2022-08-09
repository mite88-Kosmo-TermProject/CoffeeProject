package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class reviewDTO {

	private String review_idx;
	
	private String review_content;
	
	private Date review_postdate;
	
	private storeDTO storeDTO;
	
	private memberDTO memberDTO;
	
	private String review_star;
	
	private String review_img;
}