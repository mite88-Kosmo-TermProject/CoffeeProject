<%--
/**
 * <pre>
 * 1. 프로젝트명 : /admin/storeOwnerMember/list.jsp
 * 2. 작성일 : 2022. 8. 1. 오후 6:38:12
 * 3. 작성자 : home
 * 4. 설명 : 점주관리자리스트
 * </pre>
 */
--%>
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
			<link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->

					<div class="row mb-5">
						<div class="col-12 mb-3">


							<div class="card">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">점주관리 리스트</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">
									<!-- table 샘플입니다 ㅇㅊㅇ -->
									<%@ include file="/WEB-INF/views/admin/table_sample.jsp"%>

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