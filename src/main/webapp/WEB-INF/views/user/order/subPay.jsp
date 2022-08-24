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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->

<link href="<%=request.getContextPath()%>/resources/assets/css/pay.css"
	rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script>
	//가격 천의 자리마다 콤마 붙이기 위해 넣음
	//그외 잔당 가격 계산등 기능구현
	window.onload = function () {
	    let prices = document.getElementsByName("price");
	    let cups = document.getElementsByName("cup");
	    let oneCups = document.getElementsByName("oneCup");
	    
	    for(let i=0; i<prices.length; i++) {
	    	oneCups[i].innerHTML = Number( prices[i].innerHTML / cups[i].innerHTML ).toLocaleString("ko-KR", { style: 'currency', currency: 'KRW' });
	    	prices[i].innerHTML = Number(prices[i].innerHTML).toLocaleString("ko-KR", { style: 'currency', currency: 'KRW' });
	    	cups[i].innerHTML = cups[i].innerHTML+"잔";
	    }
	    
	};

	function fnProductSelect01(name, price, cup) {
		document.getElementById("selectName").innerHTML = name;
		document.getElementById("selectPrice").innerHTML = price;
		document.getElementById("selectCup").innerHTML = cup;
	}
	
	//회원정보 dto 로 가져옴 (결제 안내창에 뿌려주고 사용)
	function kakaopay(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp56165372'); 
		IMP.request_pay({
			pg: "kakaopay", // 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자 누락되거나 매칭되지 않는 경우 관리자 콘솔에서 설정한 기본PG가 호출됨 값 형식: [PG사 코드값] 또는 [PG사 코드값].[PG사 상점아이디]
			pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
			merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호. 이미 결제가 승인 된(status: paid) merchant_uid로는 재결제 불가
			name : $('#selectName').html(), //주문명 (구독권 이름)
			amount : $('#selectPrice').html(), // 포인트등을 사용한 첫 결제금액
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
						price : 2, // 첫결제는 포인트사용한 금액이고 여기는 원래구독권가격 넣기
						merchant_uid : rsp.merchant_uid+1
					},
					success:function(result) {
						alert('정기결제 예약성공');
					},
					error : function(errData) {
						alert('정기결제 예약실패')
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
		<!-- content -->

		<div class="container">
			<form id="paypaypay">
	
				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
	
						<div class="row">
	
							<h4>개인정보</h4>
							<div class="input-group input-group-icon">
								<input type="text" placeholder="Full Name" />
								<div class="input-icon">
									<i class="fa fa-user"></i>
								</div>
							</div>
							<div class="input-group input-group-icon">
								<input type="email" placeholder="Email Adress" />
								<div class="input-icon">
									<i class="fa fa-envelope"></i>
								</div>
							</div>
							<div class="input-group input-group-icon">
								<input type="password" placeholder="Password" />
								<div class="input-icon">
									<i class="fa fa-key"></i>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-half">
								<h4>생년월일</h4>
								<div class="input-group">
									<div class="col-third">
										<input type="text" placeholder="DD" />
									</div>
									<div class="col-third">
										<input type="text" placeholder="MM" />
									</div>
									<div class="col-third">
										<input type="text" placeholder="YYYY" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<h4>돈 어떤방식으로 내고싶니??</h4>
							<div class="input-group">
								<input id="payment-method-card" type="radio"
									name="payment-method" value="card" checked="true" /> <label
									for="payment-method-card"><span></i>카드결제</span></label> <input
									id="payment-method-paypal" type="radio" name="payment-method"
									value="paypal" /> <label for="payment-method-paypal"> <span></i>카카오결제</span></label>
							</div>
							<div class="input-group input-group-icon">
								<input type="text" placeholder="Card Number" />
								<div class="input-icon">
									<i class="fa fa-credit-card"></i>
								</div>
							</div>
							<div class="col-half">
								<div class="input-group input-group-icon">
									<input type="text" placeholder="Card CVC" />
									<div class="input-icon">
										<i class="fa fa-user"></i>
									</div>
								</div>
							</div>
							<div class="col-half">
								<div class="input-group">
									<select>
										<option>1월</option>
										<option>2월</option>
										<option>3월</option>
										<option>4월</option>
										<option>5월</option>
										<option>6월</option>
										<option>7월</option>
										<option>8월</option>
										<option>9월</option>
										<option>10월</option>
										<option>11월</option>
										<option>12월</option>
									</select> <select>
										<option>2022</option>
										<option>2023</option>
										<option>2024</option>
										<option>2025</option>
										<option>2026</option>
										<option>2027</option>
										<option>2028</option>
										<option>2029</option>
										<option>2030</option>
										<option>2031</option>
										<option>2032</option>
										<option>2033</option>
										<option>2034</option>
										<option>2035</option>
										<option>2036</option>
										<option>2037</option>
										<option>2038</option>
										<option>2039</option>
										<option>2040</option>
									</select>
								</div>
							</div>
	
							<div class="row">
								<h4>동의해줘!</h4>
								<div class="input-group">
									<input id="terms" type="checkbox" /> <label for="terms">개인정보
										수집한다?</label>
								</div>
							</div>
	
						</div>
	
					</div>
					<div class="col-2"></div>
	
				</div>
	
	
			</form>
		</div>


	<h5>이용권</h5>		
		<table class = pay border="1">
			<tr>
				<td>구독권 이름</td>
				<td>가격</td> 
				<td>커피잔 수</td>  
				<td>한잔당 가격</td> 
			</tr>
		</table>
			<!-- loop.index 사용을 고려해보자 -->
			<c:forEach items="${lists }" var="dto" varStatus="loop">
				<span onclick="fnProductSelect01('${dto.sub_name}','${dto.sub_price }','${dto.sub_coffee_num }');">
					<div>${dto.sub_name }</div>
					<div name="price">${dto.sub_price }</div> 
					<%-- <td name="price${loop.index }">${dto.sub_price }</td>  --%>
					<div name="cup">${dto.sub_coffee_num }</div>  
					<div name="oneCup"></div> 
				</span>
			</c:forEach>
<!-- 			<tr>
				<td>남은 커피패스 이용횟수</td>
				<td id="pay_coupon">3</td>
			</tr> -->

		<div id="selectName">
			
		</div>
		<div id="selectPrice">
		
		</div>
		<div id="selectCup">
		
		</div>
		
		<div>
			<input type="text" id="customer_id" value="madcatz92">
		</div>	
		<div class ="btns">
			<input type="button" id="check1" value="구매" onclick="kakaopay();">
		</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>
</html>