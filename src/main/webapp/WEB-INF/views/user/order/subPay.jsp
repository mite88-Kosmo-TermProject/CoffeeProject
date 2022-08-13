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
//결제페이지 진입하면서 소비자 정보를 가지고 들어와야 한다. 
//아니면 결제페이지에 정보 뿌려주고 수정하게하고 value값 넣기정도?
$(function() {
	function kakaopay(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp56165372'); 
		IMP.request_pay({
			pg : kakaopay,
			pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
			merchant_uid : new Date().getTime(),
			name : 'test05',
			amount : 2000, 
			customer_uid : "madcatz92", //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
			buyer_email : 'iamport@siot.do',
			buyer_name : '아임포트',
			buyer_tel : '02-1234-1234'
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
	})
		
	/* 	
	function kakaopay(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp56165372'); 
		IMP.request_pay({
			pg : kakaopay, // 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자 누락되거나 매칭되지 않는 경우 관리자 콘솔에서 설정한 기본PG가 호출됨 값 형식: [PG사 코드값] 또는 [PG사 코드값].[PG사 상점아이디]
			pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
			merchant_uid : new Date().getTime(),// 가맹점에서 생성/관리하는 고유 주문번호. 이미 결제가 승인 된(status: paid) merchant_uid로는 재결제 불가
			name : 'test05', //주문명 (구독권 이름)
			amount : 2000,  // 결제할 금액
			customer_uid : "madcatz92", //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
			buyer_email : 'iamport@siot.do', // 주문자 이메일[페이먼트월 필수]
			buyer_name : '아임포트', //주문자명
			buyer_tel : '02-1234-1234' // 주문자 연락처(누락되거나 공백일때 일부 PG사[엑심베이]에서 오류 발생)
		}, function(rsp) {
			if ( rsp.success ) {
				$.ajax({
					url:'../order/insertSubscribe.do', //DB에 구독정보 등록하는 부분..
					data:{
						
						"mem_id" : "madcatz92",
						"pay_import_key" : rsp.imp_uid, // 아임포트 고유 결제번호
						"pay_idx" : rsp.merchant_uid, // 가맹점에서 생성/관리하는 고유 주문번호
						"pay_price" : rsp.paid_amount, // (number) 결제금액 결제승인된 또는 가상계좌 입금예정 금액
						"pay_result_status" : rsp.status, // 결제상태 옵션 값(클릭하여 자세히보기)
						"sub_idx" : rsp.name, // 주문명
						"mem_name" : rsp.buyer_name, // 주문자 이름
						"mem_email" : rsp.buyer_email, // 주문자 Email
						"mem_phone" : rsp.buyer_tel, // 주문자 연락처
						"pay_successed_at" : rsp.paid_at, //(number) 결제승인시각(UNIX timestamp)
						
						
						//결제요청시간
						private Date pay_created_at;
						//사용만료일
						private Date pay_expiration_date;
						//다음결제일
						private Date pay_next_order_day;
						//결제결과메세지
						private String pay_result_msg;
						
						rsp.success* (boolean): 결제의 성공여부, 결제승인 혹은 가상계좌 발급이 성공한 경우, True
						rsp.error_code* : 결제가 실패한 경우 단축 메세지(현재 코드체계는 없음)
						rsp.error_msg : 결제가 실패한 경우 상세 메세지
						rsp.imp_uid* : 아임포트 고유 결제번호, success가 false이고 사전 validation에 실패한 경우, imp_uid는 null일 수 있음
						rsp.merchant_uid* : 가맹점에서 생성/관리하는 고유 주문번호
						rsp.pay_method : 결제수단 옵션 값(클릭하여 자세히보기)
						rsp.paid_amount	(number) : 결제금액 결제승인된 또는 가상계좌 입금예정 금액
						rsp.status : 결제상태 옵션 값(클릭하여 자세히보기)
							- ready(브라우저 창 이탈, 가상계좌 발급 완료 등 미결제 상태)
							- paid(결제완료)
							- failed(신용카드 한도 초과, 체크카드 잔액 부족, 브라우저 창 종료 또는 취소 버튼 클릭 등 결제실패 상태)
						rsp.name : 주문명
						rsp.pg_provider : 결제승인/시도된 PG사 옵션 값(클릭하여 자세히보기)
						rsp.emb_pg_provider	: 결제창에서 간편결제 호출시 결제 승인된 PG사	KG이니시스, NHN KCP에서 pay_method = card 일때, 결제창에서 선택한 간편결제 PG사( Naver Pay, Kako Pay, Payco, Samsung Pay, SSG Pay, L.pay, Kpay )
						rsp.pg_tid	: PG사 거래고유번호
						rsp.buyer_name	: 주문자 이름
						rsp.buyer_email	: 주문자 Email
						rsp.buyer_tel : 주문자 연락처
						rsp.buyer_addr : 주문자 주소
						rsp.buyer_postcode : 주문자 우편번호
						rsp.custom_data	(object) : 가맹점 임의 지정 데이터
						rsp.paid_at	(number) : 결제승인시각(UNIX timestamp)
						rsp.receipt_url	: PG사에서 발행되는 거래 매출전표 URL 전달되는 URL을 클릭하면 매출전표 확인가능 
						
						
						
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
	*/
	
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