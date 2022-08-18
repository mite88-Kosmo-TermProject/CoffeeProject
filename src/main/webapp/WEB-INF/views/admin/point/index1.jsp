<%--
/**
 * <pre>
 * 1. 프로젝트명 : point/index1.jsp
 * 2. 작성일 : 2022. 8. 2. 오후 12:22:36
 * 3. 작성자 : home
 * 4. 설명 : 기본포인트설정
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
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">기본포인트설정</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">
								
										<!-- 왼편 -->
										<div class="mb-3 row">
											<div class="col-md-6">
											
												<h5 class="mb-3">회원관련포인트</h5>
	
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">회원가입시</label>
													<div class="col-md-8">
														<input name="register" class="form-control" type="text" value=""
															id="html5-text-input" placeholder="">
													</div>
												</div>
												
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">추천인가입시</label>
													<div class="col-md-8">
														<input name="recommand" class="form-control" type="text" value=""
															id="html5-text-input" placeholder="">
													</div>
												</div>
												
											</div>
									
											<!-- 오른편 -->
											<div class="col-md-6">
											
												<h5 class="mb-3">리뷰 및 댓글관련</h5>
	
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">리뷰작성시</label>
													<div class="col-md-8">
														<input name="review" class="form-control" type="text" value=""
															id="html5-text-input" placeholder="">
													</div>
												</div>
												
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">리뷰삭제시(-로 입력)</label>
													<div class="col-md-8">
														<input placeholder="" name="deletereview" class="form-control" type="text" value=""
															id="html5-text-input">
													</div>
												</div>
												
												
											</div>
											
											<div class="mt-2">
					                          <button type="button" class="btn btn-primary me-2" onclick="updatePointRule();">저장</button>
					                          <button type="reset" class="btn btn-outline-secondary">Cancel</button>
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

	<script type="text/javascript">
		var reg = document.getElementsByName("register")[0];
		var recommand = document.getElementsByName("recommand")[0];
		var review = document.getElementsByName("review")[0];
		var deletereview = document.getElementsByName("deletereview")[0];
		var values = [reg,recommand,review,deletereview];

		function updatePointRule(){
			$.ajax({
				url:'../../admin/point/updatePointRule.do',
				data:{"register" : reg.value ,
					  "recommand" : recommand.value ,
					  "review"	: review.value ,
					  "deletereview" : deletereview.value
					},
				success:function(){
					alert("포인트룰 저장성공");
					for(var i = 0; i<values.length; i++){
						values[i].value = "";
					}
					getPointRuleList();
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		function getPointRuleList(){
			$.ajax({
				url:'../../admin/point/getPointRule.do',
				dataType:'json',
				success:function(data){
					console.log(data[0].rule_name);
					for(var i = 0; i<data.length; i++){
						
						if(data[i].rule_name == "회원가입"){
							reg.placeholder = data[i].rule_name+":"+data[i].rule_point;
						}
						else if(data[i].rule_name == "추천인"){
							recommand.placeholder = data[i].rule_name+":"+data[i].rule_point;
						}							
						else if(data[i].rule_name == "리뷰작성"){
							review.placeholder = data[i].rule_name+":"+data[i].rule_point;
						}						
						else if(data[i].rule_name == "리뷰삭제"){
							deletereview.placeholder = data[i].rule_name+":"+data[i].rule_point;
						}
					}
				},
				error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
			$(function() {
			getPointRuleList();


			});
		</script>
</body>

</html>