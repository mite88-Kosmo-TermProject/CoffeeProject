package com.coffice.user.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.SearchDTO;



@Service
public interface CafeImpl {


	
	public int getTotalCountSearch(SearchDTO searchDTO);
	public ArrayList<SearchDTO> listPageSearch(SearchDTO searchDTO);
	

}
\