<%--
/**
 * <pre>
 * 1. 프로젝트명 : /admin/storeOwnerMember/list.jsp
 * 2. 작성일 : 2022. 8. 1. 오후 6:38:12
 * 3. 작성자 : home
 * 4. 설명 : 승인대기리스트
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/resources/img/icon.ico" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<style type="text/css">

/* 표시 건수수 설정 */
#store_example_wrapper div.dataTables_length{
	display: none !important;
}

#store_example_filter {
	display: none;
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

							<!-- 승인하기용 -->
							<div class="card page1">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">제휴신청 리스트</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">

									<div id="agree_form" class="mb-5">
										<div class="input-group mb-3">
											<input type="text" class="form-control" placeholder="아이디"
												id="mem_id" name="mem_id" readonly="readonly"> <input
												type="text" class="form-control" placeholder="이름"
												id="mem_name" name="mem_name" readonly="readonly">
										</div>

										<div class="input-group mb-3">
											<input type="text" class="form-control" placeholder="가게명"
												id="store_name" name="store_name">
											<button type="button" id="aliance_btn_empty"  class="btn btn-secondary">승인하기</button>

										</div>
									</div>

									<!-- 가게검색용 테이블 -->
									<table id="store_example" class="display" style="width: 100%">
										<thead>
											<tr>
												<th>번호</th>
												<th>가게명</th>
												<th>점주아이디</th>
												<th>점주명</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>

								</div>
							</div>
							<!-- //승인하기용 -->


							<!-- 본테이블 -->
							<div class="card page2 mt-5">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">제휴신청 리스트</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">

									<!-- table ㅇㅊㅇ -->


									<table id="example" class="display" style="width: 100%">
										<thead>
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>이메일</th>
												<th>성별</th>
												<th>가입일</th>
												<th>승인여부</th>

											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>

								</div>
							</div>

							<!-- //본테이블 -->


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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

	<script>
		$(function() {
			$(".page1").hide();
			makeJqueryTable(null);
			
			//승인하기 버튼시 가게 입력하는곳나옴
			$('#example tbody').on('click', '#agree_btn', function () {
				$(".page1").show(); 
				var table = $('#example').DataTable();
				
				//테이블값 가져옵니다(수정용)
			
				var tr = $(this).closest('tr');
				var row = table.row(tr);
				var idx = row.data().storeNum;
				
				$("#agree_form #store_name").val("");

				$("#agree_form #mem_id").val(row.data().mem_id);
				$("#agree_form #mem_name").val(row.data().mem_name);
				
				var store_table = $('#store_example').DataTable(
						{
							lengthChange : true,
							searching : true,
							ordering : true,
							paging : true,
							// 정보 표시 숨기기
							info: false,
							pageLength: 5,     //페이지 당 글 개수 설정
							
							ajax : {
								url : "../store/nameCheck.do",
								type : 'GET',
							},
							"columns" : [
							{
								"data" : "store_idx"
							}, {
								"data" : "store_name"
							}, {
								"data" : "store_owner"
							}, {
								"data" : "store_idx",
								orderable : false,
								className : 'table-active dt-body-center',
								render : function (data, type, full, meta) {
									
									req = '<button type="button" id="aliance_btn" num="'+$("#agree_form #mem_id").val()+'" class="btn btn-secondary">승인하기</button>';

									return req;
								}
							}, ]
						});
				
				
				
			})
			
			//가게 검색창바꾸기
			$('#agree_form #store_name').keyup(function() {
			    var table = $('#store_example').DataTable();
			    table.search($(this).val()).draw();
			});
			
			//최종승인하기 1 - 가게 존재시
			$('#store_example tbody').on('click', '#aliance_btn', function () {
				var result = confirm('승인하시겠습니까?');
				 
				var tr = $(this).closest('tr');
				var row = $('#store_example').DataTable().row(tr);

				var mem_id = $(this).attr("num");
				var store_owner =$("#agree_form #mem_name").val();
				var store_idx =row.data().store_idx;

				//mem_id, store_owner, store_idx
				//alert(store_owner);
					
		        if(result) {
		           //yes
			          $.ajax({
						anyne : true,
						type : 'POST',
						url : "../../admin/storeOwnerMember/ajax_check.do?case=1&mem_id=" + mem_id+"&store_owner="+store_owner+"&store_idx="+store_idx,
						success : function(data) {
							alert("완료되었습니다.");
							location.reload(); //새로고침
							
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("ERROR : " + textStatus + " : " + errorThrown);
						}
					})
					
		        } 
			});
			
			//최종승인하기 2- 가게 비존재시 가게만 추가함
			//aliance_btn_empty
			$('#aliance_btn_empty').on('click', function () {
				var result = confirm('가게가 존재하지 않을때 누르는 창입니다. 정말 승인하시겠습니까?');
				 
				var tr = $(this).closest('tr');
				var row = $('#store_example').DataTable().row(tr);

				var mem_id = $("#agree_form #mem_id").val();;
				var store_owner =$("#agree_form #mem_name").val();
				var store_name =$("#agree_form #store_name").val();

				//mem_id, store_owner, store_idx
				//alert(store_owner);
					
		        if(result) {
		           //yes
			          $.ajax({
						anyne : true,
						type : 'POST',
						url : "../../admin/storeOwnerMember/ajax_check.do?case=2&mem_id=" + mem_id+"&store_owner="+store_owner+"&store_name="+store_name,
						success : function(data) {
							alert("완료되었습니다.");
							location.reload(); //새로고침
							
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("ERROR : " + textStatus + " : " + errorThrown);
						}
					})
					
		        } 
			});
			
			
		})
		

		function makeJqueryTable(searchField) {
			var table = $('#example').DataTable(
			{
				lengthChange : true,
				searching : true,
				ordering : true,
				// 정보 표시 숨기기
				info: false,
				paging : true,
				ajax : {
					url : "../../admin/getAlliancelist.do",
					type : 'GET',
				},
				"columns" : [
						{
							"data" : "mem_id"
						}, {
							"data" : "mem_name"
						}, {
							"data" : "mem_email"
						}, {
							"data" : "mem_gender"
						}, {
							"data" : "mem_redidate",
							render : function (data, type, full, meta) {
								//날짜 시간변환
								//alert(data);
								var datatime = moment(data).format('YYYY-MM-DD');
								req = datatime;

								return req;
							}
						}, {
							"data" : "mem_id",
							orderable : false,
							className : 'table-active dt-body-center',
							render : function (data2, type, full, meta) {

								req2 = '<a href="#" class="btn btn-danger" id="agree_btn" num="'+data2+'" style="padding: 0 !important;width: 100%;">승인하기</a>';

								return req2;
							}
						}, ]
			});
		}
	</script>
</body>

</html>