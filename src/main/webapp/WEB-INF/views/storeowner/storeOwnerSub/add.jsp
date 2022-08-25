<%--
/**
 * <pre>
 * 1. 프로젝트명 : /storeOwnerSub/report/add.jsp
 * 2. 작성일 : 2022. 8. 3. 오후 12:00:14
 * 3. 작성자 : home
 * 4. 설명 : 구독추가
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
			<%@ include file="/WEB-INF/views/storeowner/layout/header.jsp"%>

			<!-- 여기에 새로운 css파일있으면 넣기 -->
			
			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->

					<div class="row mb-5">
						<div class="col-12 mb-3">


							<div class="card">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">신고관리 리스트</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">
									
								</div>
							</div>


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
			
		})
	</script>
</body>

</html>