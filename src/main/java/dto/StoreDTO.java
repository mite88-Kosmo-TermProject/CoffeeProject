package dto;

import java.sql.Date;

import lombok.Data;

@Data
public class StoreDTO {
	   
	private int store_idx;
	
	private Date postdate;
	
	private String storeName;
	
	private Double latitude;
	
	private Double longitude;
	
}