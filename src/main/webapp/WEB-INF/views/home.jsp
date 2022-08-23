<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>


<!-- Go Trip -->
<!-- Go Trip CSS  -->

<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/css/main.css">


<!-- Go Trip CSS -->

<meta charset="utf-8">

</head>

<body>

	<!-- Carousel Start -->
	<div class="container-fluid p-0 pb-5">
		<div class="owl-carousel header-carousel position-relative">
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid"
					src="<%=request.getContextPath()%>/resources/img/main커피1.png"
					alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To WooDY</h5>
								<h1 class="display-6 text-white animated slideInDown mb-4">Best
									Carpenter & Craftsman Services</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">무엇을 넣을까?</p>
								<!-- 이거 누르면 회원가입으로 갑니다 -->
								<a href="<%= request.getContextPath() %>/SignUp.do"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
									More</a> <a href=""
									class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
									Quote</a>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="owl-carousel-item position-relative">
				<img class="img-fluid"
					src="<%=request.getContextPath()%>/resources/img/커피2.png" alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To WooDY</h5>
								<h1 class="display-6 text-white animated slideInDown mb-4">카페
									추천1</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr
									justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd
									rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>


								<!-- 이거 누르면 회원가입으로 갑니다 -->
								<a href="<%= request.getContextPath() %>/SignUp.do"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
									More</a> <a href=""
									class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
									Quote</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid"
					src="<%=request.getContextPath()%>/resources/img/커피3.png" alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To WooDY</h5>
								<h1 class="display-6 text-white animated slideInDown mb-4">Best
									Carpenter & Craftsman Services</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr
									justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd
									rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>
								<!-- 이거 누르면 회원가입으로 갑니다 -->
								<a href="<%= request.getContextPath() %>/SignUp.do"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
									More</a> <a href=""
									class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
									Quote</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Carousel End -->


	<!-- 검색창 -->
	<div class="container-xxl py-3">
		<div class="container">
			<!-- <div class="section-title text-center">
				<h1 class="display-6 mb-5">Our Services</h1>
			</div> -->
			<div class="row">
				<div class="col wow fadeInUp" data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">

				</div>

				<div class="col-md-6 wow fadeInUp" data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
					<!-- 검색창 -->
					<form action="./cafe/list.do" method="post" onsubmit="searchValidate(this)">
					<div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4"
						data-bs-toggle="offcanvas" data-bs-target="#searchcanvasTop"
						aria-controls="offcanvasTop">
						
						<div class="input-group">
							<input type="text" name="searchTxt" placeholder="여기에 카페를 검색하세요"
								aria-describedby="button-addon1"
								class="form-control border-0 bg-light">
							<div class="input-group-append">
								<button id="button-addon1" type="submit"
									class="btn btn-link text-primary">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
					</form>

				</div>

				<div class="col wow fadeInUp" data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">

				</div>


			</div>
		</div>
	</div>
	<!-- 검색 end -->


	<!-- 이달의 카페 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="section-title text-center">
				<h1 class="display-6 mb-5">이달의 카페</h1>
			</div>
			<div class="row g-4">
			
			<c:forEach items="${mainCafeList }" var="cafe" varStatus="loop">
			
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/service-1.jpg"
								alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">${cafe.store_name }</h4>
							<p>카페전화번호 : ${cafe.store_phone } </p>
							<p> 카페주소: ${cafe.store_localaddr }</p>
							<a class="fw-medium" href="">Read More<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
			</c:forEach>
				
			</div>
		</div>
	</div>
	<!-- Service End -->
	<style>
#main_story .owl-stage-outer {
	border-radius: 2rem;
}
</style>

	<!-- 중앙 Start -->

	<div class="container-xxl py-5" id="main_story">
		<div class="container">
			<div class="section-title text-center">
				<h1 class="display-6 mb-5">카페 STORY</h1>
			</div>
			<div class="row g-4">
				<div class="col-12">

					<!-- Carousel Start -->
					<div class="container-fluid p-0 pb-5" id='box'>
						<div class="owl-carousel story-carousel position-relative"
							id='box'>
							<div class="owl-carousel-item position-relative" id='box'>
								<img class="img-fluid"
									src="<%=request.getContextPath()%>/resources/img/main커피1.png"
									alt="">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
									style="background: rgba(53, 53, 53, .7);">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-12 col-lg-8 text-center">
												<h5
													class="text-white text-uppercase mb-3 animated slideInDown">Welcome
													To WooDY</h5>
												<h1 class="display-6 text-white animated slideInDown mb-4">Best
													Carpenter & Craftsman Services</h1>
												<p class="fs-5 fw-medium text-white mb-4 pb-2">무엇을 넣을까?
												</p>
												<a href=""
													class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
													More</a> <a href=""
													class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
													Quote</a>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="owl-carousel-item position-relative ">
								<img class="img-fluid"
									src="<%=request.getContextPath()%>/resources/img/커피2.png"
									alt="">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
									style="background: rgba(53, 53, 53, .7);">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-12 col-lg-8 text-center">
												<h5
													class="text-white text-uppercase mb-3 animated slideInDown">Welcome
													To WooDY</h5>
												<h1 class="display-6 text-white animated slideInDown mb-4">카페
													추천1</h1>
												<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero
													elitr justo clita lorem. Ipsum dolor at sed stet sit diam
													no. Kasd rebum ipsum et diam justo clita et kasd rebum sea
													elitr.</p>
												<a href=""
													class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
													More</a> <a href=""
													class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
													Quote</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-carousel-item position-relative">
								<img class="img-fluid"
									src="<%=request.getContextPath()%>/resources/img/커피3.png"
									alt="">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
									style="background: rgba(53, 53, 53, .7);">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-12 col-lg-8 text-center">
												<h5
													class="text-white text-uppercase mb-3 animated slideInDown">Welcome
													To WooDY</h5>
												<h1 class="display-6 text-white animated slideInDown mb-4">Best
													Carpenter & Craftsman Services</h1>
												<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero
													elitr justo clita lorem. Ipsum dolor at sed stet sit diam
													no. Kasd rebum ipsum et diam justo clita et kasd rebum sea
													elitr.</p>
												<a href=""
													class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
													More</a> <a href=""
													class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
													Quote</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Carousel End -->

				</div>
			</div>
		</div>
	</div>




	<!-- 중앙 END -->


	<!-- Go Trip start -->


	<!-- Favourite Places Start -->
	<div class="favourite-place place-padding ">
		<div class="container">
			<!-- Section Tittle -->
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title text-center">
						<h1 class="display-6 mb-5">인플루언서 STORY</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.6s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services1.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>50</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									<!-- $1870 -->
									<span>#제주공항근처카페 #감성카페 #디저트카페</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li>기본음료_아메리카노음료</li>
									<li>변경 가능_2천원 할인</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.7s">
					<div class="single-place mb-30 wow fadeInUp" data-wow-delay="0.10s">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services2.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.8s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services3.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.9s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services4.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="1.0s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services5.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="1.1s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services6.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Favourite Places End -->
	<!-- Go Trip end -->


	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>


</body>

</html>