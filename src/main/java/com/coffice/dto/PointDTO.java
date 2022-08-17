package com.coffice.dto;

import lombok.Data;

@Data
public class PointDTO {
	
	private int point_idx;
	private int point_entry_exit;
	private String mem_id;
	private String point_postdate;
	private int rule_idx;
}
