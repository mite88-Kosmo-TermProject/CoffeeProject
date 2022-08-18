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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><title>틀 다 우리꺼에 좌표만 카카오 맵</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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


<!-- 	<!-- content --> -->
<!-- 	<div class="container-fluid bg-light overflow-hidden px-lg-0" id="caffee_map"> -->
<!-- 		<div class="container contact px-lg-0"> -->
		
<!-- 			<!-- 시작 --> -->
<!-- 			<div class="row g-0 mx-lg-0"> -->
			
<!-- 				<div class="col-lg-6 col-xl-4 contact-text py-2  resultArea scriptScroll"> -->
<!-- 					리스트 -->
<!-- 					<div class="p-lg-2 ps-lg-0"> -->
<!-- 						<div class="section-title text-start"> -->
<!-- 							<h1 class="display-5 mb-4">검색결과</h1> -->
<!-- 						</div> -->
<!-- 						<p class="mb-4">당신의 취향에 맞춰 검색해드릴게요</p> -->

<!-- 						<form onsubmit="searchPlaces(); return false;" class="mapform"> -->

<!-- 							<div class="input-group"> -->
<!-- 							  <input type="text" class="form-control" placeholder="검색" id="keyword" size="15"> -->
<!-- 							  <button type="submit" class="btn btn-outline-secondary" type="button"> -->
<!-- 							  		<i class="fa fa-search"></i> -->
<!-- 							  </button> -->
							  
<!-- 							</div> -->
							
<!-- 						</form> -->
						
						
<!-- 						<ul class="mapSearchList"> </ul> -->
<!-- 						<div id="pagination"></div> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-6 col-xl-8 pe-lg-0" style="min-height: 400px;"> -->
<!-- 					<div class="position-relative h-100 mapCont"> -->
<!-- 						지도 -->
						
<!-- 						지도 필터 -->
<!-- 						<div class="cateWrap"> -->
<!--                              <span class="frmInp cate restaurant" data-order="0"><input type="checkbox" id="restaurantPopCate" checked=""><label for="restaurantPopCate">카페</label></span> -->
<!--                              <span class="frmInp cate cafe" data-order="1"><input type="checkbox" id="cafePopCate"><label for="cafePopCate">카페패스</label></span> -->
<!--                              <span class="frmInp cate stay" data-order="2"><input type="checkbox" id="stayPopCate"><label for="stayPopCate">숙소</label></span> -->
<!--                          </div> -->
                         
<!--                          지도 -->
<!--                          <div class="mapArea" id="mapArea" style="width: 100%; height: 100%;"> -->
<!--                          </div> -->
                         
						
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<!-- 끝 --> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
<div class="container-fruid">
<h1>지도 검색</h1>
	<form action="../cafe/map.do" method="post">
		<input type="text" value="${searchTxt }" id="searchTxt" name="searchTxt"/>
		<button type="submit">검색하기</button>
	</form>
<c:choose>
<c:when test="${totalRecordCount eq 0 }">
	<div style="text-align;"><h1>검색결과가 없습니다 .. 다시 검색해주세요</h1></div>
</c:when>
<c:otherwise>
	<table class="table table-bordered">
		<tr>
			<th>가게위치</th>
			<th>검색된 가게들</th>
		</tr>
		<tr>
			<td>
				<div id="map" style="width:750px;height:550px;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51170cde81df349ec4e9653882b01d01&libraries=services"></script>
	<script>


	$(function(){
		
		const url = document.location.href;
		var query = window.location.search;
		var param = new URLSearchParams(query);
		var nowPage = param.get('nowPage') ;
		if(nowPage === null){
			nowPage = 1;
		}
		
		var searchTxt = document.getElementById('searchTxt').value;
		if(searchTxt == null){
			alert("검색어를 입력해주세요!");
		}
		else{
			$.ajax({
				url: '../cafe/marker.do?&searchTxt='+searchTxt+"&nowPage="+nowPage ,
				type: 'post',
				contentType : "text/html;charset:utf-8",
				success : sucCallBack,
				error : errCallBack
				});
			function sucCallBack(resdata){
				//위도 변수화
				var latitude0 = resdata.store_latitude0;
				var latitude1 = resdata.store_latitude1;
				var latitude2 = resdata.store_latitude2;
				var latitude3 = resdata.store_latitude3;
				var latitude4 = resdata.store_latitude4;
				var latitude5 = resdata.store_latitude5;
				var latitude6 = resdata.store_latitude6;
				var latitude7 = resdata.store_latitude7;
				var latitude8 = resdata.store_latitude8;
				var latitude9 = resdata.store_latitude9;
				//경도 변수화
				var longitude0 = resdata.store_longitude0;
				var longitude1 = resdata.store_longitude1;
				var longitude2 = resdata.store_longitude2;
				var longitude3 = resdata.store_longitude3;
				var longitude4 = resdata.store_longitude4;
				var longitude5 = resdata.store_longitude5;
				var longitude6 = resdata.store_longitude6;
				var longitude7 = resdata.store_longitude7;
				var longitude8 = resdata.store_longitude8;
				var longitude9 = resdata.store_longitude9;
				//가게명 변수화
				var store_name0 = resdata.store_name0;
				var store_name1 = resdata.store_name1;
				var store_name2 = resdata.store_name2;
				var store_name3 = resdata.store_name3;
				var store_name4 = resdata.store_name4;
				var store_name5 = resdata.store_name5;
				var store_name6 = resdata.store_name6;
				var store_name7 = resdata.store_name7;
				var store_name8 = resdata.store_name8;
				var store_name9 = resdata.store_name9;
				//별점 변수화
				var store_star0 = resdata.store_star0;
				var store_star1 = resdata.store_star1;
				var store_star2 = resdata.store_star2;
				var store_star3 = resdata.store_star3;
				var store_star4 = resdata.store_star4;
				var store_star5 = resdata.store_star5;
				var store_star6 = resdata.store_star6;
				var store_star7 = resdata.store_star7;
				var store_star8 = resdata.store_star8;
				var store_star9 = resdata.store_star9;
				//페이지 이동용 가게 인덱스
				var store_idx0 = resdata.store_idx0;
				var store_idx1 = resdata.store_idx1;
				var store_idx2 = resdata.store_idx2;
				var store_idx3 = resdata.store_idx3;
				var store_idx4 = resdata.store_idx4;
				var store_idx5 = resdata.store_idx5;
				var store_idx6 = resdata.store_idx6;
				var store_idx7 = resdata.store_idx7;
				var store_idx8 = resdata.store_idx8;
				var store_idx9 = resdata.store_idx9;
			
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(latitude0, longitude0), // 지도의 중심좌표
			        level: 6, // 지도의 확대 레벨
			        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
			    }; 
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
			    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
			    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
			    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
			    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
			    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
			    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
			    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
			    SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
			    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
			    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
			    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격
	
			var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
			    markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
			    overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
			    overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
			    spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기
	
			 // 마커를 표시할 위치와 인포윈도우 내용 객체 배열입니다 
			    var positions = [
			        {
			        	store_idx : store_idx0, 
			        	content: '<div class="row"><div>가게명:'+store_name0+'</div><hr><br><div>'+store_star0+'</div></div>', 
			            latlng: new kakao.maps.LatLng( latitude0, longitude0)
			        },
			        {
			        	store_idx : store_idx1,
			        	content: '<div class="row"><div>가게명:'+store_name1+'</div><hr><br><div>가게평점:'+store_star1+'</div></div>', 
			            latlng: new kakao.maps.LatLng(latitude1, longitude1)
			        },
			        {
			        	store_idx : store_idx2,
			        	content: '<div class="row"><div>가게명:'+store_name2+'</div><hr><br><div>가게평점:'+store_star2+'</div></div>',  
			            latlng: new kakao.maps.LatLng(latitude2, longitude2)
			        },
			        {
			        	store_idx : store_idx3,
			        	content: '<div class="row"><div>가게명:'+store_name3+'</div><hr><br><div>가게평점:'+store_star3+'</div></div>', 
			            latlng: new kakao.maps.LatLng(latitude3, longitude3)
			        },
			        {
			        	store_idx : store_idx4,
			        	content: '<div class="row"><div>가게명:'+store_name4+'</div><hr><br><div>가게평점:'+store_star4+'</div></div>', 
			            latlng: new kakao.maps.LatLng(latitude4, longitude4 )
			        },
			        {
			        	store_idx : store_idx5,
			        	content: '<div class="row"><div>가게명:'+store_name5+'</div><hr><br><div>가게평점:'+store_star5+'</div></div>', 
			            latlng: new kakao.maps.LatLng(latitude5, longitude5)
			        },
			        {
			        	store_idx : store_idx6,
			        	content: '<div class="row"><div>가게명:'+store_name6+'</div><hr><br><div>가게평점:'+store_star6+'</div></div>', 
			            latlng: new kakao.maps.LatLng( latitude6, longitude6 )
			        },
			        {
			        	store_idx : store_idx7,
			        	content: '<div class="row"><div>가게명:'+store_name7+'</div><hr><br><div>가게평점:'+store_star7+'</div></div>', 
			            latlng: new kakao.maps.LatLng(latitude7, longitude7 )
			        },
			        {
			        	store_idx : store_idx8,
			        	content: '<div class="row"><div>가게명:'+store_name8+'</div><hr><br><div>가게평점:'+store_star8+'</div></div>', 
			            latlng: new kakao.maps.LatLng(latitude8, longitude8)
			        },
			        {
			        	store_idx : store_idx9,
			        	content: '<div class="row"><div>가게명:'+store_name9+'</div><hr><br><div>가게평점:'+store_star9+'</div></div>', 
			            latlng: new kakao.maps.LatLng(latitude9, longitude9)
			        }
			    ];
	
			    for (var i = 0; i < positions.length; i ++) {
			        // 마커를 생성합니다
			        var marker = new kakao.maps.Marker({
			            map: map, // 마커를 표시할 지도
			            position: positions[i].latlng // 마커의 위치
			        });
	
			        // 마커에 표시할 인포윈도우를 생성합니다 
			        var infowindow = new kakao.maps.InfoWindow({
			            content: positions[i].content // 인포윈도우에 표시할 내용
			        });
	
			        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			        kakao.maps.event.addListener(marker, 'click', makeClickListener(positions[i]));
			    }
	
			    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			    function makeOverListener(map, marker, infowindow) {
			        return function() {
			            infowindow.open(map, marker);
			        };
			    }
	
			    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			    function makeOutListener(infowindow) {
			        return function() {
			            infowindow.close();
			        };
			    }
			    //마커를 클릭시 발생하는 함수입니다.
			    function makeClickListener(positions) {
			        return function() {
			        	location.href="/cafe/info.do?&store_index="+positions.store_idx;
			        };
			    }
			};
			function errCallBack(errData){
				console.log(errData.status+":"+errData.statusText);
			}
		}
	});
	</script>
				
			</td>
			<td id="placeList">
			<div style="overflow:auto; width:650px; height:550px;">

						<div class="row">
				<c:forEach items="${lists }" var="item">
							<div class="col-4">
<%-- 								<img src="${item.store_img }" alt="카페이미지 오류" /> --%>
								<img style="max-width: 200px;" src="https://www.park-roche.com/resources/images/contents/dining/img_dining02_02.png" alt="카페이미지 더미" />
							</div>
							<div class="col-8"" style="text-align: left;">
								<div id="store_name"><a href="./cafe/info.do?&store_idx='${item.store_idx }'">가게명:${item.store_name }</a></div>
								<div id="store_tag">#${item.store_tag }</div>
								<div id="store_star">별점:${item.store_star }</div>
								<div id="store_roadaddr">주소:${item.store_roadaddr }</div>
							</div>
						<hr />
					</c:forEach>
						</div>
			</div>
					<div>${pagingImg}</div>
			</td>
		</tr>
	</table>
</c:otherwise>
</c:choose>
</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	
<!-- 	<!-- 지도 --> -->
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1719acb269a938b6750fa57d8a6c11cb&libraries=services"></script> -->
	
<%-- 	<script src="<%= request.getContextPath() %>/resources/js/map.js"></script> --%>

</body>

</html>