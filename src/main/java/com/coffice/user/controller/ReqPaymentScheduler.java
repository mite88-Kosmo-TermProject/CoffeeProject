package com.coffice.user.controller;

import org.springframework.stereotype.Component;

@Component
public class ReqPaymentScheduler {
	
	//스케줄러
//    private ThreadPoolTaskScheduler scheduler;
//	@Autowired
//	SchedulePayment setSchedulePay;
//	@Autowired 
//	DeliveryService deliService;
//	@Autowired
//	GetDate getDate;
//    public void stopScheduler() {
//    	//구독 취소 시 scheduler shutdown을 통해 결제 요청 멈춤
//        scheduler.shutdown();
//    }
// 
//    public void startScheduler(long customer_uid, int price, long packageId) {
//        scheduler = new ThreadPoolTaskScheduler();
//        scheduler.initialize();
//        // 스케쥴러가 시작되는 부분 
//        scheduler.schedule(getRunnable(customer_uid, price, packageId), getTrigger());
//    }
//    
//    public static java.sql.Date convertFromJAVADateToSQLDate(
//            java.util.Date javaDate) {
//        java.sql.Date sqlDate = null;
//        if (javaDate != null) {
//            sqlDate = new Date(javaDate.getTime());
//        }
//        return sqlDate;
//    }
// 
//    private Runnable getRunnable(long customer_uid, int price, long packageId){
//    	Date date = getDate.getDate();
//    	Calendar cal = Calendar.getInstance();
//    	cal.setTime(date);
//    	cal.add(Calendar.MONTH, 1);
//    	cal.add(Calendar.DATE, 1);
//    	Date s = convertFromJAVADateToSQLDate(cal.getTime());
//        return () -> {
//        	setSchedulePay.schedulePay(customer_uid, price);
//        	deliService.deliveryInsert(packageId,customer_uid,s);
//        };
//    }
// 
//    private Trigger getTrigger() {
//        // 작업 주기 설정 
//        return new PeriodicTrigger(1, TimeUnit.MINUTES);
//    }
}
