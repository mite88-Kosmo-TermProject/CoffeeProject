package com.coffice.user.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.*;

@Service
public interface CafeSNSImpl {
	
	/*리뷰 작성*/
	public int insert(ReviewDTO reviewDTO);
	
	/*카페들의 정보를 가져온다.*/
	public ArrayList<StoresDTO> getcafeList();
	
	/*리뷰테이블의 개수*/
	public int getTotalCount(ParameterDTO parameterDTO);
	
	/*리뷰테이블 리스트가져오기*/
	public ArrayList<ReviewDTO> list();
	
	/*새로운 리뷰 리스트*/
	public ArrayList<ReviewDTO> getnewList(ParameterDTO parameterDTO);
}
