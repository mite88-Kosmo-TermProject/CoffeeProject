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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/img/icon.ico" />

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

/*슬라이드*/
.item {
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
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
#cafe_passBar * {
	color: #fff;
}

#cafe_passBar .card {
	background: #b38255;
	cursor: pointer;
}

#cafe_passBar i {
	
}

/*리뷰*/
.reviewList {
	border-top: 1px solid #202020
}
</style>

<link href="<%=request.getContextPath()%>/resources/css/review.css"
	rel="stylesheet">


<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->
<script type="text/javascript">
//찜(하트)
function heart(x,idx,id) {
   	if(id==="null" || id===""){
  		alert("로그인 후 이용해주세요");
  		return false;
  	} 
  	console.log(idx);
  	console.log(id);
  	$.ajax({
  		url : "../jjim.do",
  		type : "POST",
  		data : {"review_idx" : idx,
  				"user_id" : id	
  		},
  		dataType : "json",
  		success : (data) =>{
  			console.log(data.check);
  			if (data.check === 0) {
  		          x.className = "fas fa-heart fa-lg";
  		          x.style.color = "red";
  		        } else {
  		          x.className = "far fa-heart fa-lg";
  		          x.style.color = "black";
  		        }
  		},
  		error : (err) =>{
  			console.log("에러");
  		},
  	});
}
</script>
</head>



<body>

	<%-- ${resultList }  --%>
	<!-- content -->
	<!-- 상단 간단내용 -->
	<c:forEach items="${resultList}" var="resultList">
	<input type="hidden" value="${check_review}" id="total_store_star">

		<section id="cafe_info" class="info container-xxl py-5">
			<div class="container aos-init aos-animate" data-aos="fade-up">

				<div class="row content">
					<!-- 이미지 -->
					
					<div class="col-md-4">
						<div class="owl-carousel">
							
							<c:forEach items="${fn:split(resultList.store_img,',') }"
								var="loopImg" varStatus="loop">
								<div class="item">
									<img class="img-fluid" id="code_${loop.index }"
										src="<%=request.getContextPath()%>/resources/img/stores/${loopImg}.jpg"
										alt="">
								</div>
							</c:forEach>

						</div>

						<c:if test="${resultList.store_afltd == 1}">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/패스가입베너.png"
								alt="">
						</c:if>
					</div>
					<div class="col-md-8 pt-4 pt-lg-0">
						<!-- 할인항목 -->
						<ul class="list-group list-group-horizontal mb-3">
							<li><span class="badge bg-secondary list-group-item me-3">아메리카노
									무료</span></li>
							<!-- <li><span class="badge bg-secondary list-group-item">아메리카노
									무료2</span></li> -->
						</ul>
						<!-- 카페명 -->
						<h2 class="titDep1 mb-3" cafename="">${resultList.store_name}</h2>

						<!-- 해시태그 -->
						<p class="tagWrap mb-3" displaykeyworlds="">
							<span class="tag">#${check_tag[0].store_tag}</span>
						</p>

						<!-- 업체정보 -->
						<p class="txt mp-5 pb-3" introduce="">${resultList.store_notice}</p>


						<!-- 후기 수 등 기본수치 -->
						<div class="place-cap-bottom border-top">

							<div class="d-flex p-2 justify-content-between border-bottom">
								<div class="">
									<ul>
										<li><i class="fa fa-solid fa-pen mt-2"></i>
											${check_review}</li>
										<li><i class="fa fa-solid fa-star mt-2"></i>
											${resultList.store_star}</li>
										<li><i class="far fa-heart fa-lg" id="heart" onclick="heart(this,'${resultList.store_idx}','${sessionScope.user_id }')"></i></li>
									</ul>
								</div>
								<div class="btn-group" role="group"">
									<button type="button" class="btn btn-primary" id="map_url">길찾기</button>
									<button type="button" class="btn btn-primary" id="send_url">즐겨찾기</button>
									<button type="button" class="btn btn-primary"
										id="review_coffee"
										onclick="location.href='<%=request.getContextPath()%>/cafeSNS/writePage.do?store_idx=${resultList.store_idx }' ">리뷰쓰기</button>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</section>

		<!-- 구매바 -->
		<c:if test="${resultList.store_afltd == 1}">
			<section id="cafe_passBar" class="content container-xxl py-5">
				<div class="container aos-init aos-animate" data-aos="fade-up">
					<!-- 링크넣기 -->
					<div class="card mb-3"
						onclick="location.href='<%=request.getContextPath()%>/order/subPay.do';">
						<div class="row g-0" style="align-items: center;">
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">패스구매하기</h5>
									<p class="card-text">이매장은 패스 사용이 가능한 매장입니다</p>
								</div>
							</div>
							<div class="col-md-4"
								style="text-align: right; padding-right: 20px;">
								<i class="fas fa-mug-hot fa-4x"></i>
							</div>
						</div>
					</div>

				</div>

			</section>
		</c:if>

		<!-- 하단설명 -->
		<section id="cafe_content" class="content container-xxl py-5">
			<div class="container " data-aos="fade-up">
				<!-- tab start -->
				<ul class="tabs clearfix" data-tabgroup="first-tab-group">
					<li><a href="#tab1" class="active">업체정보</a></li>
					<li><a href="#tab2">메뉴</a></li>
					<li><a href="#tab3" onclick="review(1)">리뷰(${check_review})</a></li>
				</ul>
				<section id="first-tab-group" class="tabgroup">
					<!-- 업체정보 -->
					<div id="tab1">
						<!-- 지도 -->
						<div id="map" style="width: 100%; height: 350px;"></div>

						<!-- 기본정보 -->
						<div data-viewid="basicInfo" data-root=""
							class="details_placeinfo">
							<div class="compInfoWrap">
								<dl class="compInfo">
									<!-- 업무시간 -->
									<dt>
										<i class="fas fa-clock"></i>
									</dt>
									<dd class="store_time">${resultList.store_time}</dd>

									<!-- 휴무일 -->
									<!-- <dt>
										<i class="fas fa-calendar-alt"></i>
									</dt>
									<dd holiday="">목요일 휴무</dd> -->

									<!-- 전화번호 -->
									<dt>
										<i class="fas fa-phone-alt"></i>
									</dt>
									<dd telno="">
										<a href="tel:${resultList.store_phone}">${resultList.store_phone}</a>
									</dd>
								</dl>
								<dl class="compInfo">
									<dt>
										<i class="fas fa-map-marker-alt"></i>
									</dt>
									<dd id="addr" address="">${resultList.store_roadaddr}</dd>

								</dl>
							</div>

						</div>

					</div>
					<div id="tab2">
						<!-- 메뉴 이미지-->
						<div class="bg-white border" style="text-align: center;">

							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/stores/${resultList.store_menu_img}"
								alt="">
							<!-- <img class="img-fluid"
								src="https://img1.kakaocdn.net/cthumb/local/R0x420/?fname=http%3A%2F%2Fpostfiles8.naver.net%2FMjAyMDAxMjNfMjYz%2FMDAxNTc5NzU0MzAwMTY5.NNPA_9J_DejIQHX4wmOAHce09R0YbeJg7AdAbMDwIScg.unCHym7bBOEkwYPc5UaWjkMrUmiIzzXYnzoF1B3aC5og.JPEG.ajsay%2FSE-71f049be-bf15-42a0-b719-858f273622ca.jpg%3Ftype%3Dw966"
								alt=""> -->
						</div>
					</div>
					<div id="tab3">
						<!-- 별점정보 -->

						<!-- 별점정보 -->
						<div class="start_info mb-4">
							<div class="row justify-content-left d-flex ">
								<div
									class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-3">
									<div class="rating-box  totalNum">
										<h1 class="pt-4">${resultList.store_star}</h1>
									</div>
									<div class="rating-box totalStar">
										
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
															<div class="bar-5" num="${bar5}"></div>
														</div>
													</td>
													<td class="text-right">${bar5}</td>
												</tr>

												<!-- 4점 -->
												<tr>
													<td class="rating-label">4</td>
													<td class="rating-bar">
														<div class="bar-container">
															<div class="bar-4" num="${bar4}"></div>
														</div>
													</td>
													<td class="text-right">${bar4}</td>
												</tr>

												<!-- 3점 -->
												<tr>
													<td class="rating-label">3</td>
													<td class="rating-bar">
														<div class="bar-container">
															<div class="bar-3" num="${bar3}"></div>
														</div>
													</td>
													<td class="text-right">${bar3}</td>
												</tr>

												<!-- 2점 -->
												<tr>
													<td class="rating-label">2</td>
													<td class="rating-bar">
														<div class="bar-container">
															<div class="bar-2" num="${bar2}"></div>
														</div>
													</td>
													<td class="text-right">${bar2}</td>
												</tr>

												<!-- 1점 -->
												<tr>
													<td class="rating-label">1</td>
													<td class="rating-bar">
														<div class="bar-container">
															<div class="bar-1" num="${bar1}"></div>
														</div>
													</td>
													<td class="text-right">${bar1}</td>
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
								<select id="sendNotification" class="form-select"
									name="sendNotification">
									<option value="1" selected="">최신순</option>
									<option value="2">좋아요순</option>
									<option value="3">별점높은순</option>
									<option value="4">별점낮은순</option>
								</select>
							</div>
							<!-- <div class="flex-grow-1 row">
								<div class="col text-end">
									<div class="form-check form-switch">
										<label style="margin-right: 45px;">포토리뷰만</label> <input
											class="form-check-input float-end" type="checkbox"
											role="switch" checked="">
									</div>
								</div>
							</div> -->
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

	</c:forEach>


	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/like.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>

	<!--kakaotalk link share api-->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<%=request.getParameter("store_idx")%>
	<script>
	
	//총별점 그리기
	var star = $(".rating-box.totalNum").text();
	var star_txt = "";
	for (var i = 1; i < 6; i++) {
		if(i<= star){
			star_txt += '<i class="fas fa-star" style="color:#fd5a0f;"></i>';
		}
		else{
			star_txt += '<i class="far fa-star" style="color:#fd5a0f;"></i>';
		}
	}
	$(".rating-box.totalStar").append(star_txt);
	//alert(Number($(".bar-1").attr("num")) +"/"+$("#total_store_star").val());
	//별점별 막대그래프그리기
	$(".bar-1").css("width", (Number($(".bar-1").attr("num")) /$("#total_store_star").val())*100 +"%");
	$(".bar-2").css("width", (Number($(".bar-2").attr("num")) /$("#total_store_star").val())*100 +"%");
	$(".bar-3").css("width", (Number($(".bar-3").attr("num")) /$("#total_store_star").val())*100 +"%");
	$(".bar-4").css("width", (Number($(".bar-4").attr("num")) /$("#total_store_star").val())*100 +"%");
	$(".bar-5").css("width", (Number($(".bar-5").attr("num"))  /$("#total_store_star").val())*100+"%");
	
	
	//정렬
	$("#sendNotification").on( "change", function() {
		
		//alert($(this).val());
		review($(this).val());

	});

	
	function review(type) {
		const url = new URL($(location).attr('href'));
		console.log(url);
		const urlParam = url.searchParams;
		const param = urlParam.get('store_idx');
		
		$.ajax({
			type : 'POST',
			url : '../cafe/review.do?store_idx='+param+'&type='+type,
			dataType : 'json',
			success : function (data) {
				$(".reviewList #show_data").empty();//새로고침용
				
				var user = data.user;
	               console.log(user);
				let tableData = "";
				const check_like = data.check_like;
				const lists = data.review_list;
				console.log(lists);
				for (var i = 0; i < check_like.length; i++) {
					console.log(check_like[i].review_idx);
				}
				$(lists).each(function (index, data) {
					var star = data.review_star;
					var star_txt = "";
					for (var i = 1; i < 6; i++) {
						if(i<= star){
							star_txt += '<i class="fas fa-star"></i>';
						}
						else{
							star_txt += '<i class="far fa-star"></i>';
						}
					}
					var color = "black";
					for(var i=0; i<check_like.length; i++){
						if(check_like[i].review_idx == data.review_idx){
							color = "red";
							break;
						}
					}
					var files = data.imageDTO.image_save.split("/");
					tableData +='<li class="photoY">'
							+'<div style="width:calc(100% - 200px);"><div class="reviewSet">'
							+	'<span class="thum">'
							 +      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" /></span>'
							+	'<div class="tit">'
							+		'<div class="common-grade-badge d small has-text mb-2" >'
							+			'<i class="fas fa-coffee"></i>'
							+			'<p>카페리뷰</p></div>';
							 if (data.memberDTO.mem_nickname == null ||
									   data.memberDTO.mem_nickname == undefined ||
									   data.memberDTO.mem_nickname == "null") {
								 tableData += '<strong class="name">비회원</strong></div></div>';
							 }else{
								 tableData +='<strong class="name">'+data.memberDTO.mem_nickname+'</strong></div></div>';
							 }
							tableData +='<div class="reviewSet">'
							+	'<div class="rating-box" style="text-align: left;">'
							+ star_txt
							+		'</div></div>'
							+ '<br>'
							+'<div class="txt_content">'+data.review_content+'</div>' 
							+ '<br>'
							+`<a class="frmLike" onclick="like(this,`+data.review_idx+`,'`+user+`');">`
							+'<i class="far fa-thumbs-up fa-lg" id="thumb" style="color:'+color+' ;"  ></i>'
							+'<small name="hit" id="hit">'+data.like_hit+'</small>'
							/* +	'<input type="checkbox" id="chkLike0" title="좋아요" onclick="fnAddReviewLike();"	 href="javascript:;" style="display: none;"><label for="chkLike0">0</label>' */
							+'</a></div>'
							
							+'<figure class="photoSet"  style="width:150px;" data-count="2">'
							+	'<a href="../resources/img/review/'+files[0]+'?width=592&amp;height=473" class="img-fluid" data-title="'+data.memberDTO.mem_id+'님의리뷰" data-lightbox="example-set'+data.review_idx+'">'
							+		'<img src="../resources/img/review/'+files[0]+'?width=592&amp;height=473" class="img-fluid" alt=""></a>'
							+	'<a style="display:none;" href="../resources/img/review/'+files[1]+'?width=592&amp;height=473" class="img-fluid" data-title="'+data.memberDTO.mem_id+'님의리뷰" data-lightbox="example-set'+data.review_idx+'">'
							+		'<img src="../resources/img/review/'+files[1]+'?width=592&amp;height=473" alt="" class="img-fluid"></a></figure>'
							
							
							<!-- 사장님댓글 -->
							<%-- <div class="comment mt-5" style="">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">
											<i class="fas fa-level-up" style="transform: rotate(90deg);"></i>
											<img src="<%= request.getContextPath() %>/resources/img/커피점원아이콘.png" alt="" class="img-fluid">
											사장님
										</h5>
										<p class="card-text">This is another card with title and
											supporting text below. This card has some additional content to
											make it slightly taller overall.</p>
										<p class="card-text">
											<small class="text-muted">10분전</small>
										</p>
									</div>
								</div>
							</div> --%>

						+'</li>'
				});
				$('#show_data').append(tableData);
			},
				error : function (err) {
					console.log("에러발생"+ err.status);
				}
		});
	}
	

	$(function() {
		//alert("!!");
		
		var name = $(".titDep1"); //가게명
		var addr = $(".compInfo #addr") ; //주소

		
		//길찾기 url
		$("#map_url").on("click", function() {
			//alert(addr.text());
			 if (Mobile()){// 모바일일 경우
				 window.open('https://m.map.kakao.com/actions/routeView?exEnc=LRVRTU&eyEnc=QNMNSSL&endLoc='+addr.text()+'&ids=%2CLRVRTU%2CQNMNSSL',  '_self');
				 
				 } else {// 모바일 외
			    	 window.open('https://map.kakao.com/?eName='+addr.text(),  '_self');
			    	 
			    }
		})
		
		//카카오톡 url 보내기
		$("#send_url").on("click", function() {
			sendLinkDefault(name, addr);
		})
		
		//슬라이더
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
	
	//설명 및 시간 \n 치환
	var txt = $('.txt').html();
	txt = txt.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('.txt').html(txt);
	
	var store_time = $('.store_time').html();
	store_time = store_time.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('.store_time').html(store_time);

	//사진보기
	lightbox.option({
	    resizeDuration: 200,
	    wrapAround: true,
	    disableScrolling: false,
	    fitImagesInViewport:false,
	    maxWidth : 800
	})
	
	//모바일분류
	function Mobile(){
		return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
	
	}
	
	function sendLinkDefault(name, addr){
		var img1 = $("#code_0") ; //첫번째이미지
		//http://cofficepass.ml/CoffeeProject/
		
		console.log(img1.attr("src"));
   		// 카카오톡 링크 생성
   		
      // 중복 initialization 방지
      if (!Kakao.isInitialized()) {
          // 두번째 step 에서 가져온 javascript key 를 이용하여 initialize
    	  Kakao.init("1719acb269a938b6750fa57d8a6c11cb");
      }
   		
      // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
       Kakao.Link.createDefaultButton({
          container: '#send_url',
          objectType: 'location',
          address:addr.text(),    // 공유할 위치의 주소
          addressTitle:name.text(),   // 카카오톡 내의 지도 뷰에서 사용되는 타이틀
          content: {
              title: name.text(),
              description: '주소 :'+addr.text()+"\n",
              imageUrl: "http://cofficepass.ml/"+img1.attr("src"),
              link: {
                  mobileWebUrl: window.location.href,
                  webUrl: window.location.href
              }
          },
          social: {
        	  likeCount: 1234, // 콘텐츠의 좋아요 수
        	  subscriberCount: 3489, // 콘텐츠의 구독 수
          },
          buttons: [
              {
                  title: '가게정보보기',
                  link: {
                      mobileWebUrl: window.location.href,
                      webUrl:window.location.href
                  }
              },
              {
                  title: '위치 보기',
                  link: {
                      mobileWebUrl: window.location.href,
                      webUrl: window.location.href
                  }
              }
          ]
      });

    }
	
	
	// 좋아요 - 바꾸실분은 바꾸어서 쓰세요(review.jsp에 있음)
	function fnAddReviewLike(){
		
	}
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1719acb269a938b6750fa57d8a6c11cb&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		
		addr = document.getElementById('addr').innerText, //주소
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
		geocoder.addressSearch(addr, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				//alert(result[0].y+"/"+result[0].x);

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				var imageSrc = '/CoffeeProject/resources/img/기본_coffee1.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(35, 40), // 마커 이미지의 크기
				
				imgOptions = {
					offset : new kakao.maps.Point(15, 37)
				},

				markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),

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