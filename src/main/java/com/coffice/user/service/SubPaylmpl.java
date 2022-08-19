package com.coffice.user.service;

import org.springframework.stereotype.Service;

import com.coffice.dto.SubPayDTO;

@Service
public interface SubPaylmpl {
	
	//결제정보 입력
	public int Payment_info(SubPayDTO subPayDTO);
}
