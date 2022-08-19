package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {

	private String review_idx;
	private String review_content;
	private Date review_postdate;
	private String store_idx;
	private String mem_id;
	private int review_star;
	private String review_img;
	
	private StoresDTO storesDTO;
	
	private MemberDTO memberDTO;

}