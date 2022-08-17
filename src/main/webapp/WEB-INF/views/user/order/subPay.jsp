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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- 
<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp56165372"); // 예: imp00000000

  function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "kakaopay",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",
        name: "노르웨이 회전 의자",
        amount: 64900,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        	alert("결제에 성공하였습니다. 내용: " +  rsp.error_msg);
        	/* 
        	// jQuery로 HTTP 요청
            jQuery.ajax({
                url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: {
                    imp_uid: rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid
                }
            }).done(function (data) {
             // 가맹점 서버 결제 API 성공시 로직
            }) */
        } else {
        	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
    });
  }
</script>
 -->
<script>
	function kakaopay(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp56165372'); 
		IMP.request_pay({
			pg: "kakaopay", // 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자 누락되거나 매칭되지 않는 경우 관리자 콘솔에서 설정한 기본PG가 호출됨 값 형식: [PG사 코드값] 또는 [PG사 코드값].[PG사 상점아이디]
			pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
			merchant_uid : new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호. 이미 결제가 승인 된(status: paid) merchant_uid로는 재결제 불가
			name : 'CoffeePass 30잔', //주문명 (구독권 이름)
			amount : 2000, // 결제할 금액
			customer_uid : $('#customer_id').val(), //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
			buyer_email : 'madcatz92@naver.com', // 주문자 이메일[페이먼트월 필수]
			buyer_name : '이준희', //주문자명
			buyer_tel : '02-4316-8802' // 주문자 연락처(누락되거나 공백일때 일부 PG사[엑심베이]에서 오류 발생)
		}, function(rsp) {
			if ( rsp.success ) {
				$.ajax({
					url:'../order/insertSubscribe.do', //DB에 구독정보 등록하는 부분..
					type : 'post',
					data:{
						customer_id : $('#customer_id').val(),
						pay_import_key : rsp.imp_uid, // 아임포트 고유 결제번호
						pay_idx : rsp.merchant_uid, // 가맹점에서 생성/관리하는 고유 주문번호
						pay_price : rsp.paid_amount, // (number) 결제금액 결제승인된 또는 가상계좌 입금예정 금액
						pay_result_status : rsp.status, // 결제상태 옵션 값(클릭하여 자세히보기)
						sub_idx : rsp.name, // 주문명
						pay_successed_at : rsp.paid_at, //(number) 결제승인시각(UNIX timestamp)
					},
					success:function(result) {
						alert('정기결제 등록'+result);
					}
				});
			    alert(rsp.paid_at + rsp.paid_amount + rsp.status + rsp.merchant_uid + rsp.name);
			    alert($('#customer_id').val());
			    
				$.ajax({
					url:'../order/payment.do', //결제 상태를 확인하고 스케줄러를 호출하는 부분
					type : 'post',
					data:{
						customer_uid : $('#customer_id').val(),
						price : 2000, 
						merchant_uid : new Date().getTime()+1
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

	<button onclick="requestPay()">결제하기</button>
	   
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
		<div>
			<!-- <input type="text" id="package_id" value="구독권"> -->
			<input type="text" id="customer_id" value="madcatz92">
		</div>	
		<div class ="btns">
			<input type="button" id="check1" value="구매" onclick="kakaopay();">
			<!-- <input type="button" id="check2" value="환불"> -->
		</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>