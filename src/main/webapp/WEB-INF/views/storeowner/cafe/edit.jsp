<%--
/**
 * <pre>
 * 1. 프로젝트명 : /storeowner/report/edit.jsp
 * 2. 작성일 : 2022. 8. 3. 오전 9:27:14
 * 3. 작성자 : home
 * 4. 설명 : 카페정보 입력
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<style type="text/css">
input[type=checkbox] {
	display: none;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae0ab443d0a9774378e3781de244bd95&libraries=services"></script>
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
							
							<form id="formAccountSettings" method="POST" enctype="multipart/form-data">
								<input type="hid den" id="mem_id" name="mem_id" value="${siteUserInfo.mem_id }" />
								<input type="hid den" id="store_idx" name="store_idx" value="${edit.store_idx }" />
								<input type="hid den" id="arrayParam" name="arrayParam" value="${edit.store_tag }"/>
								<input type="hid den" id="store_latitude" name="store_latitude" value="${edit.store_latitude }"/>
								<input type="hid den" id="store_longitude" name="store_longitude" value="${edit.store_longitude }"/>
								<input type="hid den" id="store_sigungu" name="store_sigungu" value="${edit.store_sigungu }"/>
								<input type="hid den" id="store_dong" name="store_dong"  value="${edit.store_dong }"/>
								
								<div class="card">
									<div class="card-header header-elements p-3 my-n1">
										<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">카페정보 입력</h5>
										<div class="card-action-element ms-auto py-0">
										<c:choose>
										<c:when test="${edit!=null }">
											<button type="submit" formaction="./updateaction.do" class="btn btn-primary">수정하기</button>
										</c:when>
										<c:when test="${edit==null }">
											<button type="submit" formaction="./editaction.do" class="btn btn-primary">작성완료</button>
										</c:when>
										<c:otherwise>
											<button type="submit" formaction="./editaction.do" class="btn btn-primary">작성완료</button>
										</c:otherwise>
										</c:choose>
										</div>
									
									</div>
									<div class="card-body">
										<div class="row mb-3">
											<!-- 왼편 -->
											<div class="col-md-6">
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">매장명</label>
													<div class="col-md-10">
														<input class="form-control" type="text" value="${edit.store_name }" name="store_name"
															id="store_name">
													</div>
												</div>
													
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">점주명</label>
													<div class="col-md-10">
														<input class="form-control" type="text" value="${edit.store_owner }" name="store_owner"
															id="store_owner">
													</div>
												</div>


												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">주소</label>
													<div class="col-md-10">
														<div class="input-group">
															<input type="text" class="form-control" placeholder="우편번호"
																aria-describedby="button-addon2" name="addr1" id="addr1" readonly="readonly" value="${edit.store_zipcode }">
															<div class="input-group">
															<input type="text" class="form-control" placeholder="도로명 주소"
																aria-describedby="button-addon2" name="addr2" id="addr2" readonly="readonly" value="${edit.store_roadaddr }">
															</div>
															<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" value="${edit.store_localaddr } " />
															
															<button class="btn btn-outline-primary" type="button"
																id="button-addon2" onclick="execPostCode();">주소검색</button>
														</div>
													</div>
												</div>






												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">공지</label>
													<div class="col-md-10">
														<textarea class="form-control"
															id="store_notice" rows="10" name="store_notice" >${edit.store_notice }</textarea>
													</div>
												</div>
												
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">매장번호</label>
													<div class="col-md-10">
														<input class="form-control" type="text" value="${edit.store_phone }" name="store_phone"
															id="store_phone">
													</div>
												</div>
												

											</div>

											<!-- 오른편 -->

											<div class="col-md-6">
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">메뉴이미지</label>
													<div class="col-md-10">
														<input class="form-control" type="file" id="store_menu" name="file" >
													</div>
												</div>

												<h5 class="mb-3">키워드</h5>
												<!-- 유형 -->
												<div class="mb-3 row">
													<label for="store_item"
														class="col-md-2 col-form-label">유형</label>
													<div class="col-md-5 col-6">
														<div data-toggle="buttons" name="tag" id="tag">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="디저트"> 디저트
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="브런치"> 브런치
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="이색적인 음료"> 이색적인 음료
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="핸드드립 전문"> 핸드드립 전문
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="베이커리"> 베이커리
															</label>
														</div>
													</div>
													
													<div class="col-md-5 col-6">
														<div data-toggle="buttons" name="tag">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="단체석"> 단체석
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="야외공간"> 야외공간
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="독립공간"> 독립공간
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="반려동물가능"> 반려동물가능
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="노키즈존"> 노키즈존
															</label>
														</div>
													</div>
													
													
												</div>
												
												<!-- 분위기 -->
												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-2 col-form-label">분위기</label>
													<div class="col-md-5 col-6">
														<div data-toggle="buttons" name="tag">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="전통"> 전통
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="레트로"> 레트로
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="모던"> 모던
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="내추럴"> 내추럴
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="개성"> 개성
															</label>
														</div>
													</div>
													
													<div class="col-md-5 col-6">
														<div data-toggle="buttons" name="tag">
															<label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="창고형"> 창고형
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="이국적"> 이국적
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="캐주얼"> 캐주얼
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="아기자기"> 아기자기
															</label> <label class="btn btn-block w-100 btn-outline-warning">
																<input type="checkbox" name="store_tag" 
																autocomplete="off" value="기타"> 기타
															</label>
														</div>
													</div>
													
													
												</div>
												<!-- // -->

											</div>

										</div>
									</div>
								</div>

							</form>


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
			$('[data-toggle="buttons"] .btn').on('click',function() {
				
				// toggle style
				$(this).toggleClass('btn-outline-warning btn-outline-warning active');

				// toggle checkbox
				var $chk = $(this).find('[type=checkbox]');
				$chk.prop('checked', !$chk.prop('checked'));
				
				
				var array = new Array();
				$('input:checkbox[name=store_tag]').each(function(index){
					
					if($(this).is(":checked")==true){
						array.push($(this).val());
					}
				});
				$("#arrayParam").val(array);
				
				return false;
				
				
			});
				
		})
	</script>
	
	
	<script>
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				
               console.log(data);
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               Promise.resolve(data).then(o => {
                   const { address } = data;

                   return new Promise((resolve, reject) => {
                	   const geocoder = new kakao.maps.services.Geocoder()
                       geocoder.addressSearch(address, (result, status) =>{
                           if(status === daum.maps.services.Status.OK){
                               const { x, y } = result[0];
                               
                               resolve({ lat: y, lon: x })
                           }else{
                               reject();
                           }
                       });
                   })
               }).then(result => {
                   console.log(result);
                   
                   $("[name=store_latitude]").val(result.lat);
                   $("[name=store_longitude]").val(result.lon);
            	   
               });
               
               $("[name=addr1]").val(data.zonecode);
               $("[name=addr2]").val(fullRoadAddr);
               $("[name=store_sigungu]").val(data.sigungu);
               $("[name=store_dong]").val(data.bname);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }
	
	</script>
	
	<!-- <script>
	function execPostCode() {
	new daum.Postcode({
        oncomplete: function(data) {
            Promise.resolve(data).then(o => {
                const { address } = data;

                return new Promise((resolve, reject) => {
                    const geocoder = new daum.maps.services.Geocoder();

                    geocoder.addressSearch(address, (result, status) =>{
                        if(status === daum.maps.services.Status.OK){
                            const { x, y } = result[0];
							
                            console.log(result[0]);
                            
                            resolve({ lat: y, lon: x })
                        }else{
                            reject();
                        }
                    });
                })
            }).then(result => {
                
            });
        }
    }).open();
	}
	
	</script> -->
	
	
	
</body>

</html>