package com.coffice.user.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.MemberDTO;
import com.coffice.dto.MemberSubInfoDTO;
import com.coffice.dto.SubParameterDTO;
import com.coffice.dto.SubPayDTO;
import com.coffice.dto.SubscriptionDTO;

@Service
public interface SubPaylmpl {
	
	//결제정보 입력
	public int paymentInfo(SubParameterDTO subParameterDTO);
	
	//구독권 리스트 가져오기
	public ArrayList<SubscriptionDTO> subList();
	
	//회원정보 가져오기
	public MemberDTO user(String mem_id);
	
	//결제정보 가져오기
	public SubParameterDTO subInfo();

}
