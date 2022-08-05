<%--
/**
 * <pre>
 * 1. 프로젝트명 : /cafe/map.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:38:29
 * 3. 작성자 : 전옥주
 * 4. 설명 : 지도검색
 * 작업:8월4일 ~ 
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<meta charset="utf-8">
<!-- 여기에 새로운 css파일있으면 넣기 -->

<style type="text/css">
#pagination {
  margin: 10px auto;
  text-align: center;
}
#pagination a {
  display: inline-block;
  margin-right: 10px;
}
#pagination .on {
  font-weight: bold;
  cursor: default;
  color: #777;
}

</style>

</head>



<body>


	<!-- content -->
	<div class="container-fluid bg-light overflow-hidden px-lg-0" id="caffee_map">
		<div class="container contact px-lg-0">
		
			<!-- 시작 -->
			<div class="row g-0 mx-lg-0">
			
				<div class="col-lg-6 col-xl-4 contact-text py-2  resultArea scriptScroll">
					<!-- 리스트 -->
					<div class="p-lg-2 ps-lg-0">
						<div class="section-title text-start">
							<h1 class="display-5 mb-4">검색결과</h1>
						</div>
						<p class="mb-4">ㅇㅊㅇ아무말이나 적어봅니다</p>

						<form onsubmit="searchPlaces(); return false;" class="mapform">

							<div class="input-group">
							  <input type="text" class="form-control" placeholder="검색" id="keyword" size="15">
							  <button type="submit" class="btn btn-outline-secondary" type="button">
							  		<i class="fa fa-search"></i>
							  </button>
							  
							</div>
							
						</form>
						
						
						<ul class="mapSearchList"> </ul>
						<div id="pagination"></div>

					</div>
				</div>
				<div class="col-lg-6 col-xl-8 pe-lg-0" style="min-height: 400px;">
					<div class="position-relative h-100 mapCont">
						<!-- 지도 -->
						
						<!-- 지도 필터 -->
						<div class="cateWrap">
                             <span class="frmInp cate restaurant" data-order="0"><input type="checkbox" id="restaurantPopCate" checked=""><label for="restaurantPopCate">카페</label></span>
                             <span class="frmInp cate cafe" data-order="1"><input type="checkbox" id="cafePopCate"><label for="cafePopCate">카페패스</label></span>
                             <span class="frmInp cate stay" data-order="2"><input type="checkbox" id="stayPopCate"><label for="stayPopCate">숙소</label></span>
                         </div>
                         
                         <!-- 지도 -->
                         <div class="mapArea" id="mapArea" style="width: 100%; height: 100%;">
                         </div>
                         
						
					</div>
				</div>
			</div>
			
			<!-- 끝 -->
		</div>
	</div>
	
	

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	
	<!-- 지도 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1719acb269a938b6750fa57d8a6c11cb&libraries=services"></script>
	
	<script src="<%= request.getContextPath() %>/resources/js/map.js"></script>

</body>

</html>