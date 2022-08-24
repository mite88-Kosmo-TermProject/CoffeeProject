package com.coffice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class HeartDTO {
	
   private int review_idx;
   private int like_flag;
   private Date like_postdate;
   private String mem_id;
}
