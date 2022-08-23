<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/resources/admin/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>관리자페이지</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="<%= request.getContextPath() %>/resources/admin/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/vendor/css/pages/page-auth.css" />

<!-- 개인 css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/css/style.css" />

<!-- Helpers -->
<script
	src="<%= request.getContextPath() %>/resources/admin/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script
	src="<%= request.getContextPath() %>/resources/admin/assets/js/config.js"></script>
</head>

<body>
	<c:if test="${empty UserID}">  <script>location.href = "/CoffeeProject/admin/main.do"; </script></c:if>
	<c:if test="${! empty UserID}">
		<!-- Menu -->

		<aside id="layout-menu"
			class="layout-menu menu-vertical menu bg-menu-theme">
			<div class="app-brand demo">
				<a href="<%= request.getContextPath() %>/admin/index.do"
					class="app-brand-link"> <span
					class="app-brand-text demo menu-text fw-bolder ms-2">Coffee
						Pass</span>
				</a> <a href="javascript:void(0);"
					class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
					<i class="bx bx-chevron-left bx-sm align-middle"></i>
				</a>
			</div>

			<div class="menu-inner-shadow"></div>

			<ul class="menu-inner py-1">
				<!-- Dashboard -->
				<li class="menu-item active"><a
					href="<%= request.getContextPath() %>/admin/index.do"
					class="menu-link"> <i
						class="menu-icon tf-icons bx bx-home-circle"></i> Home
				</a></li>

				<!-- Layouts -->

				<li class="menu-header small text-uppercase"><span
					class="menu-header-text">회원관리</span></li>

				<li class="menu-item"><a
					href="<%= request.getContextPath() %>/admin/member/list.do"
					class="menu-link"> <i class="menu-icon tf-icons bx bx-layout"></i>
						회원관리
				</a></li>


				<li class="menu-header small text-uppercase"><span
					class="menu-header-text">게시판관리</span></li>

				<li class="menu-item"><a
					href="<%= request.getContextPath() %>/admin/board/list.do"
					class="menu-link"> <i class="menu-icon tf-icons bx bx-layout"></i>
						게시판관리
				</a></li>

				<li class="menu-header small text-uppercase">
				<span class="menu-header-text">구독권 관리</span></li>
				
				<li class="menu-item">
					<a href="<%= request.getContextPath() %>/admin/storeOwnerSub/subList.do" class="menu-link"> 
						<i class="menu-icon tf-icons bx bx-layout"></i>
						구독권 관리
					</a>
				</li>


				<li class="menu-header small text-uppercase"><span
					class="menu-header-text">점주관리</span></li>

				<li class="menu-item"><a href="javascript:void(0);"
					class="menu-link menu-toggle"> <i
						class="menu-icon tf-icons bx bx-dock-top"></i> 점주관리
				</a>
					<ul class="menu-sub">
						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/allianceMember_list/list.do"
							class="menu-link"> 제휴신청 리스트 </a></li>
						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/storeOwnerMember/list.do"
							class="menu-link"> 점주관리 리스트 </a></li>

						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/storeOwnerSub/list.do"
							class="menu-link"> 구독관리 리스트 </a></li>
					</ul></li>


				<li class="menu-item"><a href="javascript:void(0);"
					class="menu-link menu-toggle"> <i
						class="menu-icon tf-icons bx bx-dock-top"></i> 금액관리(보류)
				</a>
					<ul class="menu-sub">
						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/selng/list.do"
							class="menu-link"> 매출관리 </a></li>

						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/excclc/list.do"
							class="menu-link"> 정산관리 </a></li>
					</ul></li>


				<li class="menu-item"><a href="javascript:void(0);"
					class="menu-link menu-toggle"> <i
						class="menu-icon tf-icons bx bx-dock-top"></i> 포인트관리
				</a>
					<ul class="menu-sub">
						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/point/index1.do"
							class="menu-link"> 기본설정(포인트) </a></li>

						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/point/index2.do"
							class="menu-link"> 출책포인트관리 설정 </a></li>

						<li class="menu-item"><a
							href="<%= request.getContextPath() %>/admin/point/list.do"
							class="menu-link"> 포인트조회 </a></li>
					</ul></li>


				<li class="menu-header small text-uppercase"><span
					class="menu-header-text">신고관리</span></li>

				<li class="menu-item"><a
					href="<%= request.getContextPath() %>/admin/report/list.do"
					class="menu-link"> <i class="menu-icon tf-icons bx bx-layout"></i>
						신고리스트
				</a></li>

				<li class="menu-header small text-uppercase"><span
					class="menu-header-text">1:1 문의게시판</span></li>

				<li class="menu-item"><a
					href="<%= request.getContextPath() %>/admin/chtt/list.do"
					class="menu-link"> <i class="menu-icon tf-icons bx bx-layout"></i>
						1:1 문의게시판
				</a></li>


			</ul>
		</aside>
		<!-- / Menu -->

		<!-- Layout container -->
		<div class="layout-page">
			<!-- Navbar -->

			<nav
				class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
				id="layout-navbar">
				<div
					class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
					<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
						<i class="bx bx-menu bx-sm"></i>
					</a>
				</div>

				<div class="navbar-nav-right d-flex align-items-center"
					id="navbar-collapse">


					<ul class="navbar-nav flex-row align-items-center ms-auto">
						<!-- Place this tag where you want the button to render. -->
						<li class="nav-item lh-1 me-3"><a class="github-button"
							href="https://github.com/themeselection/sneat-html-admin-template-free"
							data-icon="octicon-star" data-size="large" data-show-count="true"
							aria-label="Star themeselection/sneat-html-admin-template-free on GitHub">Star</a>
						</li>

						<!-- User -->
						<li class="nav-item navbar-dropdown dropdown-user dropdown">
							<a class="nav-link dropdown-toggle hide-arrow"
							href="javascript:void(0);" data-bs-toggle="dropdown">
								<div class="avatar avatar-online">
									<img
										src="<%= request.getContextPath() %>/resources/admin/assets/img/avatars/1.png"
										alt class="w-px-40 h-auto rounded-circle" />
								</div>
						</a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li><a class="dropdown-item" href="#">
										<div class="d-flex">
											<div class="flex-shrink-0 me-3">
												<div class="avatar avatar-online">
													<img
														src="<%= request.getContextPath() %>/resources/admin/assets/img/avatars/1.png"
														alt class="w-px-40 h-auto rounded-circle" />
												</div>
											</div>
											<div class="flex-grow-1">
												<span class="fw-semibold d-block">관리자</span> <small
													class="text-muted">Admin</small>
											</div>
										</div>
								</a></li>
								<li>
									<div class="dropdown-divider"></div>
								</li>
								<li><a class="dropdown-item"
									href="<%= request.getContextPath() %>/admin/member/view.do">
										<i class="bx bx-user me-2"></i> <span class="align-middle">My
											Profile</span>
								</a></li>

								<li><a class="dropdown-item"
									href="<%= request.getContextPath() %>/admin/chtt/list.do">
										<span class="d-flex align-items-center align-middle"> <i
											class='bx bxs-conversation me-2'></i> <span
											class="flex-grow-1 align-middle">문의</span> <span
											class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
									</span>
								</a></li>
								<li>
									<div class="dropdown-divider"></div>
								</li>

								<li><a class="dropdown-item"
									href="<%= request.getContextPath() %>/admin/logout.do"> <i
										class="bx bx-power-off me-2"></i> <span class="align-middle">Log
											Out</span>
								</a></li>
							</ul>
						</li>
						<!--/ User -->
					</ul>
				</div>
			</nav>

			<!-- / Navbar -->

</c:if>
</body>
</html>