<%--
/**
 * <pre>
 * 1. 프로젝트명 : /admin/member/view.jsp
 * 2. 작성일 : 2022. 8. 1. 오후 5:44:50
 * 3. 작성자 : 전옥주
 * 4. 설명 : 회원정보
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/img/icon.ico" />
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
			<link
				href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"
				rel="stylesheet" />

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->

					<div class="row mb-5">
						<div class="col-12 mb-3">


							<div class="card">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">회원가입 리스트</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">
									<!-- 
									아이디(PK)
									유저이름
									닉네임
									이메일
									핸드폰번호
									포인트
									멤버분류
									프로필이미지
									성별
									신고당한수
									가입일
									등급
									보유구독권
									 -->
									<div class="mb-3 row">
										<div class="col-md-12">
											<div
												class="d-flex align-items-start align-items-sm-center gap-4">
												<img
													src="<%=request.getContextPath()%>/resources/admin/assets/img/avatars/1.png"
													alt="user-avatar" class="d-block rounded" height="100"
													width="100" id="uploadedAvatar">
													
													<!-- 사진추가시 ㅇㅊㅇ -->
													<!-- <div class="button-wrapper">
							                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
							                            <span class="d-none d-sm-block">Upload new photo</span>
							                            <i class="bx bx-upload d-block d-sm-none"></i>
							                            <input type="file" id="upload" class="account-file-input" hidden="" accept="image/png, image/jpeg">
							                          </label>
							                          <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
							                            <i class="bx bx-reset d-block d-sm-none"></i>
							                            <span class="d-none d-sm-block">Reset</span>
							                          </button>
							
							                          <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
							                        </div> -->
						                            
											</div>
										</div>
										
										
										<div class="col-md-12">
											<div class="d-flex align-items-start align-items-sm-center gap-4">
												
													<div class="btn-group" role="group" >
						                              <label class="btn btn-outline-primary" for="btnradio1">회원수정</label>
						                              <label class="btn btn-outline-primary" for="btnradio2">회원삭제</label>
						                            </div>
						                            
											</div>
										</div>
										
									</div>

									<div class="mb-3 row">
									
										<!-- 왼편 -->
										<div class="col-md-6">
											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">아이디</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
												</div>
											</div>

											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">유저명</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
												</div>
											</div>

											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">닉네임</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
												</div>
											</div>

											<div class="mb-3 row">
												<label for="html5-email-input"
													class="col-md-2 col-form-label">Email</label>
												<div class="col-md-10">
													<input class="form-control" type="email" value=""
														id="html5-email-input" readonly>
												</div>
											</div>

											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">휴대폰번호</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
												</div>
											</div>
											
											
											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">포인트</label>
												<div class="col-md-10">
													
													<div class="input-group">
														<input type="text" class="form-control" aria-describedby="button-addon2" readonly>
															
														<button class="btn btn-outline-primary" type="button"
															id="button-addon2">포인트내역</button>
													</div>
												</div>
											</div>
											
												<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">성별</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
												</div>
											</div>
											
										</div>
										
										<!-- 오른편 -->

										<div class="col-md-6">
											

											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">멤버분류</label>
												<div class="col-md-10">
													aaa
													<!-- <select id="defaultSelect" class="form-select">
												<option>Default select</option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select> -->
												</div>
											</div>

											<!-- 
				                       <div class="mb-3 row">
				                        <label for="html5-text-input" class="col-md-2 col-form-label">프로필사진</label>
				                        <div class="col-md-10">
				                        
				                          <input class="form-control" type="file" id="formFile" readonly> 
				                        </div>
				                      </div>
				                      -->

										

											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">신고당한수</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
												</div>
											</div>

											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">가입일</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
												</div>
											</div>

											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">등급</label>
												<div class="col-md-10">
													aaa
													<!-- <select id="defaultSelect" class="form-select">
												<option>Default select</option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select> -->
												</div>
											</div>


											<!-- 
											구독권번호
											발행업체명
											
											구독권종류
											구독권이용수
											구독권사용가능메뉴
											
											구독권승인여부
											
											구독권유효기간
											구독권가격
											 -->
											<div class="mb-3 row">
												<label for="html5-text-input"
													class="col-md-2 col-form-label">보유구독권</label>
												<div class="col-md-10">
													<input class="form-control" type="text" value=""
														id="html5-text-input" readonly>
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
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
			$(function() {
				
				$('#example').DataTable({
					dom : 'Bfrtip',
					buttons : [ {
						extend : 'excel',
						text : '엑셀출력',
						filename : '엑셀파일명',
						title : '엑셀파일 안에 쓰일 제목'
					}, {
						extend : 'copy',
						text : '클립보드 복사',
						title : '클립보드 복사 내용'
					}, {
						extend : 'csv',
						text : 'csv출력',
						filename : 'utf-8이라서 ms엑셀로 바로 열면 글자 깨짐'
					}, ]
				});
			})
		</script>
</body>

</html>