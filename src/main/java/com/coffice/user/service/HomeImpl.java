package com.coffice.user.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.*;

@Service
public interface HomeImpl {

	/*카페리스트 가져오기*/
	public ArrayList<StoresDTO> getList();
	
	public ArrayList<ReviewDTO> mainpage_review();
}
