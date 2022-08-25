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

<title>login</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/img/icon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
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
                <a href="index.html" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                    <img alt="logo" src="<%=request.getContextPath()%>/resources/logo.gif" style="width: 35px;">
                  </span>
                  <span class="app-brand-text demo text-body fw-bolder">Coffee Pass</span>
                </a>
              </div>

						<!-- 내용 -->
						<div class="login-container-wrapper clearfix">

							<ul class="switcher clearfix">
								<li class="first logo active" data-tab="admin"><a>관리자</a></li>
								<li class="second logo" data-tab="storeowner"><a>점주관리자</a></li>
							</ul>
							<div class="tab-content" style="padding: 0px;">

								<!-- 관리자 -->
								<div class="tab-pane active" id="admin">
								
									<form class="form-horizontal login-form case1" action="<%= request.getContextPath() %>/admin/loginAction.do">
										<input type="hidden" name="mem_case" value="4">
										<div class="form-group relative">
											<input class="form-control input-lg mb-3" id="mem_id" name="mem_id"
												placeholder="아이디" required="" type="text">
											<i class='bx bxs-user'></i>
										</div>
										<div class="form-group relative">
											<input class="form-control input-lg mb-3" id="mem_pw" name="mem_pw"
												placeholder="비밀번호" required="" type="password">
											<i class='bx bxs-key'></i>
										</div>
										<div class="form-group">
											<button class="btn btn-success btn-lg mb-3 btn-block"
												type="submit">Login</button>
										</div>
										<!-- <div class="checkbox checkbox-success">
											<input id="stay-sign" type="checkbox"> <label
												for="stay-sign">Stay signed in</label>
										</div> -->
										
										<div class="text-center">
											<label><a href="#">Forgot your password?</a></label>
										</div>
									</form>
								</div>


								<!-- 점주관리자 -->
								<div class="tab-pane" id="storeowner">
									<form class="form-horizontal login-form case2" action="<%= request.getContextPath() %>/admin/loginAction.do">
										<input type="hidden" name="mem_case" value="2">
										<div class="form-group relative">
											<input class="form-control input-lg mb-3" id="mem_id" name="mem_id"
												placeholder="아이디" required="" type="text">
											<i class='bx bxs-user'></i>
										</div>
										<div class="form-group relative">
											<input class="form-control input-lg mb-3" id="mem_pw" name="mem_pw"
												placeholder="비밀번호" required="" type="password">
											<i class='bx bxs-key'></i>
										</div>
										<div class="form-group">
											<button class="btn btn-success btn-lg mb-3 btn-block"
												type="submit">Login</button>
										</div>
										<!-- <div class="checkbox checkbox-success">
											<input id="stay-sign" type="checkbox"> <label
												for="stay-sign">Stay signed in</label>
										</div> -->
										<hr />
										<div class="text-center">
											<label><a href="#">Forgot your password?</a></label>
										</div>
										
										<hr />
										<div class="text-center">
											<button class="btn btn-success btn-lg mb-3 btn-block"
												type="button" onclick="location.href='<%= request.getContextPath() %>/admin/alliance.do';">제휴문의</button>
										</div>
									</form>
								</div>
							</div>
							<!-- 내용끝 -->
						</div>

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

	<script>
		$(document).ready(function() {

			$('ul.switcher li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('li').removeClass('active');
				$('div.tab-pane').removeClass('active');

				$(this).addClass('active');
				$("#" + tab_id).addClass('active');
			})

		})
	</script>

</body>
</html>
