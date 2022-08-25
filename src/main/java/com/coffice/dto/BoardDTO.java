package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {

	private int board_idx;
	private String board_title;
	private String board_content;
	private String board_flag;
	private int board_visitcount;
	private String mem_id;
	private Date board_postdate;
	
}
