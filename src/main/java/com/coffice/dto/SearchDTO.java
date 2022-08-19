package com.coffice.dto;

import lombok.Data;

@Data
public class SearchDTO {
	
	//스토어 테이블 컬럼
	private String store_idx;
	private String mem_id;
	private String store_name;
	private String store_owner;
	private String store_phone;
	private String store_item;
	private String store_sigungu;
	private String store_dong;
	private String store_localaddr;
	private String store_roadaddr;
	private String store_floor;
	private double store_longitude;
	private double store_latitude;
	private String store_notice;
	private String store_menu;
	private String store_star;
	private String store_afltd;
	private String store_img;
	private String store_time;
	
	//태그테이블 컬럼
	private String store_tag;
	
	//검색어 처리를 위한 멤버변수
	private String searchField;//검색할 필드명
	private String searchTxt;//검색어
	
	//select 구간을 위한 멤버변수
	private int start;//select의 시작
	private int end;//끝
}
