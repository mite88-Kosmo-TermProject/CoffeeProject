package com.coffice.dto;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class ReviewDTO {

	private int review_idx;
	
	private String review_content;
	
	private Date review_postdate;
	
	private StoresDTO storesDTO;
	
	private MemberDTO memberDTO;
	
	private ImageDTO imageDTO;
	
	private ArrayList<HeartDTO> hearts = new ArrayList<>();
	
	private String review_star;
	
	private String review_img;
	
	private String store_idx;
	
	private String mem_id;
	
	private int like_hit;

}