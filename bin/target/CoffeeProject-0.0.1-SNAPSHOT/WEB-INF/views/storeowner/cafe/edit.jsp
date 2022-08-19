<%--
/**
 * <pre>
 * 1. 프로젝트명 : /storeowner/report/edit.jsp
 * 2. 작성일 : 2022. 8. 3. 오전 9:27:14
 * 3. 작성자 : home
 * 4. 설명 : 카페정보 입력
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<style type="text/css">
input[type=checkbox] {
	display: none;
}
</style>
</head>
<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- header -->
			<%@ include file="/WEB-INF/views/storeowner/layout/header.jsp"%>

			<!-- 여기에 새로운 css파일있으면 넣기 -->

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->

					<div class="row mb-5">
						<div class="col-12 mb-3">
							<form id="formAccountSettings" method="POST" onsubmit="return false">

								<div class="card">
									<div class="card-header header-elements p-3 my-n1">
										<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">카페정보 입력</h5>
										<div class="card-action-element ms-auto py-0">
											<button type="button" class="btn btn-primary">작성완료</button>
										</div>
									
									</div>
									<div class="card-body">
										<div class="row mb-3">
											<!-- 왼편 -->
											<div class="col-md-6">
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">매장명</label>
													<div class="col-md-10">
														<input class="form-control" type="text" value=""
															id="html5-text-input">
													</div>
												</div>

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">점주명</label>
													<div class="col-md-10">
														<input class="form-control" type="text" value=""
															id="html5-text-input">
													</div>
												</div>

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">주소</label>
													<div class="col-md-10">
														<div class="input-group">
															<input type="text" class="form-control"
																aria-describedby="button-addon2">

															<button class="btn btn-outline-primary" type="button"
																id="button-addon2">주소검색</button>
														</div>
													</div>
												</div>






												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">공지</label>
													<div class="col-md-10">
														<textarea class="form-control"
															id="exampleFormControlTextarea1" rows="10"></textarea>
													</div>
												</div>

											</div>

											<!-- 오른편 -->

											<div class="col-md-6">
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">메뉴이미지</label>
													<div class="col-md-10">
														<input class="form-control" type="file" id="formFile">
													</div>
												</div>

												<h5 class="mb-3">키워드</h5>
												<!-- 유형 -->
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">유형</label>
													<div class="col-md-5 col-6">
														<div data-toggle="buttons">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="tyres" checked
																autocomplete="off"> 디저드
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="wiperblades" checked
																autocomplete="off"> 브런치
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="lights" checked
																autocomplete="off"> 이색적인 음료
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="indicators" checked
																autocomplete="off"> 핸드르립 전문
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="cleanliness" checked
																autocomplete="off"> 베이커리
															</label>
														</div>
													</div>
													
													<div class="col-md-5 col-6">
														<div data-toggle="buttons">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="tyres" checked
																autocomplete="off"> 단체석
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="wiperblades" checked
																autocomplete="off"> 야외공간
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="lights" checked
																autocomplete="off"> 독립공간
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="indicators" checked
																autocomplete="off"> 반려동물가능
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="cleanliness" checked
																autocomplete="off"> 노키즈존
															</label>
														</div>
													</div>
													
													
												</div>
												
												<!-- 분위기 -->
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">분위기</label>
													<div class="col-md-5 col-6">
														<div data-toggle="buttons">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="tyres" checked
																autocomplete="off"> 전통
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="wiperblades" checked
																autocomplete="off"> 네트로
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="lights" checked
																autocomplete="off"> 모던
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="indicators" checked
																autocomplete="off"> 내추럴
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="cleanliness" checked
																autocomplete="off"> 개성
															</label>
														</div>
													</div>
													
													<div class="col-md-5 col-6">
														<div data-toggle="buttons">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="tyres" checked
																autocomplete="off"> 창고형
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="wiperblades" checked
																autocomplete="off"> 이국적
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="lights" checked
																autocomplete="off"> 캐주얼
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="indicators" checked
																autocomplete="off"> 아기자기
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="cleanliness" checked
																autocomplete="off"> 기타
															</label>
														</div>
													</div>
													
													
												</div>
												<!-- // -->

											</div>

										</div>
									</div>
								</div>

							</form>


						</div>
					</div>
				</div>

				<!-- / Content -->

				<!-- footer -->
				<%@ include file="/WEB-INF/views/storeowner/layout/footer.jsp"%>
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


	<script type="text/javascript">
		$(function() {
			$('[data-toggle="buttons"] .btn')
					.on(
							'click',
							function() {
								// toggle style
								$(this)
										.toggleClass(
												'btn-outline-warning btn-outline-warning active');

								// toggle checkbox
								var $chk = $(this).find('[type=checkbox]');
								$chk.prop('checked', !$chk.prop('checked'));

								return false;
							});

		})
	</script>
</body>

</html>