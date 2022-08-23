package com.coffice.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.coffice.dto.SearchDTO;

@Service
public interface CafeSearchImpl {

	public int getTotalCount();
	public ArrayList<SearchDTO> listPage(int s, int e);
	
	public int getTotalCountSearch(SearchDTO searchDTO);
	public ArrayList<SearchDTO> listPageSearch(SearchDTO searchDTO);
	public ArrayList<SearchDTO> cafeInfo(SearchDTO searchDTO);
	

}
