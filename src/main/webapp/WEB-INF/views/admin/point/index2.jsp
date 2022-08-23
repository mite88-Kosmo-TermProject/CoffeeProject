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
#roulette-outer{
	position: relative;
	left:80px;
	bottom:50px;
	overflow: hidden;
	width: 350px;
	height: 350px;
	background: yellow;
	z-index: 1;
	}
#roulette{
position: absolute;
border:0px;
padding:0px;
top: 5%;
left: 5%;
right:5%;
bottom:5% ;
width:313px;
border-radius: 50%;
background: #D1B6E1;
border: 2px solid black;
z-index: 2;
}
#roulette > #item-wrapper > .item {
	position: absolute;
	font:25px bold;
	top:0;
	left:0;
	right:0;
	bottom:0;
	
	padding-top: 10%;
	text-align: center;
	display: flex;
	justify-content: center;
	
}
/*#roulette > #item-wrapper > .item:nth-child(1) {
	transform: rotate(0deg);
}
#roulette > #item-wrapper > .item:nth-child(2) {
	transform: rotate(72deg);
}
#roulette > #item-wrapper > .item:nth-child(3) {
	transform: rotate(144deg);
}
#roulette > #item-wrapper > .item:nth-child(4) {
	transform: rotate(216deg);
}	
#roulette > #item-wrapper > .item:nth-child(5) {
	transform: rotate(288deg);
}*/	
#roulette > #line-wrapper > .line {
	position: absolute;
	top: 0;
	bottom: 50%;
	left: 50%;
	width: 2px;
	background: black;
	transform-origin: bottom;
	z-index: 3;
}
/*#roulette > #line-wrapper > .line:nth-child(1) {
	transform: rotate(36deg);
}
#roulette > #line-wrapper > .line:nth-child(2) {
	transform: rotate(108deg);
}
#roulette > #line-wrapper > .line:nth-child(3) {
	transform: rotate(180deg);
}
#roulette > #line-wrapper > .line:nth-child(4) {
	transform: rotate(252deg);
}
#roulette > #line-wrapper > .line:nth-child(5) {
	transform: rotate(324deg);
}*/
#roulette-pin{
position: absolute;
top:5%;
left:173px;
width:4px;
padding-left:0px;
padding-right:0px;
margin-right:10px;
height:20px;
background:red;
z-index: 4;
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
									<form id="formAccountSettings" method="POST" enctype="multipart/form-data"
										action="../../admin/point/eventSetting.do">
										<!-- 왼편 -->
										<div class="mb-3 row">
											<div class="col-md-6">

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">이벤트명</label>
													<div class="col-md-8">
														<input  name="eventname" class="form-control" type="text" value=""
															id="html5-text-input">
													</div>
												</div>


												<div class="mb-3 row">
												<label for="html5-text-input"
														class="col-md-4 col-form-label">배경이미지</label>
													<div class="col-md-8">									
														<input  name="file" class="form-control" type="file"
															id="formFileMultiple" multiple>													
													</div>
												

												</div>

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">이벤트설명</label>
													<div class="col-md-8">
														<textarea placeholder="" name="desc" class="form-control"
															id="exampleFormControlTextarea1" rows="3"></textarea>
													</div>
												</div>
												<div class="mt-2">
													<button type="submit" class="btn btn-primary me-2">저장</button>
												</div>
											</form>
											</div>
											<div class="mb-3 row" id="roulette-outer" style="display: flex;">
												
											<div id="roulette-pin"></div>
												<div id="roulette">
												<!--값영역 -->
												<div id="item-wrapper">
													<!-- <div class="item">100점</div>
													<div class="item">200점</div>
													<div class="item">300점</div>
													<div class="item">-50점</div>
													<div class="item">-20점</div> -->
												</div>
												<!--선영역-->
												<div id="line-wrapper">
													<!-- <div class="line"></div>
													<div class="line"></div>
													<div class="line"></div>
													<div class="line"></div>
													<div class="line"></div> -->
												</div>
											</div>
											</div>
											<div>
												<button type="button" onclick="calculateItemAndRatio();">룰렛만들기</button>
												<button type="button" onclick="MakeSetRouletteStr();">룰렛돌려보기</button>
											</div>

											<!-- 오른편 -->
											<div class="col-md-12">
												<div class="table-responsive text-nowrap">
													<table class="table" id="table">
														<thead>
															<tr data-tabullet-map="id">
																<th data-tabullet-map="0">항목번호</th>
																<th data-tabullet-map="1">항목명</th>												
																<th data-tabullet-map="2">확률</th>
																<th data-tabullet-map="3">항목상품</th>
																<th width="50" data-tabullet-type="edit"></th>	
															</tr>
														</thead>
													</table>
												</div>

											</div>
											<div class="mt-2">
												<button type="button" onclick="insertEventItem();" class="btn btn-primary me-2">저장</button>
												<button type="reset" onclick="resetItem();" class="btn btn-outline-secondary">룰렛판&항목초기화</button>
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
	<script src="<%= request.getContextPath() %>/resources/lib/Dynamic-Table/Tabullet.js"></script>
	<script src="<%= request.getContextPath() %>/resources/admin/js/admin_test_roulette.js"></script>
</body>

</html>