<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/resources/img/icon.ico" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<style type="text/css">
#pie-chart{width:100% !important; height:auto !important; max-width: 500px; height: 500px;}
</style>
</head>
<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- header -->
			<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

			<!-- 여기에 새로운 css파일있으면 넣기 -->

			<!-- 그래프 -->
			
			<!-- Content wrapper -->
			<div class="content-wrapper">
				<!-- Content -->

				<div class="container-xxl flex-grow-1 container-p-y">

					<div class="row mb-5">
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 mb-3">

							<!-- 회원정보 -->
							<!-- https://www.youtube.com/watch?v=Gc5JF2TUG7o -->
							<div class="card">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">회원가입 수</h5>
									<div class="card-action-element ms-auto py-0">
										<div class="dropdown">
											<button type="button" class="btn dropdown-toggle p-0"
												data-bs-toggle="dropdown" aria-expanded="false">
												<i class="bx bx-calendar"></i>
											</button>
											<ul class="dropdown-menu dropdown-menu-end">
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Today</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Yesterday</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Last 7
														Days</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Last 30
														Days</a></li>
												<li>
													<hr class="dropdown-divider">
												</li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Current
														Month</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Last
														Month</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<canvas id="UserMemberChart" class="chartjs" data-height="400"></canvas>
								</div>
							</div>
							
							
							<div class="card  mt-4">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">방문자수</h5>
									<div class="card-action-element ms-auto py-0">
										<div class="dropdown">
											<button type="button" class="btn dropdown-toggle p-0"
												data-bs-toggle="dropdown" aria-expanded="false">
												<i class="bx bx-calendar"></i>
											</button>
											<ul class="dropdown-menu dropdown-menu-end">
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Today</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Yesterday</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Last 7
														Days</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Last 30
														Days</a></li>
												<li>
													<hr class="dropdown-divider">
												</li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Current
														Month</a></li>
												<li><a href="javascript:void(0);"
													class="dropdown-item d-flex align-items-center">Last
														Month</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<canvas id="Chart2" class="chartjs" data-height="400"></canvas>
								</div>
							</div>

						</div>
						
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 mb-3">
						<!-- 남/여 성비? -->
						
						<div class="card">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">남여성비</h5>
									<div class="card-action-element ms-auto py-0">
										
								</div>
								<div class="card-body">
									<canvas id="pie-chart" style="margin: 0 auto;"></canvas>
								</div>
							</div>
						
						
						
							
						</div>
						
					</div>

				</div>
				
				
				
				<!-- 큰메뉴 진입하기 용 -->
				<div class="row mb-5">
                <div class="col-md-6 col-lg-4">
                  <div class="card mb-3">
                    <div class="card-body">
                      <h5 class="card-title">Special title treatment</h5>
                      <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                      <a href="javascript:void(0)" class="btn btn-primary">Go somewhere</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4">
                  <div class="card text-center mb-3">
                    <div class="card-body">
                      <h5 class="card-title">Special title treatment</h5>
                      <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                      <a href="javascript:void(0)" class="btn btn-primary">Go somewhere</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4">
                  <div class="card text-end mb-3">
                    <div class="card-body">
                      <h5 class="card-title">Special title treatment</h5>
                      <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                      <a href="javascript:void(0)" class="btn btn-primary">Go somewhere</a>
                    </div>
                  </div>
                </div>
              </div>
				
				<!-- / Content -->

				<!-- footer -->
				<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>
				<!-- / Footer -->

				<div class="content-backdrop fade"></div>
			</div>
			<!-- Content wrapper -->
		</div>
		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	<!-- </div> -->
	<!-- / Layout wrapper -->

	<!-- 여기에 새로운 js파일있으면 넣기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.2/chart.min.js"></script>
	
	<!-- 메인js -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/admin/js/main.js"></script>


</body>

</html>