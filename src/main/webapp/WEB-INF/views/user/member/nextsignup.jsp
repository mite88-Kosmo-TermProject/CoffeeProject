<%--
/**
회원가입 페이지
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

<link
	href="<%=request.getContextPath()%>/resources/assets/css/joining.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/css/maining.css"
	rel="stylesheet">
</head>


<style>
P, h2 {
	margin: 0;
	padding: 0;
}

@media screen and (max-width:480px) {
	section {
		padding: 20px 10px;
	}
}

.text-center {
	text-align: center;
}

form {
	margin-top: 20px;
}

h1 {
	font-size: 15px;
	margin-bottom: 0;
}

.col-7 {
	display: flex;
	justify-content: center;
}

.member_selec {
	width: 100%;
	height: auto;
	padding: 15px 20px 5px 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

input[type='date'] {
	width: 100%;
	height: auto;
	padding: 0 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

.whether {
	width: 100%;
	height: auto;
	padding: 15px 20px 5px 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

input[type='tel'], .call select {
	width: 50%;
	height: auto;
	padding: 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

.call label {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.member_selec label {
	float: left;
}

.overlap-wrap {
	position: absolute;
	bottom: 8px;
	right: 10px;
}

.overlap {
	border: 1px solid rgb(185, 185, 185);
	height: 100%;
	color: rgb(139, 139, 139);
	font-size: 13px;
	font-family: 'NotokrM';
}

.overlap:hover {
	border: 1px solid rgb(112, 112, 112);
	color: rgb(77, 77, 77);
}

.form-select {
	width: 100%;
	padding: 10px 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
	font-family: 'NotokrR';
	font-size: 18px;
	background: url(./cyto_img/select_arrow.png) no-repeat 97% 50%/20px auto;
}

.form-select option {
	background-color: white;
}

.mt-20 {
	margin-top: 10px !important;
}

.essential {
	color: orangered;
	font-size: 20px;
}

input {
	font-size: 18px;
}

.step01_con .row {
	margin-top: 0;
}

.step01_con .row .col-6 {
	padding-top: 0;
}

input[type="date"] {
	-webkit-appearance: textfield;
	-moz-appearance: textfield;
}

.office, .home_call {
	display: flex;
	justify-content: space-between;
}

.upload-photo {
	width: 10%;
	padding: 5px 20px;
	border: 1px solid rgb(185, 185, 185);
	height: 100%;
	color: rgb(139, 139, 139);
	font-size: 13px;
	font-family: 'NotokrM';
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
}

.upload-photo:hover {
	border: 1px solid rgb(112, 112, 112);
	color: rgb(77, 77, 77);
}
/* input[type='file']{
			display: none;
		} */
</style>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->

		<!-- Nav -->
		<!-- login -->

		<!-- Section 01 -->
		<section id="join-wrapper"
			class="wrapper Latest_data more-services top_100"
			style="background-color: #F7F7F7; font-family: 'NotokrR';">
			<div class="container ">
				<div class="row">
				<div class="col-2"></div>
					<div class="col-8">
						<div id="join_step01_header" class="text-center">
						<br>
							<h2>회원가입</h2>
							<p>
								<span class="essential" style="font-weight: 900;">*</span> 는
								필수입력사항입니다.
							</p>
						</div>
						<hr style="opacity: 0.5;">
						<br>
						<div class="col-12">
							<div class="step01_con">
								<form action="" style="position: relative;" autocomplete="off">

									<div class="row mt-20">
										<div class="col-6">
											<h1>
												이름<span class="essential">*</span>
											</h1>
											<label for="" style="font-size: 15px;"> <input
												type="text" style="height: 50px;">
											</label>
										</div>
										<div class="col-6">
											<h1>
												생년월일 <span
													style="font-size: 11px; font-family: 'NotokrL'; color: orangered;">＊원로회원
													필수</span>
											</h1>
											<label for="" style="font-size: 15px;"> <input
												type="date"
												style="height: 50px; font-family: 'NotokrL'; width: 100%;">
											</label>
										</div>
									</div>




									<!-- 주소 -->

									<!--
											<div class="col-12">
												<div style="position: relative ;">
													<h1>지역명<span class="essential">*</span></h1>
													<label class="office" for="" style="font-size: 15px ;">
														<select class="form-select" name="" id="" style="background-color:white ; width: 20%;">
															<option value="">서울경기</option>
															<option value="">제주</option>
															<option value="">충청</option>
															<option value="">대구경북</option>
															<option value="">부산경남</option>
															<option value="">호남</option>
															<option value="">강원</option>
														</select>
														<input type="text" style="height: 50px; width: 78%;">
													</label>
												</div>
											</div>
											-->
									<!-- 주소 끝  -->


									<!-- 아이디 -->
									<div style="position: relative;">
										<h1>
											아이디<span class="essential">*</span>
										</h1>
										<label for="" style="font-size: 15px;"> <input
											type="text" size="50" style="height: 50px;">
										</label>
										<div class="overlap-wrap">
											<button class="btn overlap">중복체크</button>
										</div>
									</div>
									<!-- 아이디 끝 -->

									<!-- 회원구분1 -->
									<div class="mt-20">
										<h1>
											회원구분1<span class="essential">*</span>
										</h1>
										<div class="member_selec">
											<label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec01"> <input type="radio" id="selec01"
												name="member_selec_01">지
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec02"> <input type="radio" id="selec02"
												name="member_selec_01">상
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec03"> <input type="radio" id="selec03"
												name="member_selec_01">원
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec04"> <input type="radio" id="selec04"
												name="member_selec_01">짱
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec05"> <input type="radio" id="selec05"
												name="member_selec_01">1
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec06"> <input type="radio" id="selec06"
												name="member_selec_01">2
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec07"> <input type="radio" id="selec07"
												name="member_selec_01">3
											</label>
										</div>
									</div>
									<!-- 회원구분1 끝 -->

									<!-- 회원구분2 -->
									<div class="mt-20">
										<h1>
											회원구분2<span class="essential">*</span>
										</h1>
										<div class="member_selec">
											<label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec02_02"> <input type="radio"
												id="selec02_02" name="member_selec_02">상
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec02_03"> <input type="radio"
												id="selec02_03" name="member_selec_02">원
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec02_04"> <input type="radio"
												id="selec02_04" name="member_selec_02">짱
											</label> <label style="font-size: 14px; font-family: 'NotokrL'"
												for="selec02_01"> <input type="radio"
												id="selec02_01" name="member_selec_02">짱
											</label>
										</div>
									</div>
									<!-- 회원구분 2 끝 -->


									<div class="mt-20">
										<h1>
											비밀번호<span class="essential">*</span>
										</h1>
										<label for="" style="font-size: 15px;"> <input
											type="password" size="50" style="height: 50px;">
										</label>
									</div>



									<div class="row mt-20">
										<div class="col-6">
											<h1>
												E-mail<span class="essential">*</span>
											</h1>
											<label for="" style="font-size: 15px;"> <input
												type="text" size="50" style="height: 50px;">
											</label>
										</div>
									</div>

									<!-- 번호 -->
									<div class="col-12 call mt-20">
										<h1>
											전화번호<span class="essential">*</span>
										</h1>
										<label for="" style="font-size: 15px;" class="home_call">
											<select class="form-select" name="" id=""
											style="background-color: white; height: 50px; padding: 0 0 0 20px;">
												<option value="">02</option>
												<option value="">051</option>
												<option value="">053</option>
												<option value="">032</option>
												<option value="">062</option>
												<option value="">042</option>
												<option value="">052</option>
												<option value="">044</option>
												<option value="">031</option>
												<option value="">033</option>
												<option value="">043</option>
												<option value="">063</option>
												<option value="">161</option>
												<option value="">054</option>
												<option value="">055</option>
												<option value="">064</option>
												<option value="">070</option>
										</select> - <input type="tel" style="height: 50px;"> - <input
											type="tel" style="height: 50px;">
										</label>
									</div>

									<div class="col-12 call mt-20">
										<h1>
											휴대폰<span class="essential">*</span>
										</h1>
										<label for="" style="font-size: 15px;"> <input
											type="tel" size="20" style="height: 50px;"> - <input
											type="tel" size="20" style="height: 50px;"> - <input
											type="tel" size="20" style="height: 50px;">
										</label>
									</div>
									<!-- 번호 끝 -->

									<!-- 주소 -->
									<div style="position: relative;">
										<h1>
											우편번호<span class="essential">*</span>
										</h1>
										<label for="" style="font-size: 15px;"> <input
											type="text" size="50" style="height: 50px;">
										</label>
										<div class="overlap-wrap">
											<button class="btn overlap">우편번호검색</button>
										</div>
									</div>

									<div class="row mt-20">
										<div class="col-6">
											<div style="position: relative;">
												<h1>
													주소(동,읍,면)<span class="essential">*</span>
												</h1>
												<label for="" style="font-size: 15px;"> <input
													type="text" size="50" style="height: 50px;">
												</label>
											</div>
										</div>
										<div class="col-6">
											<div style="position: relative;">
												<h1>
													상세주소<span class="essential">*</span>
												</h1>
												<label for="" style="font-size: 15px;"> <input
													type="text" size="50" style="height: 50px;">
												</label>
											</div>
										</div>
									</div>
									<!-- 주소 끝 -->

									<div class="mt-20">
										<h1>
											성별<span class="essential">*</span>
										</h1>
										<div class="member_selec">
											<label style="font-size: 13px;" for="male"> <input
												type="radio" id="male" name="gender">남자
											</label> <label style="font-size: 13px;" for="famale"> <input
												type="radio" id="famale" name="gender">여자
											</label>
										</div>
									</div>

								</form>


								<br> <br>
								<div class="col">
									<div class="join_btn">
										<button class="btn btn-danger">취소</button>
										<button onclick="f_link(); return false;"
											class="btn btn-primary">다음</button>
									</div>
								</div>
							</div>
							<!--join_con end-->
						</div>
						<!--col-12 end-->
					</div>
					
					<div class="col-2"></div>
				</div>
				<!--row end-->
			</div>
			<!--container end-->
		</section>




		<a href="" class="top"> <img src="./cyto_img/click_top.png" alt="">
		</a>
	</div>





	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
</body>

</html>