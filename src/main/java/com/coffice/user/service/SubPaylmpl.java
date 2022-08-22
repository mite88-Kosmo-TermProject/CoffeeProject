package com.coffice.user.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.MemberDTO;
import com.coffice.dto.SubPayDTO;
import com.coffice.dto.SubscriptionDTO;

@Service
public interface SubPaylmpl {
	
	//결제정보 입력
	public int payment_info(SubPayDTO subPayDTO);
	//구독권 리스트 가져오기
	public ArrayList<SubscriptionDTO> subList();
	//회원정보 가져오기
	public MemberDTO user(String mem_id);

}
