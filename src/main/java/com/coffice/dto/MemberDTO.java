package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

//방명록 DTO 생성
@Data
public class MemberDTO {
	private String mem_id;
	private int mem_case;
	private String mem_pw;
	private String mem_name;
	private String mem_nickname;
	private String mem_phone;
	private String mem_email;
	private String mem_gender;
	private Date mem_regidate;
	private int mem_point;
	private String mem_sub;
	private String mem_img;
	private String mem_level;
	
}
