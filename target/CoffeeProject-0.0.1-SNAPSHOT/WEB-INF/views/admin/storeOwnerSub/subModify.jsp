<%--
/**
 * <pre>
 * 1. 프로젝트명 : /storeOwnerSub/add.jsp
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
			<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

			<!-- 여기에 새로운 css파일있으면 넣기 -->
			
			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->

					<div class="row mb-5">
						<div class="col-12 mb-3">

			             <!-- Basic Layout -->
			              <div class="row">
			                <div class="col-xl">
			                  <div class="card mb-4">
			                    <div class="card-header d-flex justify-content-between align-items-center">
			                      <h5 class="mb-0">구독권</h5>
			                      <small class="text-muted float-end">Default label</small>
			                    </div>
			                    <div class="card-body">
			                      <form action="../../admin/storeOwnerSub/modifySub.do" name="addSubForm">
			                      
			                      <input type="hidden" name="subIdx" value="${dto.sub_idx }">
			                      
			                        <div class="mb-3">
			                          <label class="form-label" for="basic-default-fullname">구독권 이름</label>
			                          <input 
			                          	  type="text" 
				                          class="form-control" 
				                          id="basic-default-fullname" 
				                          name="subName"
				                          value="${dto.sub_name }"
				                       />
			                        </div>
                                    <div class="mb-3">
			                          <label class="form-label" for="basic-icon-default-company">구독권 가격</label>
			                          <div class="input-group input-group-merge">
			                            <span id="basic-icon-default-company2" class="input-group-text"
			                              ><i class='bx bx-won'></i
			                            ></span>
			                            <input
			                              type="number"
			                              id="basic-icon-default-company"
			                              class="form-control"
			                              name="subPrice"
			                              value="${dto.sub_price }"
			                              aria-label="ACME Inc."
			                              aria-describedby="basic-icon-default-company2"
			                            />
			                          </div>
			                        </div>
			                        <div class="mb-3">
			                          <label class="form-label" for="basic-default-email">커피잔</label>
			                          <div class="input-group input-group-merge">
			                            <input
			                              type="number"
			                              id="basic-default-email"
			                              class="form-control"
			                              name="subCoffeeNum"
			                              value="${dto.sub_coffee_num }"
			                              aria-label="john.doe"
			                              aria-describedby="basic-default-email2"
			                            />
			                            <span class="input-group-text" id="basic-default-email2">30일동안 사용가능한 커피잔 수</span>
			                        	</div>
			                          	<div class="form-text">숫자만 입력가능합니다.</div>
			                        </div>
			                        <!-- <div class="mb-3">
			                          <label class="form-label" for="basic-default-phone">Phone No</label>
			                          <input
			                            type="text"
			                            id="basic-default-phone"
			                            class="form-control phone-mask"
			                            placeholder="658 799 8941"
			                          />
			                        </div>
			                        <div class="mb-3">
			                          <label class="form-label" for="basic-default-message">Message</label>
			                          <textarea
			                            id="basic-default-message"
			                            class="form-control"
			                            placeholder="Hi, Do you have a moment to talk Joe?"
			                          ></textarea>
			                        </div> -->
			                        <button type="submit" class="btn btn-primary">구독권 수정</button>
			                      </form>
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
		$(function() {
			
		})
	</script>
</body>

</html>