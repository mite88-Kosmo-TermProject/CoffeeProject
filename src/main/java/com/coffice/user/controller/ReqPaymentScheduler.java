package com.coffice.user.controller;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.PeriodicTrigger;
import org.springframework.stereotype.Component;

@Component
public class ReqPaymentScheduler {
	
	//스케줄러
    private ThreadPoolTaskScheduler scheduler;
	@Autowired
	SchedulePayment setSchedulePay;
	
    public void stopScheduler() {
    	//구독 취소 시 scheduler shutdown을 통해 결제 요청 멈춤
        scheduler.shutdown();
        
        //"https://api.iamport.kr/subscribe/payments/unschedule" post 로 customer_uid (string)랑 토큰 보내주면 예약걸려있는거 취소됨
    }
 
    public void startScheduler(String customer_uid, String price, String merchant_uid, String sub_name) {
        scheduler = new ThreadPoolTaskScheduler();
//        scheduler.setPoolSize(5);
//        scheduler.setThreadGroupName("scheduler thread pool");
//        scheduler.setThreadNamePrefix("scheduler-thread-");
        scheduler.initialize();
        //System.out.println("getTrigger().toString()===="+getTrigger().toString()); 한번만 만료일을 한번만 찍어줌
        // 스케쥴러가 시작되는 부분 
        scheduler.schedule(getRunnable(customer_uid, price, merchant_uid, sub_name), getTrigger());
    }
    
//    public static java.sql.Date convertFromJAVADateToSQLDate(
//            java.util.Date javaDate) {
//        java.sql.Date sqlDate = null;
//        if (javaDate != null) {
//            sqlDate = new Date(javaDate.getTime());
//        }
//        return sqlDate;
//    }
 
    private Runnable getRunnable(String customer_uid, String price, String merchant_uid, String sub_name){
//    	Date date = (Date) getDate.getDate();
//    	Calendar cal = Calendar.getInstance();
//    	cal.setTime(date);
//    	cal.add(Calendar.MONTH, 1);
//    	cal.add(Calendar.DATE, 1);
//    	Date s = convertFromJAVADateToSQLDate(cal.getTime());
        return () -> {
        	setSchedulePay.schedulePay(customer_uid, price, merchant_uid, sub_name);
        };
    }
    
    private Trigger getTrigger() {
        // 작업 주기 설정 
        return new PeriodicTrigger(1, TimeUnit.MINUTES);
    }
}
