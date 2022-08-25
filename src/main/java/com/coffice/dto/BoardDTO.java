package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {

	private int board_idx;
	private int start;
	private int end;
	private String board_title;
	private String board_content;
	private String board_flag;
	private int board_visitcount;
	private String mem_id;
	private String searchTxt;
	private String searchField;
	private Date board_postdate;
	
}
