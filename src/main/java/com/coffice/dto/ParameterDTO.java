
package com.coffice.dto;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ParameterDTO {
	//멤버변수
	//사용자 세션 아이디
	private String mem_id;
	//게시물의 일련번호
	private String board_idx;
	//검색어 처리를 위한 멤버변수
	private String searchField;
	private String searchTxt;
	//select 구간을 위한 멤버변수
	private int start;
	private int end;

	private String num;
	
	private ArrayList<String> review_idx;

}

