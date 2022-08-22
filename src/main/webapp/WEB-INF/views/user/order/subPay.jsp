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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

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
	function kakaopay() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp56165372');
		IMP.request_pay({
			pg : "kakaopay", // 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자 누락되거나 매칭되지 않는 경우 관리자 콘솔에서 설정한 기본PG가 호출됨 값 형식: [PG사 코드값] 또는 [PG사 코드값].[PG사 상점아이디]
			pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
			merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호. 이미 결제가 승인 된(status: paid) merchant_uid로는 재결제 불가
			name : $('#selectName').html(), //주문명 (구독권 이름)
			amount : $('#selectPrice').html(), // 포인트등을 사용한 첫 결제금액
			customer_uid : $('#customer_id').val(), //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
			buyer_email : 'madcatz92@naver.com', // 주문자 이메일[페이먼트월 필수]
			buyer_name : '이준희', //주문자명
			buyer_tel : '02-4316-8802' // 주문자 연락처(누락되거나 공백일때 일부 PG사[엑심베이]에서 오류 발생)
		}, function(rsp) {
			if (rsp.success) {
				$.ajax({
					url : '../order/insertSubscribe.do', //DB에 구독정보 등록하는 부분..
					type : 'post',
					data : {
						customer_id : $('#customer_id').val(),
						pay_import_key : rsp.imp_uid, // 아임포트 고유 결제번호
						pay_idx : rsp.merchant_uid, // 가맹점에서 생성/관리하는 고유 주문번호
						pay_price : rsp.paid_amount, // (number) 결제금액 결제승인된 또는 가상계좌 입금예정 금액
						pay_result_status : rsp.status, // 결제상태 옵션 값(클릭하여 자세히보기)
						sub_idx : rsp.name, // 주문명
						pay_successed_at : rsp.paid_at, //(number) 결제승인시각(UNIX timestamp)
					},
					success : function(result) {
						alert('정기결제 등록' + result);
					}
				});
				alert(rsp.paid_at + rsp.paid_amount + rsp.status
						+ rsp.merchant_uid + rsp.name);
				alert($('#customer_id').val());

				$.ajax({
					url : '../order/payment.do', //결제 상태를 확인하고 스케줄러를 호출하는 부분
					type : 'post',
					data : {
						customer_uid : $('#customer_id').val(),
						price : 2, // 첫결제는 포인트사용한 금액이고 여기는 원래구독권가격 넣기
						merchant_uid : rsp.merchant_uid + 1
					},
					success : function(result) {
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

<style>
/*ticket*/
.ticket .item {
	width: 100%;
	padding: 0 20px;
	height: 100%;
	overflow: hidden;
}

.ticket .item-right, .ticket .item-left {
	float: left;
	padding: 20px;
}

.ticket .item-right {
	width: 25%;
	position: relative;
	height: 100%;
	display: inline-grid;
	align-content: stretch;
	justify-content: center;
	align-items: center;
	flex-wrap: nowrap;
	flex-direction: column;
	background: #cde0ff;
}

.ticket .item-right .up-border, .container .item-right .down-border {
	padding: 14px 15px;
	background-color: #fff;
	border-radius: 50%;
	position: absolute;
}

.ticket .item-right .up-border {
	top: -7px;
	right: -16px;
}

.ticket .item-right .down-border {
	bottom: -12px;
	right: -16px;
}

.ticket .item-right .img {
	font-size: 60px;
	text-align: center;
	color: #111;
}

.ticket .item-right .img img {
	width: 56px;
	height: 56px;
	border-radius: 50%;
}

.ticket .item-right .name, .ticket .item-left .event {
	color: #555;
	font-size: 1rem;
	margin-bottom: 9px;
}

.ticket .item-left .event {
	color: #1d68dc;
}

.ticket .item-right .name {
	text-align: center;
	font-size: 1.725rem;
}

.ticket .item-left {
	width: 71%;
	padding: 34px 0px 19px 46px;
	border-left: 3px dotted #999;
	background: #f4f9ff;
	height: 100%;
}

.ticket .item-left .title {
	color: #63a1ff;
	font-size: 34px;
	margin-bottom: 12px;
}

.ticket .item-left .sce {
	margin-top: 5px;
	display: block;
}

.ticket .item-left .sce .icon, .ticket .item-left .sce p, .ticket .item-left .loc .icon,
	.ticket .item-left .loc p {
	float: left;
	word-spacing: 5px;
	letter-spacing: 1px;
	color: #888;
	margin-bottom: 10px;
}

.ticket .item-left .sce .icon, .ticket .item-left .loc .icon {
	margin-right: 10px;
	font-size: 20px;
	color: #666;
}

.ticket .item-left .loc {
	display: block
}

.fix {
	clear: both
}

.ticket .item .tickets, .booked, .cancel {
	color: #fff;
	padding: 6px 14px;
	float: right;
	margin-top: 10px;
	font-size: 18px;
	border: none;
	cursor: pointer;
}

.ticket .item .tickets {
	background: #777;
}

.ticket .item .booked {
	background: #3D71E9;
}

.ticket .item .cancel {
	background: #DF5454;
}

.linethrough {
	text-decoration: line-through;
}

@media only screen and (max-width: 768px) {
	.ticket .item {
		width: 100%;
		margin-right: 20px;
		display: inline-flex;
		justify-content: center;
		flex-direction: column;
		align-content: center;
		align-items: center;
	}
	div.ticket {
		margin: 0 20px auto;
	}
	.ticket .item-left, .ticket .item-right {
		width: 100%;
		text-align: center;
		margin: 0;
		padding: 20px;
	}
	.ticket .item-left {
		border-left: none;
		border-top: 3px dotted #999;
	}
	.ticket .item-right .up-border {
		bottom: -11px;
		left: -16px;
		top: inherit;
		right: inherit;
	}
}

/*======================================
   Start Checkout Form CSS
========================================*/
.shop.checkout {
	padding: 0;
	background: #fff;
	padding-top: 20px;
	padding-bottom: 50px;
}


.shop.checkout .checkout-form h2 {
	font-size: 25px;
	color: #333;
	font-weight: 700;
	line-height: 27px;
}

.shop.checkout .checkout-form p {
	font-size: 16px;
	color: #333;
	font-weight: 400;
	margin-top: 12px;
	margin-bottom: 30px;
}

.shop.checkout .form {
	
}

.shop.checkout .form .form-group {
	margin-bottom: 25px;
}

.shop.checkout .form .form-group label {
	color: #333;
	position: relative;
}

.shop.checkout .form .form-group label span {
	color: #ff2c18;
	display: inline-block;
	position: absolute;
	right: -12px;
	top: 4px;
	font-size: 16px;
}

.shop.checkout .form .form-group input {
	    width: 100%;
    height: 45px;
    line-height: 50px;
    padding: 0 20px;
    border-radius: 8px;
    color: #333 !important;
    border: none;
    background: #ffffff;
    border: 1px solid #c9c9c9;
}

.shop.checkout .form .form-group input:hover {
	
}

.shop.checkout .nice-select {
	width: 100%;
	height: 45px;
	line-height: 50px;
	margin-bottom: 25px;
	background: #F6F7FB;
	border-radius: 0px;
	border: none;
}

.shop.checkout .nice-select .list {
	width: 100%;
	height: 110px;
	overflow: scroll;
}

.shop.checkout .nice-select .list li {
	
}

.shop.checkout .nice-select .list li.option {
	color: #333;
}

.shop.checkout .nice-select .list li.option:hover {
	background: #F6F7FB;
	color: #333;
}

.shop.checkout .form .address input {
	margin-bottom: 15px;
}

.shop.checkout .form .address input:last-child {
	margin: 0;
}

.shop.checkout .form .create-account {
	margin: 0;
}

.shop.checkout .form .create-account input {
	width: auto;
	display: inline-block;
	height: auto;
	border-radius: 100%;
	margin-right: 3px;
}

.shop.checkout .form .create-account label {
	display: inline-block;
	margin: 0;
}

.shop.checkout .order-details {
	position: sticky;
  	top: 90px;
	background: #fff;
	padding: 15px 0 30px 0;
	border: 1px solid #eee;
	border-radius: 8px;
}

.shop.checkout .single-widget {
	margin-bottom: 30px;
}

.shop.checkout .single-widget:last-child {
	margin: 0;
}

.shop.checkout .single-widget h2 {
	position: relative;
	font-size: 15px;
	font-weight: 600;
	padding: 10px 30px;
	line-height: 24px;
	text-transform: uppercase;
	color: #333;
	padding-bottom: 5px;
}

.shop.checkout .single-widget h2:before {
	position: absolute;
	content: "";
	left: 30px;
	bottom: 0;
	height: 2px;
	width: 50px;
	background: #F7941D;
}

.shop.checkout .single-widget .content ul {
	margin-top: 30px;
}

.shop.checkout .single-widget .content ul li {
	display: block;
	padding: 0px 30px;
	font-size: 15px;
	font-weight: 400;
	color: #333;
	margin-bottom: 12px;
}

.shop.checkout .single-widget .content ul li span {
	display: inline-block;
	float: right;
}

.shop.checkout .single-widget .content ul li.last {
	padding-top: 12px;
	border-top: 1px solid #ebebeb;
	display: block;
	font-size: 15px;
	font-weight: 400;
	color: #333;
}

.shop.checkout .single-widget .checkbox {
	text-align: left;
	margin: 0;
	padding: 0px 30px;
	margin-top: 30px;
}

.shop.checkout .single-widget .checkbox label {
	color: #555555;
	position: relative;
	font-size: 14px;
	padding-left: 20px;
	margin-top: -5px;
	font-weight: 400;
	display: block;
	margin-bottom: 15px;
}

.shop.checkout .single-widget .checkbox label:last-child {
	margin-bottom: 0;
}

.shop.checkout .single-widget .checkbox label:hover {
	cursor: pointer;
}

.shop.checkout .single-widget .checkbox label input {
	display: none;
}

.shop.checkout .single-widget .checkbox label::before {
	position: absolute;
	content: "";
	left: 0;
	top: 7px;
	width: 12px;
	height: 12px;
	line-height: 16px;
	border: 1px solid #666;
	border-radius: 100%;
}

.shop.checkout .single-widget .checkbox label::after {
	position: absolute;
	content: "";
	left: 0;
	top: 7px;
	width: 12px;
	height: 12px;
	line-height: 16px;
	border-radius: 100%;
	display: block;
	background: #666;
	transform: scale(0);
	-webkit-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.shop.checkout .single-widget .checkbox label.checked::after {
	opacity: 1;
	visibility: visible;
	transform: scale(1);
}

.shop.checkout .single-widget.payement {
	padding: 0px 38px;
	text-align: center;
	margin-top: 30px;
}

.shop.checkout .single-widget.get-button {
	text-align: center;
	padding: 0px 35px;
}

.shop.checkout .single-widget.get-button .btn {
	height: 46px;
    width: 100%;
    line-height: 19px;
    text-align: center;
    position: relative;
    font-weight: 500;
    font-size: 14px;
    color: #fff;
    background: #333;
    display: inline-block;
    -webkit-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    z-index: 5;
    padding: 13px 32px;
    border-radius: 0px;
    text-transform: uppercase;
}

/*form*/
.page_card {
	position: relative;
	border: 1px solid #eaeaea;
	border-radius: 8px;
	color: gray;
	background: #fff;
	/* width: 100%; */
	text-align: left;
	padding-top: 30px;
	padding-bottom: 30px;
	margin: 0px 15px;
}

/*구독권선택*/
.inputGroup {
	background-color: #fff;
	display: block;
	margin: 10px 0;
	position: relative;
	border: 1px solid #eee;
	border-radius: 0.4rem;
}

.inputGroup label {
	padding: 12px 30px;
	width: 100%;
	display: block;
	text-align: left;
	color: #3C454C;
	cursor: pointer;
	position: relative;
	z-index: 2;
	transition: color 200ms ease-in;
	overflow: hidden;
}

.inputGroup label:before {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	content: "";
	background-color: #ab7442;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%) scale3d(1, 1, 1);
	transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
	opacity: 0;
	z-index: -1;
}

.inputGroup label:after {
	width: 32px;
	height: 32px;
	content: "";
	border: 2px solid #D1D7DC;
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg width='32' height='32' viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5.414 11L4 12.414l5.414 5.414L20.828 6.414 19.414 5l-10 10z' fill='%23fff' fill-rule='nonzero'/%3E%3C/svg%3E ");
	background-repeat: no-repeat;
	background-position: 2px 3px;
	border-radius: 50%;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	transition: all 200ms ease-in;
}

.inputGroup input:checked ~ label {
	color: #fff;
	border-radius: 0.4rem;
}

.inputGroup input:checked ~ label:before {
	transform: translate(-50%, -50%) scale3d(56, 56, 1);
	opacity: 1;
}

.inputGroup input:checked ~ label:after {
	background-color: #8b470a;
	border-color: #8b470a;
}

.inputGroup input {
	width: 32px;
	height: 32px;
	order: 1;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	visibility: hidden;
}

/* 이용안내 - 그대로 가져옴*/
.cafePay.viewContents .boxWhite>.guideInfo {
    margin: 2px 0 -3px;
    padding-top: 0;
    border: 0;
    background: none;
    padding: 30px 0 0 0;
}
.guideInfo .titGuide {
    position: relative;
    padding: 0 0 15px 26px;
    color: #202020;
    font-size: 1.8rem;
    font-weight: 700;
    line-height: 20px;
    border-bottom: 1px solid #EAEAEA;
}
.cafePay.viewContents .boxWhite>.guideInfo .tit {
    display: block;
    margin-top: 22px;
    color: #202020;
}

.cafePay.viewContents .boxWhite>.guideInfo .listType01 {
    margin-top: 13px;
}

.cafePay.viewContents .boxWhite>.guideInfo .listType01>li {
    margin-top: 6px;
}
.listType01>li {
    position: relative;
    margin-top: 12px;
    padding-left: 6px;
    line-height: 1.5;
}
.listType01>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 11px;
    left: 0;
    width: 2px;
    height: 2px;
    background: gray;
}

.guideInfo .listType01+.tit {
    margin-top: 43px;
}
.guideInfo .tit {
    display: block;
    margin-top: 22px;
    color: #202020;
}
/*======================================
   End Checkout Form CSS
========================================*/

</style>
</head>
<body style="background: #f8f8f8;">

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


	<!-- checkout -->
	<section class="shop checkout section py-5">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title text-center" id="cafe_snsList">
						<h1 class="display-6 mb-5">카페 패스 구독하기</h1>
					</div>
				</div>

				<div class="col-lg-8 col-12">
					<div class="checkout-form">

						<!-- ticket -->
						<section class="shop ticket section mb-5">
							<div class="row g-4 page_card">
								<div class="col-12">
									<div class="item">
										<div class="item-right">
											<h2 class="img">
												<img src="https://static-file.jejupass.com/download/816775"
													alt="">
											</h2>
											<p class="name">전옥주 님</p>
											<span class="up-border"></span> <span class="down-border"></span>
										</div>
										<!-- end item-right -->

										<div class="item-left">
											<div class="row"
												style="display: inline-grid; align-items: center; align-content: center; height: 100%;">
												<!--   상세정보 -->
												<div class="col-12">

													<p class="event">아직 카페패스가 없네요!</p>
													<h2 class="title">카페패스</h2>

													<!-- <div class="sce">
														<div class="icon">
															<i class="fa fa-table"></i>
														</div>
														<p>
															Monday 15th 2016 <br> 15:20Pm &amp; 11:00Am
														</p>
													</div> -->
												</div>

												<!-- 티켓qr -->
												<!-- <div class="col-md-6 col-12">
					
													<button class="tickets">Tickets</button>
												</div> -->

												<!-- end item-right -->
											</div>


										</div>
										<!-- col -->

									</div>
								</div>
						</section>
						<!-- ticket -->


						<!-- Form -->
						<form class="form" method="post" action="#">
							<div class="row page_card">
								<!-- 패스권선택 -->
								<div class="col-12">
									<div class="form-group">
										<label>패스권선택</label><br /> <small>아메리카노 선택권(일부가게
											할인권으로도 가능)</small>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="inputGroup">
										<input id="radio1" name="radio" type="radio" /> 
										<label for="radio1">10잔&nbsp;&nbsp;&nbsp;<small>22,000원</small></label>

									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-12">
									<div class="inputGroup">
										<input id="radio2" name="radio" type="radio" /> <label
											for="radio2">20장&nbsp;&nbsp;&nbsp;<small>42,000원</small>
										</label>

									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-12">
									<div class="inputGroup">
										<input id="radio3" name="radio" type="radio" /> <label
											for="radio3">30장&nbsp;&nbsp;&nbsp;<small>59,000원</small></label>

									</div>
								</div>
								
								<div class="col-12">
									<div class="form-group">
										<label>사용할포인트</label><br /> 
										<small>사용가능포인트<span>1500point</span></small>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-group">
										<input type="number" name="address" placeholder="" required="포인트입력">
									</div>
								</div>

							</div>
						</form>
						<!--/ End Form -->


						<!-- 이용안내 -->
						<div class="row page_card my-5">
							<!-- 패스권선택 -->
							<div class="col-12">

								<div class="guideInfo">
									<h3 class="titGuide">이용안내</h3>
									<strong class="tit">이용권 구매 안내</strong>
									<ul class="listType01">
										<li>이용권은 구매 후 마이페이지에서 사용 시작 시 이용 가능합니다.</li>
										<li>이용권은 구매자 본인 계정으로만 이용 가능합니다.(1인 1잔 또는 1인 1이용권)</li>
										<li>이용권은 양수, 양도가 불가합니다.</li>
										<li>이용권은 제휴 매장에서만 이용 가능합니다.</li>
										<li>당일 동일 업체 재사용 불가합니다.(업체 당 1일 1회)</li>
										<li>다른 할인 쿠폰과 중복으로 사용할 수 없습니다.</li>
										<li>제휴 매장 별 혜택은 예고 없이 변경될 수 있습니다.</li>
										<li>제주 지역 특성상 영업시간이 유동적이므로 전화 후 방문하시길 바랍니다.</li>
									</ul>
									<strong class="tit">이용권 환불 규정</strong>
									<ul class="listType01">
										<li>60일 이상 시작하지 않을 경우 이용권은 자동환불 됩니다.</li>
										<li>시작하지 않은 이용권은 60일 이 내 환불 가능합니다.</li>
										<li>이용권 시작 후 유효기간 내 사용 이력이 없는 경우 환불 가능합니다.</li>
										<li>사용 이력이 없더라도 유효기간 종료 시 환불 불가합니다.</li>
										<li>코드 오등록으로 인한 환불 및 재발급 불가합니다.</li>
									</ul>
								</div>

							</div>
						</div>
						<!-- //이용안내 -->
					</div>
				</div>
				<!-- // -->

				<!-- 결제 정보창 -->
				<div class="col-lg-4 col-12">
					<div class="order-details">
						<!-- Order Widget -->
						<div class="single-widget">
							<h2>선택한 이용권 정보</h2>
							<div class="content">
								<ul>
									<li>결제금액<span>59,000원</span></li>
									<li>30잔<span>구매일로부터 30일</span></li>
									
									<li>(+)포인트 & 쿠폰 적용<span>1,200원</span></li>
									
									<!-- ------------------------------------------------- -->
									<li class="last">최종 결제금액<span>57,800원</span></li>
								</ul>
							</div>
						</div>
						<!--/ End Order Widget -->
						<!-- Order Widget -->
						<div class="single-widget">
							<h2>Coffee Pass</h2>
							<div class="content">
								<ul>
									<li><small>1잔당 기본음료(아메리카노 기준, 일부가게 음료 할인 가능)
									를 이용할 수 있습니다.</small></li>
									<li><small>자세한 사항은 해당 가게에 문의바랍니다.</small></li>
									<!-- ------------------------------------------------- -->
									<li><small>검색을 통해 찾으시거나 상세정보에 아래의 베너가 제휴업체입니다<small></li>
								</ul>
							</div>
						</div>
						<!--/ End Order Widget -->
						<!-- Payment Method Widget -->
						<div class="single-widget payement">
							<div class="content">
								<img src="<%=request.getContextPath() %>/resources/img/패스가입베너.png" alt="#" class="img-fluid">
							</div>
						</div>
						<!--/ End Payment Method Widget -->
						<!-- Button Widget -->
						<div class="single-widget get-button">
							<div class="content">
								<div class="button">
									<a href="#" class="btn">구독권구매</a>
								</div>
							</div>
						</div>
						<!--/ End Button Widget -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //checkout -->


	<h5>이용권</h5>
	<table class=pay border="1">
		<tr>
			<td rowspan="2" class="pay_detail">이용권</td>
			<td>월 기본 제공</td>
			<td>30</td>
		</tr>
		<tr>
			<td>남은 커피패스 이용횟수</td>
			<td id="pay_coupon">3</td>
		</tr>
	</table>
	<div>
		<input type="text" id="customer_id" value="madcatz92">
	</div>
	<div class="btns">
		<input type="button" id="check1" value="구매" onclick="kakaopay();">
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	<script>
	//플로팅메뉴

		$(document).ready(function() {
			var currentPosition = parseInt($(".shop.checkout .order-detail").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop();
				console.log(position);
				$(".shop.checkout .order-detail").stop().animate({
					"top" : position + currentPosition +"px"
				}, 1000);
			});
		});
	</script>

</body>
</html>