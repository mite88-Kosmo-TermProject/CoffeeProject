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
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->

<link href="<%=request.getContextPath()%>/resources/assets/css/pay.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/payment.css"
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
	let paymentPrice = 0;
	let subPaymentPrice = 0;
	let subName = '';
	
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
	//구독권 클릭시 
	function fnProductSelect(name, price, cup) {
		subName = name;
		
		document.getElementById("selectPrice").innerHTML = Number(price).toLocaleString("ko-KR", { style : 'currency', currency: 'KRW' });
		document.getElementById("selectCup").innerHTML = cup+'잔'
		
		subPaymentPrice = price;
		paymentPrice = (Number(price) - document.getElementById("pointInput").value);
		console.log(paymentPrice);
		
		document.getElementById("payment").innerHTML 
			= (Number(price) - document.getElementById("pointInput").value).toLocaleString("ko-KR", { style : 'currency', currency: 'KRW' });
	}
	
	function usingPoint(val) {
		let point = Number(document.getElementById("remitPoint").innerHTML);
		let value = val.replace(/,/g, "");
		if(value<=point) {
			document.getElementById("usePoint").innerHTML = Number(val).toLocaleString("ko-KR");
		}
		else {
			document.getElementById("usePoint").innerHTML = Number(point).toLocaleString("ko-KR");
			document.getElementById("pointInput").value = point;
		}
		/* document.getElementById("payment").innerHTML 
			=  - document.getElementById("pointInput").value; */
	}
	
	//회원정보 dto 로 가져옴 (결제 안내창에 뿌려주고 사용)
	function kakaopay() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp56165372');
		IMP.request_pay({
			pg : "kakaopay", // 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자 누락되거나 매칭되지 않는 경우 관리자 콘솔에서 설정한 기본PG가 호출됨 값 형식: [PG사 코드값] 또는 [PG사 코드값].[PG사 상점아이디]
			pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
			merchant_uid : 'merchant_'+ new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호. 이미 결제가 승인 된(status: paid) merchant_uid로는 재결제 불가
			name : subName, //주문명 (구독권 이름)
			amount : paymentPrice, // 포인트등을 사용한 첫 결제금액
			customer_uid : '${dto.mem_id }', //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
			buyer_email : '${dto.mem_email }', // 주문자 이메일[페이먼트월 필수]
			buyer_name : '${dto.mem_name }', //주문자명
			buyer_tel : '${dto.mem_phone }' // 주문자 연락처(누락되거나 공백일때 일부 PG사[엑심베이]에서 오류 발생)
		}, function(rsp) {
			if (rsp.success) {
				console.log(rsp);
				
				$.ajax({
					url : '../order/insertSubscribe.do', //DB에 구독정보 등록하는 부분..
					type : 'post',
					data : {
						mem_id : '${dto.mem_id }', //고객 아이디 (빌링키)
						pay_import_key : rsp.imp_uid, // 아임포트 고유 결제번호
						pay_idx : rsp.merchant_uid, // 가맹점에서 생성/관리하는 고유 주문번호
						pay_price : rsp.paid_amount, // (number) 결제금액 결제승인된 또는 가상계좌 입금예정 금액
						pay_result_status : rsp.status, // 결제상태 옵션 값(클릭하여 자세히보기)
						sub_name : rsp.name, // 주문명
						pay_successed_at : rsp.paid_at, //(number) 결제승인시각(UNIX timestamp)
						pay_case : rsp.pg_provider, //결제한 pg사
						buyer_email : rsp.buyer_email, 
						buyer_name : rsp.buyer_name,
						buyer_tel : rsp.buyer_tel,
						
						/* 응답값들
						apply_num: ""
						bank_name: null
						buyer_addr: ""
						buyer_email: "madcats92@gmail.com"
						buyer_name: "이준희"
						buyer_postcode: ""
						buyer_tel: "01043168802"
						card_name: null
						card_number: ""
						card_quota: 0
						currency: "KRW"
						custom_data: null
						customer_uid: "madcatz"
						imp_uid: "imp_416388481383"
						merchant_uid: "merchant_1661228384531"
						name: "CoffeePass5잔"
						paid_amount: 12000
						paid_at: 1661228412
						pay_method: "point"
						pg_provider: "kakaopay"
						pg_tid: "T30455640f56191586d2"
						pg_type: "payment"
						receipt_url: "https://mockup-pg-web.kakao.com/v1/confirmation/p/T30455640f56191586d2/435a11771e7dacb842767a9650e0e63f495ceafa97d595fccaef4c4699711769"
						status: "paid"
						success: true 
						*/
						
					},
					success : function(result) {
						alert('정기결제 등록' + result);
					}
				});
				alert("잡다한 결과값 ="+rsp.paid_at + rsp.paid_amount + rsp.status
						+ rsp.merchant_uid + rsp.name);
				alert("결제한 아이디 ="+ '${dto.mem_id }');

				$.ajax({
					url : '../order/payment.do', //결제 상태를 확인하고 스케줄러를 호출하는 부분
					type : 'post',
					data : {
						customer_uid : '${dto.mem_id }',
						price : subPaymentPrice, // 첫결제는 포인트사용한 금액이고 여기는 원래구독권가격 넣기
						merchant_uid : rsp.merchant_uid + 1,
						sub_name : rsp.name,
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

</head>
<body style="background: #f8f8f8;">

<%-- 	<h5>이용권</h5>		
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
				<td name="price${loop.index }">${dto.sub_price }</td> 
				<div name="cup">${dto.sub_coffee_num }</div>  
				<div name="oneCup"></div> 
			</span>
		</c:forEach>
		<tr>
			<td>남은 커피패스 이용횟수</td>
			<td id="pay_coupon">3</td>
		</tr>

	<div id="selectName">
		
	</div>
	<div id="selectPrice">
	
	</div>
	<div id="selectCup">
	
	</div>  --%>
	<div>
		<input type="text" id="customer_id" value="madcatz92">
	</div>	
	
	<input type="button" id="check1" value="구매" onclick="kakaopay();">
	<div>
		${dto.mem_id }, 
		 ${dto.mem_case }, ${dto.mem_pw }, ${dto.mem_name }, ${dto.mem_nickname }, 
		 ${dto.mem_phone },
		${dto.mem_email }, ${dto.mem_gender },  ${dto.mem_regidate }, ${dto.mem_point }
		
	
	</div>
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
											<p class="name">${dto.mem_name } 님</p>
											<span class="up-border"></span> <span class="down-border"></span>
										</div>
										<!-- end item-right -->

										<div class="item-left">
											<div class="row"
												style="display: inline-grid; align-items: center; align-content: center; height: 100%;">
												<!--   상세정보 -->
												<div class="col-12">

													<h2 class="title">카페패스</h2>
													<p class="event">아직 카페패스가 없네요!</p>

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
										<label>&nbsp;&nbsp;&nbsp;&nbsp;패스권선택</label><br /> <small>&nbsp;&nbsp;&nbsp;&nbsp;아메리카노 선택권(일부가게
											할인권으로도 가능)</small>
									</div>
								</div>
								
									<c:forEach items="${lists }" var="list" varStatus="loop">
										<div class="col-lg-6 col-md-6 col-12" onclick="fnProductSelect('${list.sub_name }', '${list.sub_price }','${list.sub_coffee_num }');">
											<div class="inputGroup">
												<%-- <div name="subIdx" style="display:none">${list.sub_idx }</div> --%>
												<%-- <input type="hidden" name="subIdx" value=${list.sub_idx }> --%>
												<input id="radio${loop.index }" name="radio" type="radio" /> 
												<label for="radio${loop.index }"><strong name="cup">${list.sub_coffee_num }</strong>&nbsp;&nbsp;&nbsp;
												<span name="price">${list.sub_price }</span>
												<div><small>한 잔당 가격&nbsp;&nbsp;&nbsp;</small><small name="oneCup"></small></div></label>
											</div>
										</div>
									</c:forEach>
							
								
								<!-- <div class="col-lg-6 col-md-6 col-12">
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
								</div> -->
								
								<div class="col-12">
									<div class="form-group">
										<label>&nbsp;&nbsp;&nbsp;&nbsp;사용할포인트</label><br /> 
										<span>&nbsp;&nbsp;&nbsp;&nbsp;사용가능포인트&nbsp;:&nbsp;&nbsp;<b id="remitPoint" >${dto.mem_point }</b><small>Point</small></span>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-group">
										<input placeholder=0 type="number" id="pointInput" required="포인트입력" onkeyup="usingPoint(this.value);">
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
									<li>결제금액<span><b id="selectPrice">￦0</b></span></li>
									<li>구매일로부터 30일<span><b id="selectCup">0잔</b></span></li>
									
									<li>(-)포인트 & 쿠폰 적용<span id="usePoint">0</span></li>
									
									<!-- ------------------------------------------------- -->
									<li class="last">최종 결제금액<span><b id="payment">￦0</b></span></li>
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
						<!--/ End Payment Method Widget -->
						<!-- Button Widget -->
						<div class="single-widget get-button">
							<div class="content">
								<div class="button">
									<input class="btn" type="button" id="check1" value="구독권구매" onclick="kakaopay();">
									<!-- <a href="#" class="btn">구독권구매</a> -->
								</div>
							</div>
						</div>
						<!--/ End Button Widget -->
						<!--/ End Order Widget -->
						<!-- Payment Method Widget -->
						<div class="single-widget payement">
							<div class="content">
								<img src="<%=request.getContextPath() %>/resources/img/패스가입베너.png" alt="#" class="img-fluid">
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //checkout -->
	


<!-- 	<h5>이용권</h5>
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
		
	</div>
	<div class="btns">
		<input type="button" id="check1" value="구매" onclick="kakaopay();">
	</div> -->

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>
</html>