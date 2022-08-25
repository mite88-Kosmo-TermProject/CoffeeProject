package com.coffice.dto;

import lombok.Data;

@Data
public class MypagejjimDTO {
	
	private int jjim_idx;
	private int store_idx;
	private String mem_id;
	private int jjim_flag;
	private java.sql.Date jjim_postdate;
	private StoresDTO storesdto;
}
