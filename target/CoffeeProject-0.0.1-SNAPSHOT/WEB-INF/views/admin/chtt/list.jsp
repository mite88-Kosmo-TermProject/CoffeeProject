<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

</head>
<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- header -->
			<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

			<!-- 여기에 새로운 css파일있으면 넣기 -->

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->
					<div class="messaging">
						<div class="inbox_msg">
							<div class="row">

								<!-- 채팅목록 -->
								<div class="col-md-12 col-lg-4 mb-3">


									<div class="card">
										<div class="card-header header-elements p-3 my-n1">
											<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">채팅목록</h5>
											<div class="card-action-element ms-auto py-0"></div>
										</div>
										<div class="card-body">

											<div class="inbox_people">
												<div class="headind_srch">

													<div class="srch_bar">
														<div class="stylish-input-group">
															<input type="text" class="search-bar"
																placeholder="Search"> <span
																class="input-group-addon">
																<button type="button">
																	<i class="fa fa-search" aria-hidden="true"></i>
																</button>
															</span>
														</div>
													</div>
												</div>
												<div class="inbox_chat">
													<div class="chat_list active_chat">
														<div class="chat_people">
															<div class="chat_img">
																<img
																	src="https://ptetutorials.com/images/user-profile.png"
																	alt="sunil">
															</div>
															<div class="chat_ib">
																<h5>
																	Sunil Rajput <span class="chat_date">Dec 25</span>
																</h5>
																<!-- <p>Test, which is a new approach to have all
																	solutions astrology under one roof.</p> -->
															</div>
														</div>
													</div>
													<div class="chat_list">
														<div class="chat_people">
															<div class="chat_img">
																<img
																	src="https://ptetutorials.com/images/user-profile.png"
																	alt="sunil">
															</div>
															<div class="chat_ib">
																<h5>
																	Sunil Rajput <span class="chat_date">Dec 25</span>
																</h5>
																
															</div>
														</div>
													</div>
													<div class="chat_list">
														<div class="chat_people">
															<div class="chat_img">
																<img
																	src="https://ptetutorials.com/images/user-profile.png"
																	alt="sunil">
															</div>
															<div class="chat_ib">
																<h5>
																	Sunil Rajput <span class="chat_date">Dec 25</span>
																</h5>
																
															</div>
														</div>
													</div>
													<div class="chat_list">
														<div class="chat_people">
															<div class="chat_img">
																<img
																	src="https://ptetutorials.com/images/user-profile.png"
																	alt="sunil">
															</div>
															<div class="chat_ib">
																<h5>
																	Sunil Rajput <span class="chat_date">Dec 25</span>
																</h5>
																
															</div>
														</div>
													</div>
													<div class="chat_list">
														<div class="chat_people">
															<div class="chat_img">
																<img
																	src="https://ptetutorials.com/images/user-profile.png"
																	alt="sunil">
															</div>
															<div class="chat_ib">
																<h5>
																	Sunil Rajput <span class="chat_date">Dec 25</span>
																</h5>
																
															</div>
														</div>
													</div>
													<div class="chat_list">
														<div class="chat_people">
															<div class="chat_img">
																<img
																	src="https://ptetutorials.com/images/user-profile.png"
																	alt="sunil">
															</div>
															<div class="chat_ib">
																<h5>
																	Sunil Rajput <span class="chat_date">Dec 25</span>
																</h5>
																
															</div>
														</div>
													</div>
													<div class="chat_list">
														<div class="chat_people">
															<div class="chat_img">
																<img
																	src="https://ptetutorials.com/images/user-profile.png"
																	alt="sunil">
															</div>
															<div class="chat_ib">
																<h5>
																	Sunil Rajput <span class="chat_date">Dec 25</span>
																</h5>
																
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>

								<!-- message -->
								<div class="col-md-12 col-lg-8 mb-3">


									<div class="card">
										<div class="card-header header-elements p-3 my-n1">
											<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">채팅</h5>
											<div class="card-action-element ms-auto py-0">
											
												<span id="action_menu_btn"><i class='bx bx-dots-vertical-rounded'></i></span>
												<div class="action_menu">
													<ul>
														<li> View profile</li>
														<li> Add to close friends</li>
														<li> Add to group</li>
														<li> Block</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="card-body">

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
	<!-- https://hankong.tistory.com/19 -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
			$(function() {
				$('#action_menu_btn').click(function(){
					$('.action_menu').toggle();
				});
				
			})
		</script>
</body>

</html>