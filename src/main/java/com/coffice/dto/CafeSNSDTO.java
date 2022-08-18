package com.coffice.dto;

import lombok.Data;

@Data
public class CafeSNSDTO {
	
	private int review_idx; //리뷰 일련번호
	
	private User_infoDTO user_infoDTO; //유저정보 
	
	private StoresDTO storesDTO; //카페정보
	
	private String content; //리뷰내용
	
	private int start_point; //별점
	
	private String review_img; //리뷰 이미지
	
}