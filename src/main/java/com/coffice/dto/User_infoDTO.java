package com.coffice.dto;

import lombok.Data;

@Data
public class User_infoDTO {

	private String userId;//유저아이디
	
	private String userName; //유저 이름
	
	private String nickName; //유저 닉네임
	
	private String email; //유저 이메일
	
	private String phoneNumber;//유저 전화번호
	
}
