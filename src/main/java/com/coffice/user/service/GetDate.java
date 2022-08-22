package com.coffice.user.service;

import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class GetDate {
	
	public Date getDate() {
		
        Date date = new Date();

        long timeInMilliSeconds = date.getTime();
        java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
        
        return date1;
	}
}
