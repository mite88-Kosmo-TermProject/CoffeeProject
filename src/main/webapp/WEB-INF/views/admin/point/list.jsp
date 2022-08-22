<%--
/**
 * <pre>
 * 1. 프로젝트명 : /admin/board/list.jsp
 * 2. 작성일 : 2022. 8. 1. 오후 5:45:47
 * 3. 작성자 : home
 * 4. 설명 : 포인트리스트
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
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">포인트 리스트</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">

									<!-- 포인트지급 -->
									<div class="table-responsive text-nowrap mb-3">
										<table class="table" id="table">
											<thead>
												<tr>
													<th data-tabullet-map="1">유저명</th>
													<th data-tabullet-map="2">금액</th>
													<th data-tabullet-map="3">사유/내용입력</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="text" name="user" class="form-control"></td>
													<td><input type="text" name="point" class="form-control"></td>
													<td>
														<select class="form-select" aria-label="Default select example" id="select" onchange="insertPoint();">
															<option value="1">회원가입</option>
															<option value="2">리뷰작성</option>
															<option value="3">추천인</option>
															<option value="4">리뷰삭제</option>
														</select>
													</td>
													<td> <button class="btn btn-outline-primary" onclick="insertPoint();">Save</button></td>
												</tr>
											</tbody>
										</table>
									</div>
	
									<!-- table 샘플입니다 ㅇㅊㅇ -->
									<%@ include file="/WEB-INF/views/admin/table_point.jsp"%>

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
		
		
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/admin/js/pointList.js"></script>

<script type="text/javascript">
function deletecheckval(){
	var checkedval= [];
	var val = document.querySelectorAll('input[name="check"]:checked');
	for(let i =0; i<val.length; i++){
		checkedval.push(val[i].value);
	}
	JSON.stringify(checkedval);
	console.log(checkedval);
	$.ajax({
		url:'../../admin/point/deletePoint.do',
		data:{"values":JSON.stringify(checkedval)},
		success:function(){
			$('#example').DataTable().destroy();
			makeJqueryTable(null);
			alert("삭제완료");
		},
		error:function(msg){
			console.error(msg);
		}
	})
	} 
function insertPoint() {
	var user = document.getElementsByName("user")[0];
	var point = document.getElementsByName("point")[0];
	var select = document.querySelector("select");
	var selectedindex = select.selectedIndex;
	var selectedvalue = select.options[selectedindex].value
	console.log(selectedvalue);

	$.ajax({
		url:'../../admin/point/insertPoint.do',
		data:{"user":user.value, 
			  "point":point.value,
			  "select":selectedvalue
			},
			success:function(){
				user.value = "";
			  	point.value = "";
			 	selectedvalue = "";
				$('#example').DataTable().destroy();
				makeJqueryTable(null);
			}
		

	})
	
}
</script>

</body>

</html>