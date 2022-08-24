package com.coffice.dto;

import lombok.Data;

@Data
public class MemberSubInfoDTO {

	
		// 구독정보일련번호 : 구독정보일련번호
		private int sub_info_idx;
		// 회원아이디 : 회원아이디
		private String mem_id;
		// 결제일련번호 : 결제일련번호
		private String pay_idx;
		// 구독권이름 : 구독권이름
		private String sub_name;
		// 구독권구매일 : 구독권구매일
		//private String pay_created_at;
		// 구독권만료일 : 구독권만료일(다음결제일)
		//private String pay_expiration_date;
		// 총커피잔수 : 총커피잔수
		//private String sub_coffee_num;
		// 남은커피잔수 : 남은커피잔수
		private int sub_coffee_num_left;
		// 결제용 QR코드 : 결제용 QR코드
		private String sub_qr_code;

}
