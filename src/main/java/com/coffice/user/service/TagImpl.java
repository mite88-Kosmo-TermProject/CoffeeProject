package com.coffice.user.service;

import java.util.*;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.coffice.dto.TagDTO;


//사용자 카페관련 인터페이스
@Service
public interface TagImpl {

	//태그정보
	public ArrayList<TagDTO> check_tag(int store_idx);

}

