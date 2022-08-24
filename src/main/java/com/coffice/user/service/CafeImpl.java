package com.coffice.user.service;

import java.util.*;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.ImageDTO;
import com.coffice.dto.MemberDTO;
import com.coffice.dto.SearchDTO;
import com.coffice.dto.StoresDTO;


//사용자 카페관련 인터페이스
@Service
public interface CafeImpl {

	//카페정보
	public List<StoresDTO> getCafeData(int store_idx) throws Exception;
	
	public int getTotalCountSearch(SearchDTO searchDTO);
	public ArrayList<SearchDTO> listPageSearch(SearchDTO searchDTO);
	
	
	public int edit(StoresDTO storesDTO);
	public int cafemodify(StoresDTO storesDTO);
	
	public int menuimgED(StoresDTO storesDTO);
	public int menuimgMD(StoresDTO storesDTO);
	
	public int tagMD(StoresDTO storesDTO);
	public int tagED(StoresDTO storesDTO);
	
	public int imgMD(ImageDTO imageDTO);
	public int imgED(ImageDTO imageDTO);

}

