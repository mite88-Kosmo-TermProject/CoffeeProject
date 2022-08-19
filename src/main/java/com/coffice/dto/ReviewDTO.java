package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {

	private int review_idx;
	
	private String review_content;
	
	private Date review_postdate;
	
	private StoresDTO storesDTO;
	
	private MemberDTO memberDTO;
	
	private String review_star;
	
	private String review_img;
	
	private String store_idx;
	
	private String mem_id;
}