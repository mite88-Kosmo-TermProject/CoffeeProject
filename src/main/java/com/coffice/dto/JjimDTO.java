package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class JjimDTO {

	private int jjim_idx;
	private int store_idx;
	private String mem_id;
	private Date jjim_postdate;
}
