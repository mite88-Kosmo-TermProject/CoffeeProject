<%--
/**
 * <pre>
 * 1. 프로젝트명 : /storeOwnerSub/report/list.jsp
 * 2. 작성일 : 2022. 8. 3. 오후 12:00:14
 * 3. 작성자 : home
 * 4. 설명 : 구독관리리스트
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<script>
//숫자(가격) 천의 자리마다 콤마찍어줄려고 만듬
window.onload = function () {
    var prices = document.getElementsByName("price");
    
    for(var i=0; i<prices.length; i++) {
    	prices[i].innerHTML = Number(prices[i].innerHTML).toLocaleString("ko-KR", { style: 'currency', currency: 'KRW' });
    }
}
</script>

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
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">구독권 리스트</h5>
									<div class="card-action-element ms-auto py-0">
										<button type="button" class="btn btn-primary" 
										onclick="location.href='<%= request.getContextPath() %>/admin/storeOwnerSub/subAdd.do'">
										구독권추가</button>
									</div>
								</div>
								<div class="card-body">
									<table id="example" class="display" style="width: 100%">
										<thead>
											<tr>
						                        <th>Subscription Name</th>
						                        <th>Price</th>
						                        <th>Coffee cups</th>
						                        <th>Status</th>
						                        <th>Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${lists }" var="list">
						                      <tr>
						                        <td>
						                        	<a href="../../admin/storeOwnerSub/viewSub.do?sub_idx=${list.sub_idx }">
						                        		<i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${list.sub_name }</strong>
						                        	</a>
						                        </td>
						                        <td name="price">${list.sub_price }</td>
						                        <td>${list.sub_coffee_num }잔</td>
						                        <td><span class="badge bg-label-info me-1">Active</span></td>
						                        <td>
						                          <div class="dropdown">
						                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
						                              <i class="bx bx-dots-vertical-rounded"></i>
						                            </button>
						                            <div class="dropdown-menu">
						                              <a class="dropdown-item" href="../../admin/storeOwnerSub/viewSub.do?sub_idx=${list.sub_idx }"
						                                ><i class="bx bx-edit-alt me-1"></i> Edit</a
						                              >
						                              <a class="dropdown-item" href="../../admin/storeOwnerSub/deleteSub.do?sub_idx=${list.sub_idx }"
						                                ><i class="bx bx-trash me-1"></i> Delete</a
						                              >
						                            </div>
						                          </div>
						                        </td>
						                      </tr>
						                    </c:forEach>
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