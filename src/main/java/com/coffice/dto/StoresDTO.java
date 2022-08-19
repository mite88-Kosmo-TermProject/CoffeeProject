package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

//매장정보
@Data
public class StoresDTO {
	
	private Date postdate;
	
	private int store_idx;
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
	private Double store_longitude;
	private Double store_latitude;
	private String store_notice;
	private String store_menu;
	private int store_star;
	private int store_afltd;
	private String store_menu_img;
	private String store_time;
	
}
