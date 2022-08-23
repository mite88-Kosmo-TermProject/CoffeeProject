package com.coffice.dto;

import lombok.Data;

@Data
public class PointDTO {
	
	private int point_idx;
	private String mem_id;
	private int point_entry_exit;
	private String point_postdate;
	private int point_sources;
}
