package com.coffice.dto;

import java.util.ArrayList;

import lombok.Data;
@Data
public class ParameterDTO {

	private String num;
	
	private ArrayList<String> review_idx;
	
	private int start;
	
	private int end;
}
