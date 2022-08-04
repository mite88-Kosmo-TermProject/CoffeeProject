<%--
/**
 * <pre>
 * 1. 프로젝트명 : point/index2.jsp
 * 2. 작성일 : 2022. 8. 2. 오후 12:22:36
 * 3. 작성자 : home
 * 4. 설명 : 룰렛설정
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
.table > :not(caption) > * > * {
    padding: 0.5rem !important;
    }

</style>

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
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">출책이벤트설정</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">
									<form id="formAccountSettings" method="POST"
										onsubmit="return false">
										<!-- 왼편 -->
										<div class="mb-3 row">
											<div class="col-md-6">

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">이벤트명</label>
													<div class="col-md-8">
														<input class="form-control" type="text" value=""
															id="html5-text-input">
													</div>
												</div>


												<div class="mb-3 row">
												<label for="html5-text-input"
														class="col-md-4 col-form-label">배경이미지</label>
													<div class="col-md-8">									
														<input class="form-control" type="file"
															id="formFileMultiple" multiple>													
													</div>
												

												</div>

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">이벤트설명</label>
													<div class="col-md-8">
														<textarea class="form-control"
															id="exampleFormControlTextarea1" rows="3"></textarea>
													</div>
												</div>

											</div>

											<!-- 오른편 -->
											<div class="col-md-12">
												<div class="table-responsive text-nowrap">
													<table class="table" id="table">
														<thead>
															<tr data-tabullet-map="id">
																<th width="50" data-tabullet-map="_index"
																	data-tabullet-readonly="true" class="visually-hidden">NO</th>
																<th data-tabullet-map="1">항목명</th>
																<th data-tabullet-map="2">비율</th>
																<th data-tabullet-map="3">확률</th>
																<th data-tabullet-map="4">항목상품</th>
																<th width="50" data-tabullet-type="edit"></th>
																<th width="50" data-tabullet-type="delete"></th>
															</tr>
														</thead>
													</table>
												</div>

											</div>
											<div class="mt-2">
												<button type="submit" class="btn btn-primary me-2">저장</button>
												<button type="reset" class="btn btn-outline-secondary">Cancel</button>
											</div>

										</div>
									</form>

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
	<script src="<%= request.getContextPath() %>/resources/lib/Dynamic-Table/Tabullet.js"></script>

	<script type="text/javascript">
	 $(function () {
		 //동적테이블 
         var source = [];

         function resetTabullet() {
             $("#table").tabullet({
                 data: source,
                 action: function (mode, data) {
                     console.dir(mode);
                     if (mode === 'save') {
                         source.push(data);
                     }
                     if (mode === 'edit') {
                         for (var i = 0; i < source.length; i++) {
                             if (source[i].id == data.id) {
                                 source[i] = data;
                             }
                         }
                     }
                     if(mode == 'delete'){
                         for (var i = 0; i < source.length; i++) {
                             if (source[i].id == data) {
                                 source.splice(i,1);
                                 break;
                             }
                         }
                     }
                     resetTabullet();
                 }
             });
         }

         resetTabullet();
     });
 </script>
</body>

</html>