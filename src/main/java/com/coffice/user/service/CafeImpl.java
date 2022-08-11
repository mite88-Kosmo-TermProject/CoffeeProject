package com.coffice.user.service;

import java.util.*;


import com.coffice.dto.StoresDTO;

//사용자 카페관련 인터페이스
public interface CafeImpl {

	//카페정보
	public List<StoresDTO> getCafeData(int store_idx) throws Exception;

}
