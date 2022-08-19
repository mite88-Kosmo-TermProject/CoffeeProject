package com.coffice.user.controller;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.PeriodicTrigger;
import org.springframework.stereotype.Component;

import com.coffice.user.service.SchedulePayment;

@Component
public class ReqPaymentScheduler {
	
	//스케줄러
    private ThreadPoolTaskScheduler scheduler;
	@Autowired
	SchedulePayment setSchedulePay;
	
    public void stopScheduler() {
    	//구독 취소 시 scheduler shutdown을 통해 결제 요청 멈춤
        scheduler.shutdown();
    }
 
    public void startScheduler(String customer_uid, String price, String merchant_uid) {
        scheduler = new ThreadPoolTaskScheduler();
        scheduler.initialize();
        // 스케쥴러가 시작되는 부분 
        scheduler.schedule(getRunnable(customer_uid, price, merchant_uid), getTrigger());
    }
    
    private Runnable getRunnable(String customer_uid, String price, String merchant_uid){
        return () -> {
        	setSchedulePay.schedulePay(customer_uid, price, merchant_uid);
        };
    }
    
    private Trigger getTrigger() {
        // 작업 주기 설정 
        return new PeriodicTrigger(10, TimeUnit.SECONDS);
    }
}
