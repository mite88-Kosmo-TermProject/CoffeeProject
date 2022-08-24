package com.coffice.user.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.coffice.dto.*;

@Service
public interface CafeSNSImpl {
	
	/*리뷰 작성*/
	public int insert(ReviewDTO reviewDTO);
	
	/*리뷰idx 얻기*/
	public int getIdx(ReviewDTO reviewDTO);
	
	/*이미지 삽입*/
	public int imgInsert(ImageDTO imageDTO);
	
	/*카페들의 정보를 가져온다.*/
	public ArrayList<StoresDTO> getcafeList();
	
	/*리뷰테이블의 개수*/
	public int getTotalCount(ParameterDTO parameterDTO);
	
	/*리뷰테이블 리스트가져오기*/
	public ArrayList<ReviewDTO> list();
	
	/*새로운 리뷰 리스트*/
	public ArrayList<ReviewDTO> getnewList(ParameterDTO parameterDTO);
	
	public ArrayList<ReviewDTO> review_list(ParameterDTO parameterDTO);
	
	public int findLike(HeartDTO heartDTO);
	
	public void insertlike(HeartDTO heartDTO);
	
    
    public void likedelete(HeartDTO heartDTO);
    
    public void like_up(@Param("_idx") int review_idx);
    
    public void like_down(@Param("_idx") int review_idx);
    
    public int like_hit(@Param("_idx") int review_idx);
    
    public ArrayList<HeartDTO> check_like(@Param("user_id") String user);
    
}
