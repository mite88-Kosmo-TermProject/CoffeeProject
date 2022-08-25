package com.coffice.dto;

import lombok.Data;

//SubPayDTO , MemberSubInfoDTO
@Data
public class SubParameterDTO {

	//결제일련번호
	private String pay_idx;
	//구매한멤버아이디
	private String mem_id;
	//아임포트 결제 일련번호
	private String pay_import_key;		
	//결제금액
	private String pay_price;	
	//결제상태
	private String pay_result_status;		
	//주문명
	private String sub_name;		
	//결제성공시간
	private String pay_successed_at;
	//결제한 pg사
	private String pay_case;
	//다음결제일
	private String pay_next_order_date;
	// 구독정보일련번호 : 구독정보일련번호
	private int sub_info_idx;
	// 남은커피잔수 : 남은커피잔수
	private int sub_coffee_num_left;
	// 결제용 QR코드 : 결제용 QR코드
	private String sub_qr_code;
	
}
