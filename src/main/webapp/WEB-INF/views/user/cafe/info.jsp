<%--
/**
 * <pre>
 * 1. 프로젝트명 : /cafe/info.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:41:02
 * 3. 작성자 : 전옥주
 * 4. 설명 : 카페상세정보
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
<style type="text/css">

/*owl*/
.owl-nav, .owl-dots {
	display: block;
	text-align: center;
}

.owl-nav .owl-prev, .owl-nav .owl-next {
	display: inline-block;
	margin: 5px;
}

.owl-dots .owl-dot {
	display: inline-block;
	background-color: #ccc;
	width: 12px;
	height: 12px;
	border-radius: 50%;
	margin: 5px;
}

.owl-dots .active {
	background-color: #666;
}

/*카페정보*/
/*할인정보*/
#cafe_info .badge {
	background-color: #ab7442 !important;
	border-radius: 10px;
	color: #fff;
}

/*카페명*/
.titDep1 {
	margin-bottom: 3px;
	padding-top: 16px;
}

/*평점 등 기본아이콘*/
.place-cap-bottom ul li {
	display: inline-block;
	margin-right: 18px;
	color: #9da5ab;
}

/*내용*/
.tabs li {
	float: left;
	width: 33.33%;
}

.tabs a {
	display: block;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	color: #fff;
	padding: 1rem 0;
	border-bottom: 2px solid #888;
	background: #b8895e;
}

.tabs a:hover, .tabs a.active {
	background: #7e5835;
}

.tabgroup>div {
	padding: 30px;
	/*  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.3); */
}

.clearfix:after {
	content: "";
	display: table;
	clear: both;
}

/*설명*/
p.txt:before {
	background-image:
		url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png);
	background-position: -974px -775px;
	width: 18px;
	height: 15px;
	content: '';
	display: block;
	margin: 0 0 6px 3px;
}

/*기본정보*/
.compInfoWrap .compInfo dd.snsList .sns:after, .compInfoWrap .compInfo:first-of-type:after
	{
	content: '';
	display: inline-block;
	position: absolute
}

.compInfoWrap {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex
}

.compInfoWrap .compInfo {
	width: 50%;
	margin-top: 24px
}

.compInfoWrap .compInfo dt {
	position: absolute;
	width: 40px;
	padding: 6px 0 5px;
	color: #202020;
	font-weight: 700
}

.compInfoWrap .compInfo dd {
	clear: both;
	padding: 6px 32px 5px;
	margin-left: 40px
}

.compInfoWrap .compInfo dd+dd {
	padding-left: 0
}

.compInfoWrap .compInfo dd a[href^=tel], .compInfoWrap .compInfo dd [href^=www],
	.compInfoWrap .compInfo dd a.linkText {
	position: relative;
	display: inline-block
}

.compInfoWrap .compInfo dd a[href^=tel]:before, .compInfoWrap .compInfo dd [href^=www]:before,
	.compInfoWrap .compInfo dd a.linkText:before {
	content: '';
	display: inline-block;
	width: 18px;
	height: 18px;
	margin-right: 4px;
	vertical-align: middle
}

.compInfoWrap .compInfo dd a[href^=tel]:after, .compInfoWrap .compInfo dd [href^=www]:after,
	.compInfoWrap .compInfo dd a.linkText:after {
	content: '';
	display: block;
	width: calc(100% - 22px);
	height: 1px;
	margin-top: -4px;
	margin-left: 22px;
	background: #606060
}

.compInfoWrap .compInfo dd.snsList .sns {
	position: relative;
	display: inline-block;
	width: 32px;
	height: 32px;
	margin-right: 13px;
	color: #fff;
	font-size: 1px;
	vertical-align: top;
	border-radius: 50%;
	overflow: hidden
}

.compInfoWrap .compInfo dt+dd {
	max-width: calc(100% - 82px);
	padding-left: 0
}

.compInfoWrap .compInfo:first-of-type {
	position: relative
}

.compInfoWrap .compInfo:first-of-type:after {
	top: 8px;
	right: 0;
	bottom: 8px;
	width: 1px;
	background-color: #EAEAEA
}

.compInfoWrap .compInfo:nth-of-type(2) dd {
	margin-left: 40px
}

.compInfoWrap .compInfo:nth-of-type(2) dt {
	width: 40px;
	padding-left: 10px;
}

.compInfoWrap .compInfo:nth-of-type(2) dt.snsTit {
	padding: 16px 32px 7px
}

.compInfoWrap .compInfo:nth-of-type(2) dt.snsTit+.snsList {
	padding: 8px 32px 7px 0
}

/*리뷰*/
.start_info {
	
}

.rating-box {
	width: 130px;
	text-align: center;
}

.rating-label {
	font-weight: bold
}

.fa-star {
	color: #fd5a0f;
}

.rating-bar {
	width: 300px;
	padding: 8px;
	border-radius: 5px
}

.bar-container {
	width: 100%;
	background-color: #f1f1f1;
	text-align: center;
	color: white;
	border-radius: 20px;
	cursor: pointer;
	margin-bottom: 5px
}

.bar-5 {
	width: 70%;
	height: 13px;
	background-color: #fd5a0f;
	border-radius: 20px
}

.bar-4 {
	width: 30%;
	height: 13px;
	background-color: #fd5a0f;
	border-radius: 20px
}

.bar-3 {
	width: 20%;
	height: 13px;
	background-color: #fd5a0f;
	border-radius: 20px
}

.bar-2 {
	width: 10%;
	height: 13px;
	background-color: #fd5a0f;
	border-radius: 20px
}

.bar-1 {
	width: 0%;
	height: 13px;
	background-color: #fd5a0f;
	border-radius: 20px
}
/*구매 베너*/
#cafe_passBar *{color:#fff;}
#cafe_passBar .card {background:#b38255; cursor: pointer;}

#cafe_passBar i{}

/*리뷰*/
.reviewList {
	border-top: 1px solid #202020
}



</style>

<link href="<%= request.getContextPath() %>/resources/css/review.css" rel="stylesheet">


<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->
</head>



<body>

	<!-- content -->
	<!-- 상단 간단내용 -->
	<section id="cafe_info" class="info container-xxl py-5">
		<div class="container aos-init aos-animate" data-aos="fade-up">

			<div class="row content">
				<!-- 이미지 -->
				<div class="col-md-4">
					<div class="owl-carousel">
						<div class="item">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/커피2.png" alt="">
						</div>
						<div class="item">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/커피3.png" alt="">
						</div>
						<div class="item">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/커피4.png" alt="">
						</div>

					</div>
					
					<img class="img-fluid" src="<%=request.getContextPath()%>/resources/img/패스가입베너.png" alt="">
				</div>
				<div class="col-md-8 pt-4 pt-lg-0">
					<!-- 할인항목 -->
					<ul class="list-group list-group-horizontal mb-3">
						<li><span class="badge bg-secondary list-group-item me-3">아메리카노
								무료1</span></li>
						<li><span class="badge bg-secondary list-group-item">아메리카노
								무료2</span></li>
					</ul>
					<!-- 카페명 -->
					<h2 class="titDep1 mb-3" cafename="">린도디아</h2>

					<!-- 해시태그 -->
					<p class="tagWrap mb-3" displaykeyworlds="">
						<span class="tag">#디저트카페</span> <span class="tag">#애월카페</span> <span
							class="tag">#에그타르트맛집</span>
					</p>

					<!-- 업체정보 -->
					<p class="txt mp-5 pb-3" introduce="">가지에 바이며, 만천하의 놀이 갑 피에 이것은
						심장의 이 칼이다. 이상 원질이 이 불어 청춘의 얼음과 무엇을 황금시대다. 하여도 피가 무엇을 심장의 뿐이다.
						속잎나고, 얼마나 위하여 칼이다. 천하를 생명을 뛰노는 뿐이다. 청춘의 못할 같이, 속잎나고, 되는 그러므로
						봄바람이다. 사랑의 두기 같으며, 생생하며, 봄바람이다. 반짝이는 듣기만 원대하고, 같이 그들의 봄바람이다. 원대하고,
						많이 동산에는 밥을 때문이다. 미묘한 우는 황금시대를 사람은 인간의 가치를 어디 방지하는 힘있다.</p>


					<!-- 후기 수 등 기본수치 -->
					<div class="place-cap-bottom border-top">

						<div class="d-flex p-2 justify-content-between border-bottom">
							<div class="">
								<ul>
									<li><i class="fa fa-solid fa-pen mt-2"></i> 3</li>
									<li><i class="fa fa-solid fa-star mt-2"></i> 3.5</li>
								</ul>
							</div>
							<div class="btn-group" role="group"">
								<button type="button" class="btn btn-primary">길찾기</button>
								<button type="button" class="btn btn-primary">즐겨찾기</button>
								<button type="button" class="btn btn-primary">리뷰쓰기</button>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</section>
	
	<!-- 구매바 -->
	<section id="cafe_passBar" class="content container-xxl py-5">
		<div class="container aos-init aos-animate" data-aos="fade-up">
			<!-- 링크넣기 -->
			<div class="card mb-3" onclick="#">
				<div class="row g-0" style="align-items: center;">
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">패스구매하기</h5>
							<p class="card-text">이매장은 패스 사용이 가능한 매장입니다</p>
						</div>
					</div>
					<div class="col-md-4" style=" text-align: right; padding-right: 20px;">
						<i class="fas fa-mug-hot fa-4x"></i>
					</div>
				</div>
			</div>
			
		</div>
			
	</section>

	<!-- 하단설명 -->
	<section id="cafe_content" class="content container-xxl py-5">
		<div class="container " data-aos="fade-up">
			<!-- tab start -->
			<ul class="tabs clearfix" data-tabgroup="first-tab-group">
				<li><a href="#tab1" class="active">업체정보</a></li>
				<li><a href="#tab2">메뉴</a></li>
				<li><a href="#tab3">리뷰(50)</a></li>
			</ul>
			<section id="first-tab-group" class="tabgroup">
				<!-- 업체정보 -->
				<div id="tab1">
					<!-- 지도 -->
					<div id="map" style="width: 100%; height: 350px;"></div>

					<!-- 기본정보 -->
					<div data-viewid="basicInfo" data-root="" class="details_placeinfo">
						<div class="compInfoWrap">
							<dl class="compInfo">
								<!-- 업무시간 -->
								<dt>
									<i class="fas fa-clock"></i>
								</dt>
								<dd>
									평일 11:00 ~ 22:00<br>(last order 19:00)
								</dd>
								<dd>토, 일요일 12:00 ~ 23:00</dd>

								<!-- 휴무일 -->
								<dt>
									<i class="fas fa-calendar-alt"></i>
								</dt>
								<dd holiday="">목요일 휴무</dd>

								<!-- 전화번호 -->
								<dt>
									<i class="fas fa-phone-alt"></i>
								</dt>
								<dd telno="">
									<a href="tel:01040084233">010-4008-4233</a>
								</dd>
							</dl>
							<dl class="compInfo">
								<dt>
									<i class="fas fa-map-marker-alt"></i>
								</dt>
								<dd address="">제주특별자치도 제주시 애월읍 애월항로 2 애월</dd>

							</dl>
						</div>

					</div>

				</div>
				<div id="tab2">
					<!-- 메뉴 이미지-->
					<div class="bg-white border" style="text-align: center;">
						<img class="img-fluid"
							src="https://img1.kakaocdn.net/cthumb/local/R0x420/?fname=http%3A%2F%2Fpostfiles8.naver.net%2FMjAyMDAxMjNfMjYz%2FMDAxNTc5NzU0MzAwMTY5.NNPA_9J_DejIQHX4wmOAHce09R0YbeJg7AdAbMDwIScg.unCHym7bBOEkwYPc5UaWjkMrUmiIzzXYnzoF1B3aC5og.JPEG.ajsay%2FSE-71f049be-bf15-42a0-b719-858f273622ca.jpg%3Ftype%3Dw966"
							alt="">
					</div>
				</div>
				<div id="tab3">
					<!-- 별점정보 -->
					<div class="start_info mb-4">
						<div class="row justify-content-left d-flex ">
							<div
								class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-3">
								<div class="rating-box">
									<h1 class="pt-4">4.0</h1>
								</div>
								<div class="rating-box">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="far fa-star"></i>
								</div>
							</div>
							<div class="col-md-8">
								<div class="rating-bar0 justify-content-center">
									<table class="text-left mx-auto">
										<tbody>
											<!-- 5점 -->
											<tr>
												<td class="rating-label">5</td>
												<td class="rating-bar">
													<div class="bar-container">
														<div class="bar-5"></div>
													</div>
												</td>
												<td class="text-right">123</td>
											</tr>

											<!-- 4점 -->
											<tr>
												<td class="rating-label">4</td>
												<td class="rating-bar">
													<div class="bar-container">
														<div class="bar-4"></div>
													</div>
												</td>
												<td class="text-right">23</td>
											</tr>

											<!-- 3점 -->
											<tr>
												<td class="rating-label">3</td>
												<td class="rating-bar">
													<div class="bar-container">
														<div class="bar-3"></div>
													</div>
												</td>
												<td class="text-right">10</td>
											</tr>

											<!-- 2점 -->
											<tr>
												<td class="rating-label">2</td>
												<td class="rating-bar">
													<div class="bar-container">
														<div class="bar-2"></div>
													</div>
												</td>
												<td class="text-right">3</td>
											</tr>

											<!-- 1점 -->
											<tr>
												<td class="rating-label">1</td>
												<td class="rating-bar">
													<div class="bar-container">
														<div class="bar-1"></div>
													</div>
												</td>
												<td class="text-right">0</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- //row -->


					</div>

					
					<!-- 리뷰 -->
					<!-- 필터 -->
					<div class="d-flex mb-3 review_filter">
						<div class="flex-shrink-0">
							<select id="sendNotification" class="form-select" name="sendNotification">
								<option selected="">최신순</option>
								<option>좋아요순</option>
								<option>별점높은순</option>
								<option>별점낮은순</option>
							</select>
						</div>
						<div class="flex-grow-1 row">
							<div class="col text-end">
								<div class="form-check form-switch">
									<label style="margin-right: 45px;">포토리뷰만</label>
									<input class="form-check-input float-end" type="checkbox" role="switch" checked="">
								</div>
							</div>
						</div>
					</div>
					
					<!-- 리뷰시작 -->
					<ul class="reviewList">
						<%@ include file="/WEB-INF/views/user/cafe/review.jsp"%>
					</ul>
					<!-- //리뷰 -->

				</div>

			</section>
			<!-- tab end -->

		</div>
	</section>


	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>

	<script>
		$(function() {
			//alert("!!");
			$(".owl-carousel").owlCarousel(
			{
				autoplay : true,
				smartSpeed : 1500,
				items : 1,
				dots : true,
				loop : true,
				nav : false,
				navText : [ '<i class="bi bi-chevron-left"></i>',
						'<i class="bi bi-chevron-right"></i>' ]
			});

			//tab
			$('.tabgroup > div').hide();
			$('.tabgroup > div:first-of-type').show();
			$('.tabs a') .click( function(e) { e.preventDefault();
				var $this = $(this), tabgroup = '#'
					+ $this.parents('.tabs').data(
							'tabgroup'), others = $this
					.closest('li').siblings().children('a'), target = $this
					.attr('href');
				others.removeClass('active');
				$this.addClass('active');
				$(tabgroup).children('div').hide();
				$(target).show();

			})

		});
	
		//사진보기
		lightbox.option({
		    resizeDuration: 200,
		    wrapAround: true,
		    disableScrolling: false,
		    fitImagesInViewport:false
		})
		
		// 좋아요 - 바꾸실분은 바꾸어서 쓰세요(review.jsp에 있음)
		function fnAddReviewLike(){
			
		}
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1719acb269a938b6750fa57d8a6c11cb&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				var imageSrc = '/CoffeeProject/resources/img/기본_coffee1.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(64, 69), // 마커 이미지의 크기
				imgOptions = {
					offset : new kakao.maps.Point(27, 69)
				},

				markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
						imgOptions),

				// 결과값으로 받은 위치를 마커로 표시합니다
				marker = new kakao.maps.Marker({
					map : map,
					position : coords,
					image : markerImage
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	</script>
</body>

</html>