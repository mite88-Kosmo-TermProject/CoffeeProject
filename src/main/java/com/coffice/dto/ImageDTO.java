package com.coffice.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class ImageDTO {

	private String image_idx;
	private String review_idx;
	private int store_idx;
	private String image_origin;
	private String image_save;
	private Date image_postdate;
	private String image_rprsn;
}
