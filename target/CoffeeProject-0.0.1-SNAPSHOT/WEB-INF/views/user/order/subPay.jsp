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
<link href="<%=request.getContextPath()%>/resources/assets/css/pay.css"
	rel="stylesheet">
</head>

<body>

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
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>