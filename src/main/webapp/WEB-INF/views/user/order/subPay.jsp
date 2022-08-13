<%--
/**
 * <pre>
 * 1. 프로젝트명 : /order/subPay.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:46:20
 * 3. 작성자 : 전옥주
 * 4. 설명 : 패스구매
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->

<script>

//카카오 결제 API
/* 
var IMP = window.IMP; // 생략가능
IMP.init('imp56165372');  // 가맹점 식별코드
// IMP.request_pay(param, callback) 결제창 호출
IMP.request_pay({
    pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
    pay_method: 'card',
    merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
    name : '커피패스 30잔 구독권', // 상품명
    amount : 1004,
    //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
    customer_uid : new Date().getTime(),
    buyer_email : 'madcats92@gmail.com',
    buyer_name : '이준희',
    buyer_tel : '010-4316-8802',
}, function(rsp) { //callback
    if ( rsp.success ) {
      console.log('빌링키 발급 성공', rsp)
      //빌링키 발급이 완료되었으므로, 서버에 결제 요청
      alert('예약 결제가 완료되었습니다!');
    } else {
      var msg = '결제에 실패하였습니다.\n';
      msg += rsp.error_msg;
      alert(msg);
      return false;
    }
    $("#final-support-submit").onClick();
});
 */

/* 	IMP.init("imp56165372"); 
IMP.request_pay({
pay_method : 'card', // 기능 없음.
merchant_uid: "coffeesub_" + new Date().getTime(), // 상점에서 관리하는 주문 번호
name : '커피패스구독권',
amount : 33000, // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.   
customer_uid : 'your-customer-unique-id', // 필수 입력
buyer_email : 'iamport@siot.do',
buyer_name : '아임포트',
buyer_tel : '02-1234-1234'
}, function(rsp) {
if ( rsp.success ) {
	alert('빌링키 발급 성공');
} else {
	alert('빌링키 발급 실패');
}
}); */

<!-- pay js -->
<%-- 
$(document).ready(function(){
	   var pay = 30;
	   console.log(pay);
	   	  
		var IMP = window.IMP;
		var code = "imp56165372"; //가맹점 식별코드
		IMP.init(code);
		
		$("#check1").click(function(e){
			// IMP.request_pay(param, callback) 호출
			//결제요청
			IMP.request_pay({
				//name과 amout만있어도 결제 진행가능
				pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
				pay_method: 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '커피패스 30잔 구독권', // 상품명
				amount : 1,
			    customer_uid : new Date().getTime(), // 카드(빌링키)와 1:1로 대응하는 값
			    buyer_email : 'madcats92@gmail.com',
			    buyer_name : '이준희',
			    buyer_tel : '010-4316-8802',
			    
				
				buyer_email : '<%=email%>',
				buyer_name : '<%=mvo.getName()%>',
				buyer_tel : '<%= mvo.getPhone()%>',  //필수항목
				
				//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
				//m_redirect_url : 'https://localhost:8080/payments/complete'
				
			}, function(rsp){  // callback
			    
				if(rsp.success){//결제 성공시
					
					var msg = '결제가 완료되었습니다';
					var result = {
					"imp_uid" : rsp.imp_uid,
					"merchant_uid" : rsp.merchant_uid,
					"biz_email" : 'madcats92@gmail.com',
					"pay_date" : new Date().getTime(),
					"amount" : rsp.paid_amount,
					"card_no" : rsp.apply_num,
					"refund" : 'payed'
					}
					console.log("결제성공= " + msg);
					
					// 빌링키 발급 성공
				    // jQuery로 HTTP 요청
					$.ajax({
						// "{customer_uid를 받을 서비스 URL}", 예: https://www.myservice.com/billings/
						url : '/order/subPayResult.do',
				        type :'POST',
				        data : JSON.stringify(result,
				        		['imp_uid', 'merchant_uid', 'biz_email', 
				        			'pay_date', 'amount', 'card_no', 'refund']),
				        contentType:'application/json;charset=utf-8',
				        dataType: 'json', //서버에서 보내줄 데이터 타입
				        
				        success: function(res){
				        			        	
				          if(res == 1){
							 console.log("추가성공");	
							 pay += 5;
							 $('#pay_coupon').html(pay);			           
				          }else{
				             console.log("Insert Fail!!!");
				          }
				        },
				        error:function(){
				          console.log("Insert ajax 통신 실패!!!");
				        }
					}) //ajax
					
				}
				else{ // 빌링키 발급 실패
					var msg = '결제에 실패했습니다';
					msg += '에러 : ' + rsp.error_msg
				}
				console.log(msg);
			});//pay
		}); //check1 클릭 이벤트
 --%>
<%-- 		$("#check2").click(function(e){
		      console.log("남은이용권"+$('#pay_coupon').text());
		      if($('#pay_coupon').text() >= 5){
			$.ajax({
					url: "/samsam/coupon_cancel.do",
					type:"post",
					//datatype:"json",
					contentType : 'application/x-www-form-urlencoded; charset = utf-8',
					data : {
						"biz_email" : '<%=email%>' // 주문번호
						//"cancle_request_amount" : 2000, //환불금액
						//"reason": "테스트 결제 환불", //환불사유
						//"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
						//"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
						//"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
					}
				}).done(function(result){ //환불 성공
					 pay -= 5;
					 $('#pay_coupon').html(pay);	
					console.log("환불 성공 : "+ result);
				}).fail(function(error){
					console.log("환불 실패 : "+ error);
				});//ajax
			} else{
				console.log("환불 실패 : 남은 결제권 환불 불가");
			}
		}); //check2 클릭 
		
	}); //doc.ready --%>
	
	function kakaopay(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp56165372'); 
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
			merchant_uid : new Date().getTime(),
			name : 'test05',
			amount : 2000, 
			customer_uid : "madcatz92"+ new Date().getTime(), //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
			buyer_email : 'iamport@siot.do',
			buyer_name : '아임포트',
			buyer_tel : '02-1234-1234',
			
		}, function(rsp) {
			if ( rsp.success ) {
				$.ajax({
					url:'/insertSubscribe', //DB에 구독정보 등록하는 부분..
					data:{
						package_id : $('#package_id').val(),
						customer_id : $('#customer_id').val()
					},
					success:function(result) {
						alert('정기결제 등록'+result);
					}
				});
				
			    alert($('#customer_id').val());
				$.ajax({
					url:'/payment1', //결제 상태를 확인하고 스케줄러를 호출하는 부분
					type : 'POST',
					data:{
						"customer_uid" : customer_uid,
						"price" :price, 
						"merchant_uid" : new Date().getTime()
					},
					success:function(result) {
						alert('다음 결제 예약');
					}
				});
			} else {
				alert('빌링키 발급 실패');
				}
			});
	}	

</script>

</head>


<body>
	   
	<!-- content -->
	<h5>이용권</h5>		
		<table class = pay border="1">
			<tr>
				<td rowspan="2" class="pay_detail">이용권</td>
				<td>월 기본 제공 </td>
				<td>30</td>
			</tr>
			<tr>
				<td>남은 커피패스 이용횟수</td>
				<td id="pay_coupon">3</td>
			</tr>
		</table>
			
		<div class ="btns">
			<input type="button" id="check1" value="구매" onclick="kakaopay();">
			<!-- <input type="button" id="check2" value="환불"> -->
		</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>