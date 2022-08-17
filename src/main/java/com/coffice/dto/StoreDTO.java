package com.coffice.dto;

import lombok.Data;

@Data
public class StoreDTO {
	
	private int store_idx;
	private String mem_id;
	private String store_name;
	private String store_owner;
	private String store_phone;
	private String store_address;
	private int store_lttd;
	private int store_hrdns;
	private String store_notice;
	private String store_menu;
	private double store_star;
	private int store_afltd;
}
