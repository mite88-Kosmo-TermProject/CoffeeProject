<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html lang="en" class="light-style customizer-hide" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>제휴신청</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/admin/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/css/pages/page-auth.css" />
<!-- 개인 css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/css/style.css" />

<!-- Helpers -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/js/config.js"></script>
</head>

<body class="login">
	<div class="container">
		<div class="authentication-wrapper authentication-basic container-p-y">

			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">

						<!-- logo -->
						<div class="app-brand justify-content-center">
							<a href="index.html" class="app-brand-link gap-2"> <span
								class="app-brand-logo demo"> <img alt="logo"
									src="<%=request.getContextPath()%>/resources/logo.gif"
									style="width: 35px;">
							</span> <span class="app-brand-text demo text-body fw-bolder">Coffee
									Pass 제휴신청</span>
							</a>
						</div>

						<!-- 내용 -->
						<p class="mb-4">제휴신청 후 계약이 진행됩니다. 완료되면 승인이됩니다 최대7일소요됩니다</p>
						<form id="join" class="mb-3 alliance-form" action="<%= request.getContextPath() %>/admin/alliance_Result.do" method="POST">

							
							<div class="mb-3">
								<div class="form-group relative">
									<input class="form-control input-lg mb-3" id="mem_id" name="mem_id"
										placeholder="아이디" required="" type="text">
									<i class='bx bxs-user'></i>
								</div>
								<small id="id_check"></small>
							</div>
							
							<div class="mb-3">
								<div class="form-group relative">
									<input class="form-control input-lg mb-3" id="mem_pw" name="mem_pw"
										placeholder="Password" required="" type="password">
									<i class='bx bxs-key'></i>
								</div>
							</div>
							
							<div class="mb-3">
								<div class="form-group relative">
									<input class="form-control input-lg mb-3" id="mem_pw2" name="mem_pw2"
										placeholder="Password" required="" type="password">
									<i class='bx bxs-key'></i>
								</div>
							</div>
							
							<div class="mb-3">
								<div class="form-group relative">
									<input class="form-control input-lg mb-3" id="mem_name" name="mem_name"
										placeholder="유저명" required="" type="text">
									<i class='bx bxs-user'></i>
								</div>
							</div>
							
							<div class="mb-3">
								<div class="form-group relative">
									<input class="form-control input-lg mb-3" id="mem_email" name="mem_email"
										placeholder="이메일" required="" type="email">
									<i class='bx bx-envelope'></i>
									<small id="email_check"></small>
								</div>
							</div>
							
							<div class="mb-3">
								<div class="form-group relative">
									<input class="form-control input-lg mb-3" id="mem_phone" name="mem_phone"
										placeholder="휴대폰번호" required="" type="text">
									<i class='bx bx-phone'></i>
								</div>
							</div>
							
							<div class="mb-3">
								<div class="form-group relative">
									<div class="form-check form-check-inline">
									  <input class="form-check-input sr-only" type="radio" name="mem_gender" value="남" required>
									  <label class="form-check-label" for="inlineRadio1">남</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input sr-only" type="radio" name="mem_gender" value="여" >
									  <label class="form-check-label" for="inlineRadio2">여</label>
									</div>

									<i class='bx bx-male-female'></i>
								</div>
							</div>
							
							
							<button type="button" id="join_btn" class="btn btn-primary d-grid w-100">신청하기</button>
							
							
						</form>
					</div>
				</div>


				<!--  -->

			</div>
		</div>
	</div>


	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/jquery/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/popper/popper.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/js/main.js"></script>

	<!-- Page JS -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<script type="text/javascript">
	$(function(){
		var url_origin = $(location).attr('origin');
		
		var idResult = "";
		var emailResult = "";
		$("#join_btn").click(function(){
			if($("#mem_id").val()==""){
				alert("아이디를 입력 해주세요.")
				$("#mem_id").focus();
				return false;
			}else if($("#mem_pw").val()=="" || $("#mem_pw2").val()==""){
				alert("비밀번호를 입력 해주세요.")
				$("#mem_pw").focus();
				return false;
			} else if($("#mem_name").val()==""){
				alert("이름을 입력 해주세요.")
				$("#mem_name").focus();
				return false;
			} else if($("#mem_email").val()==""){
				alert("이메일을 입력 해주세요.")
				$("#mem_email").focus();
				return false;
			} else if($("#mem_phone").val()==""){
				alert("휴대폰번호를 입력 해주세요.")
				$("#mem_phone").focus();
				return false;
			}
			else if(!$('input:radio[name=mem_gender]').is(':checked')){
				alert("성별을 선택해주세요");
				return false;
			}
			//비밀번호
			else if($("#mem_pw").val() !== $("#mem_pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#mem_pw").val("").focus();
				$("#mem_pw2").val("");
				return false;
			}else if ($("#mem_pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#mem_pw").val("").focus();
				return false;
			}
			
			console.log(emailResult);
			if(idResult=='Y' && emailResult=='Y' ){
				alert("신청이 완료 되었습니다.");
				//return false;
				$('#join').submit();
			}
		})
		
		$("#mem_id").keyup(function() {
			$.ajax({
				url : url_origin+"/CoffeeProject/member/idCheck.do",
				type : "POST",
				data : {
					mem_id : $("#mem_id").val()
				},
				success : function(cnt) {
					if (cnt == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#id_check").css("color","red");
						idResult = "N";
						console.log(idResult);
						$("#joinBtn").attr("disabled", true);
					} else {
						$("#id_check").html("사용 가능한 아이디 입니다.");
						$("#id_check").css("color","blue");
						idResult = "Y";
						console.log(idResult);
						if(emailResult=="Y" && idResult=="Y"){
							console.log(emailResult+"RR"+idResult+"EE");	
							$("#joinBtn").removeAttr("disabled");
						}
					}
				},  
				error:function(request,status,error){       
					 alert(request.status);      
				 }
			
			})
		});
		
		$("#mem_email").keyup(function(){
			$.ajax({
				url : "../member/emailCheck.do",
				type : "POST",
				data : {
					mem_email : $("#mem_email").val()
				},
				success : function(cnt) {
					console.log(cnt+"!!");
					if (cnt == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
						$("#email_check").css("color","red");
						emailResult = "N";
						console.log(emailResult);
						$("#joinBtn").attr("disabled", true);
					} else {
						$("#email_check").html("사용 가능한 이메일 입니다.");
						$("#email_check").css("color","blue");
						emailResult = "Y";
						console.log(emailResult);
						if(emailResult=="Y" && idResult=="Y"){
							console.log(emailResult+"RR"+idResult+"EE");	
							$("#joinBtn").removeAttr("disabled");
						}
					}
				},
			})
		});
		
	})
	</script>

</body>
</html>
