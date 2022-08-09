package com.coffice.user.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.ParameterDTO;
import com.coffice.dto.reviewDTO;

import dto.StoreDTO;

@Service
public interface CafeSNSImpl {

	/*카페들의 정보를 가져온다.*/
	public ArrayList<StoreDTO> getcafeList();
	
	/*리뷰테이블의 개수*/
	public int getTotalCount(ParameterDTO parameterDTO);
	
	/*리뷰테이블 리스트가져오기*/
	public ArrayList<reviewDTO> list();
	
	/*새로운 리뷰 리스트*/
	public ArrayList<reviewDTO> getnewList(ParameterDTO parameterDTO);
}
