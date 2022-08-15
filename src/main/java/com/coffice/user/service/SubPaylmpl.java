package com.coffice.user.service;

import org.springframework.stereotype.Service;

import com.coffice.dto.SubPayDTO;

@Service
public interface SubPaylmpl {

	public int insert(SubPayDTO subPayDTO);
}
