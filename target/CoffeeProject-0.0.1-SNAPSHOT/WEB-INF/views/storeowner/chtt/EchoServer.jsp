<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/img/icon.ico" />
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

<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- 여기에 새로운 css파일있으면 넣기 -->

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->
					<div class="messaging">
						<div class="inbox_msg">
							<div class="row">


								<!-- message -->
								<div class="col-md-12  mb-3">


									<div class="card">
										<div class="card-header header-elements p-3 my-n1">
											<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">채팅</h5>
											<div class="card-action-element ms-auto py-0">

												<span id="action_menu_btn"><i
													class='bx bx-dots-vertical-rounded'></i></span>
												<div class="action_menu">
													<ul>
														<li>View profile</li>
														<li>Add to close friends</li>
														<li>Add to group</li>
														<li>Block</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="card-body"  style="padding:0px;">

											<div class="mesgs">
												<div class="msg_history">
													<div class="incoming_msg">
														<div class="incoming_msg_img">
															<img
																src="https://ptetutorials.com/images/user-profile.png"
																alt="sunil">
														</div>
														<div class="received_msg">
															<div class="received_withd_msg">
																<p>Test which is a new approach to have all
																	solutions</p>
																<span class="time_date"> 11:01 AM | June 9</span>
															</div>
														</div>
													</div>
													<div class="outgoing_msg">
														<div class="sent_msg">
															<p>Test which is a new approach to have all solutions</p>
															<span class="time_date"> 11:01 AM | June 9</span>
														</div>
													</div>
													<div class="incoming_msg">
														<div class="incoming_msg_img">
															<img
																src="https://ptetutorials.com/images/user-profile.png"
																alt="sunil">
														</div>
														<div class="received_msg">
															<div class="received_withd_msg">
																<p>Test, which is a new approach to have</p>
																<span class="time_date"> 11:01 AM | Yesterday</span>
															</div>
														</div>
													</div>
													<div class="outgoing_msg">
														<div class="sent_msg">
															<p>Apollo University, Delhi, India Test</p>
															<span class="time_date"> 11:01 AM | Today</span>
														</div>
													</div>
													<div class="incoming_msg">
														<div class="incoming_msg_img">
															<img
																src="https://ptetutorials.com/images/user-profile.png"
																alt="sunil">
														</div>
														<div class="received_msg">
															<div class="received_withd_msg">
																<p>We work directly with our designers and
																	suppliers, and sell direct to you, which means quality,
																	exclusive products, at a price anyone can afford.</p>
																<span class="time_date"> 11:01 AM | Today</span>
															</div>
														</div>
													</div>
												</div>
												<div class="type_msg">
													<div class="input_msg_write">
														<input type="text" class="write_msg"
															placeholder="Type a message" />
														<button class="msg_send_btn" type="button">
															<i class='bx bxs-send'></i>
														</button>
													</div>
												</div>
											</div>
										</div>


									</div>
								</div>
								<!-- message 끝 -->

							</div>
						</div>

					</div>
					<!-- / Content -->

				</div>

			</div>
			<!-- Content wrapper -->
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

			$('#action_menu_btn').click(function() {
				$('.action_menu').toggle();
			});

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