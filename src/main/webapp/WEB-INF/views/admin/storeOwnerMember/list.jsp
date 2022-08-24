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
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">점주관리 리스트</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">
									<!-- table 샘플입니다 ㅇㅊㅇ -->
									
						
									<table id="example" class="display" style="width: 100%">
										<thead>
											<tr>
												<th></th>
												<th style="width: 15%;">카페명</th>
												<th style="width: 25%;">주소</th>
												<th>회원아이디</th>
												<th>점주명</th>
												<th>승인여부</th>

											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>

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

	<script>
		$(function() {
			makeJqueryTable(null);
			
			$('#example tbody').on('click', '#agree_btn', function () {
				/* var table = $('#example').DataTable();
				
				//첫번째 값 가져옵니다(수정용)
			
				var tr = $(this).closest('tr');
				var row = table.row(tr);
				var idx = row.data().storeNum;
				var ownerId = row.data().ownerId;

				$.ajax({
					anyne : true,
					type : 'POST',
					url : "../../admin/storeOwnerMember/ajax_check.do?idx=" + idx+"&ownerId="+ownerId,
					success : function(data) {
						$('#example').DataTable().ajax.reload();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("ERROR : " + textStatus + " : " + errorThrown);
					}
				})
			 */
			})
		})
		function makeJqueryTable(searchField) {
			var table = $('#example').DataTable(
			{
				lengthChange : true,
				searching : true,
				ordering : true,
				info : true,
				paging : true,
				ajax : {
					url : "../../admin/getshoplist.do",
					type : 'GET',
				},
				"columns" : [
						{
							"data" : "storeNum"
						}, {
							"data" : "storeName"
						}, {
							"data" : "adress"
						}, {
							"data" : "ownerId"
						}, {
							"data" : "ownerName"
						}, {
							"data" : "agree",
							orderable : false,
							className : 'table-active dt-body-center',
							render : function (data2, type, full, meta) {
								
								req2 = data2;
								
								return req2;
							}
						}, ]
			});
		}
	</script>
</body>

</html>