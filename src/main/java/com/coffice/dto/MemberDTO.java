package com.coffice.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class MemberDTO {

	private String mem_id;
	//멤버분류 - 1,고객, 2.점주, 3.관리자 5.점주승인대기중
	private String mem_case;
	private String mem_pw;
	private String mem_name;
	private String mem_nickname;
	private String mem_phone;
	private String mem_email;
	private String mem_gender;
	private Date mem_regidate;
	private String mem_point;
	//보유구독권의 정보 혹은 일련번호
	private String mem_sub;
	//등록시 파일이름변경만
	private String mem_img;
	//(실버,골드,다이아) 구현여부 미정
	private String mem_level;
}
