package com.coffice.dto;

import lombok.Data;

@Data
public class SubscriptionDTO {

	//구독권 일련번호
	private int sub_idx;
	//구독권 이름
	private String sub_name;
	//구독권가격
	private int sub_price;
	//한달커피잔
	private int sub_coffee_num;
}
