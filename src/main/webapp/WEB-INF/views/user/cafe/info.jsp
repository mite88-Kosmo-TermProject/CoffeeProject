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
	color: #888;
	padding: 20px 0;
	border-bottom: 2px solid #888;
	background: #f7f7f7;
}

.tabs a:hover, .tabs a.active {
	background: #ddd;
}

.tabgroup div {
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
</style>

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
						<ul>
							<li><i class="fa fa-solid fa-pen mt-2"></i> 3</li>
							<li><i class="fa fa-solid fa-star mt-2"></i> 3.5</li>
						</ul>
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
				<li><a href="#tab1" class="active">Tab 1</a></li>
				<li><a href="#tab2">Tab 2</a></li>
				<li><a href="#tab3">Tab 3</a></li>
			</ul>
			<section id="first-tab-group" class="tabgroup">
				<!-- 업체정보 -->
				<div id="tab1">
					<!-- 지도 -->
					<div id="map" style="width:100%;height:350px;"></div>

				</div>
				<div id="tab2">
					<h2>Heading 2</h2>
					<p>Adipisci autem obcaecati velit natus quos beatae explicabo
						at tempora minima voluptates deserunt eum consectetur reiciendis
						placeat dolorem repellat in nam asperiores impedit voluptas iure
						repellendus unde eveniet accusamus ex.</p>
				</div>
				<div id="tab3">
					<h2>Heading 3</h2>
					<p>Atque ratione soluta laboriosam illo inventore amet ipsum
						aliquam assumenda harum provident nam accusantium neque debitis
						obcaecati maxime officia saepe ad ducimus in quam libero vero
						quasi. Saepe sit nisi?</p>
				</div>


			</section>
			<!-- tab end -->
			11

		</div>
	</section>


	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

	<script>
		$(function() {
			//alert("!!");
			$(".owl-carousel").owlCarousel({
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
			$('.tabs a').click(function(e){
			  e.preventDefault();
			    var $this = $(this),
			        tabgroup = '#'+$this.parents('.tabs').data('tabgroup'),
			        others = $this.closest('li').siblings().children('a'),
			        target = $this.attr('href');
			    others.removeClass('active');
			    $this.addClass('active');
			    $(tabgroup).children('div').hide();
			    $(target).show();
			  
			})
			    
		});
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1719acb269a938b6750fa57d8a6c11cb&libraries=services"></script>
	<script>
	
	
	</script>
</body>

</html>