package com.coffice.dto;

import lombok.Data;

@Data
public class SubPayDTO {
	
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
		
/*		

		//사용만료일
		private String pay_expiration_date;
		//다음결제일
		private String pay_next_order_day;
		//빌링키 --> 회원 아이디
		private String pay_billing_key;*/



	
}
//
//CREATE TABLE members
//(
//	-- PK
//	mem_id varchar2(30) NOT NULL,
//	-- 멤버분류 - 1,고객, 2.제휴점주, 3.일반점주, 4.관리자
//	mem_case number NOT NULL,
//	-- 패스워드
//	mem_pw varchar2(100) NOT NULL,
//	-- 이름
//	mem_name varchar2(50) NOT NULL,
//	-- 닉네임
//	mem_nickname varchar2(50) NOT NULL,
//	-- 휴대폰번호
//	mem_phone varchar2(30) NOT NULL,
//	-- 이메일
//	mem_email varchar2(50) NOT NULL,
//	-- 성별
//	mem_gender varchar2(10) NOT NULL,
//	-- 가입일
//	mem_regidate date DEFAULT sysdate NOT NULL,
//	-- 포인트
//	mem_point number DEFAULT 0 NOT NULL,
//	-- 보유구독권여부 혹은 일련번호
//	mem_sub varchar2(30) DEFAULT '''''' NOT NULL,
//	-- 등록시 파일이름변경만
//	mem_img varchar2(300) DEFAULT '''''' NOT NULL,
//	-- (실버,골드,다이아) 구현여부 미정
//	mem_level varchar2(20) DEFAULT '''''' NOT NULL,
//	PRIMARY KEY (mem_id)
//);

//CREATE TABLE member_sub_info
//(
//	-- 결제일련번호
//	pay_idx number NOT NULL,
//	-- 회원아이디
//	mem_id varchar2(30) NOT NULL,
//	-- 구독권일련번호
//	sub_idx number NOT NULL,
//	-- 구독권구매일
//	pay_created_at date NOT NULL,
//	-- 구독권만료일
//	pay_expiration_date date NOT NULL,
//	-- 총커피잔수
//	sub_coffee_num number NOT NULL,
//	-- 남은커피잔수
//	sub_coffee_num_left number NOT NULL,
//	-- 결제용 QR코드
//	sub_qr_code varchar2(500) NOT NULL
//);

//CREATE TABLE payment
//(
//	-- 결제일련번호
//	pay_idx number NOT NULL,
//	-- 구독권일련번호
//	sub_idx number NOT NULL,
//	-- 구매한멤버아이디
//	mem_id varchar2(30) NOT NULL,
//	-- 결제금액
//	pay_price number NOT NULL,
//	-- 결제요청시간
//	pay_created_at date,
//	-- 결제성공시간
//	pay_successed_at date NOT NULL,
//	-- 사용만료일
//	pay_expiration_date date NOT NULL,
//	pay_next_order_day date NOT NULL,
//	-- 빌링키
//	pay_billing_key varchar2(300) NOT NULL,
//	-- 결제상태
//	pay_result_status varchar2(45) NOT NULL,
//	-- 결제결과메세지
//	pay_result_msg varchar2(500) NOT NULL,
//	PRIMARY KEY (pay_idx)
//);

//CREATE TABLE subscription
//(
//	-- 구독권일련번호
//	sub_idx number NOT NULL,
//	-- 구독권가격
//	sub_price number NOT NULL,
//	-- 한달커피잔
//	sub_coffee_num number NOT NULL,
//	PRIMARY KEY (sub_idx)
//);
