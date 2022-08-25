<%--
/**
 * <pre>
 * 1. 프로젝트명 : /mypage/main.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:44:51
 * 3. 작성자 : 전옥주
 * 4. 설명 : 마이페이지 메인
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
<!-- favicon -->
<link rel="shortcut icon"
	href="https://avatars2.githubusercontent.com/u/38456916?s=460&u=7db06c46c3c24a2cf19cb793aa8fbb24aedf18d0&v=4"
	type="image/x-icon">
<link
	href="<%= request.getContextPath() %>/resources/css/mypage/style.css"
	rel="stylesheet">

<style>
#postsgallery > .pic {
	padding-bottom: 40px;
}
</style>
</head>



<body>

	<!-- content -->

	<div class="page">
		<!-- HEADER -->
		<!-- <header>
            <div class="head-inner-wrap">
                <div class="logo">
                    <a href="https://github.com/Golobro" target="_blank">
                        <h3>마이페이지</h3>
                    </a>
                </div>
                <div class="search-bar">
                    <input type="text" placeholder="Search">
                    <span><i class="fa fa-search"></i></span>
                </div>
                <div class="btn">
                    <a href="#" class="cta">Log In</a>
                    <a href="#">Sign Up</a>
                </div>
            </div>
        </header> -->
		<!-- PROFILE -->
		<div class="profile-wrap mb-2rem">
			<div class="profile-avatar">
				<div class="circ-story circ-gradient"></div>
				<img id="profileimg"
					src="<%= request.getContextPath() %>/resources/img/user/${sessionScope.siteUserInfo.mem_img}"
					class="img-fluid " />
			</div>
			<div class="profile-info">
				<div class="profile-title mb-1rem">
					<h2>${sessionScope.siteUserInfo.mem_nickname }</h2>
					<button class="btn btn-primary">회원수정</button>
				</div>
				<!-- Profile Stats pc-->
				<ul class="profile-numbers mb-1rem">
					<li><a href="#"> <span id="posts" class="profile-posts">6</span> 후기
					</a></li>
					<li><a href="#"> <span  id="followers" class="profile-followers"></span>
							찜(북마크)
					</a></li>
					<li><a href="#"> <span  id="userpoint" class="profile-following">${sessionScope.siteUserInfo.mem_point }</span>
							유저포인트
					</a></li>
				</ul>
				<!-- <div class="profile-bio">
                    <h1 class="profile-name">Gologa Virobo</h1>
                    <span class="profile-desc">
                        Haters will say this is photoshoped!
                        <br> 
                        Here's some 🍕
                    </span>
                    <a href="https://github.com/Golobro" target="_blank" class="profile-link">https://github.com/Golobro</a>
                </div> -->

				<div class="blueBox">
					<div class="pointList">
						<p>
							<span class="txt">포인트</span>
							<a href="javascript:jppJs.go('/web/mypage/point')" class="num" chargesum="">0P</a>
						</p>
						<p>
							<span class="txt">기간</span>
							<a href="javascript:jppJs.go('/web/mypage/point')" class="num" savesum="">22-01-01 ~ 22-05-30</a>
						</p>
						<p>
							<span class="txt">남은갯수?</span>
							<a href="javascript:jppJs.go('/web/mypage/point')" class="num" donatesum="">15/30</a>
						</p>
						<!--<p><span class="txt">렌터카이용권</span><a th:href="|javascript:jppJs.go('/web/mypage/rentcarPoint');|" class="num" rentcarTotalSum>0p</a></p>-->
					</div>
					<div class="innerBox">
						<div class="ticket">
							<p>카페패스 이용권</p>
							<a href="/web/mypage/ticket" class="btLink btLine" cafeticket="">이용
								시작하기</a>

						</div>
						<div class="ticket">
							<p>포인트출금</p>
							<a href="/web/mypage/rentcarPoint" class="btLink btLine" rentcartotalsum="">출금</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- STORIES -->
		<div class="stories-wrap mb-2rem">
			<ul class="stories inner-wrap">
				<li class="story">
					<div class="img-wrap">
						<div class="circ"></div>
						<img src="https://source.unsplash.com/1600x900/?summer">
					</div>
					<div class="story-title">Chillin</div>
				</li>
				<li class="story">
					<div class="img-wrap">
						<div class="circ"></div>
						<img src="https://source.unsplash.com/1600x900/?pizza">
					</div>
					<div class="story-title">🍕</div>
				</li>
				<li class="story">
					<div class="img-wrap">
						<div class="circ"></div>
						<img src="https://source.unsplash.com/1600x900/?money">
					</div>
					<div class="story-title">M💰ney</div>
				</li>
			</ul>
		</div>
		<!-- RESPONSIVE PROFILE NUMBERS 모바일-->
		<ul class="profile-numbers responsive-profile">
			<li><a href="#"> <span class="profile-posts"></span>
					후기(모바일시 따로)
			</a></li>
			<li><a href="#"> <span class="profile-followers">800B</span>
					찜(북마크)(모바일시 따로)
			</a></li>
			<li><a href="#"> <span class="profile-following">10</span>
					???(모바일시 따로)
			</a></li>
		</ul>
		<!-- CONTENT -->
		<div class="tab-menu">
			<ul class="content-tabs inner-wrap  nav nav-tabs nav-fill" role="tablist">
				<!-- tab1 -->
				<li class="nav-item tabs">
					<a class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab1" aria-controls="tab1" aria-selected="false"> 
						<span class="tab-content"> 
							<svg aria-label="Posts" class="posts"
									fill="#0095f6" height="24" viewBox="0 0 48 48" width="24">
	                            <path clip-rule="evenodd"
										d="M45 1.5H3c-.8 0-1.5.7-1.5 1.5v42c0 .8.7 1.5 1.5 1.5h42c.8 0 1.5-.7 1.5-1.5V3c0-.8-.7-1.5-1.5-1.5zm-40.5 3h11v11h-11v-11zm0 14h11v11h-11v-11zm11 25h-11v-11h11v11zm14 0h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11zm14 28h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11z"
										fill-rule="evenodd">
	                            </path>
		                    </svg> 
	                        <span class="tab-text">후기</span>
						</span>
					</a>
				</li>
				
				<!-- tab2 -->
				<li class="nav-item tabs">
					<a class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab2" aria-controls="tab2" aria-selected="false"> 
						<span class="tab-content"> <i class="fas fa-heart fa-2x"></i></span> 
						<span class="tab-text">찜</span>
					</a>
				</li>
			</ul>
			
			
			<!-- 본문 -->
			<div class="tab-content" style="justify-content: center;">
				
				<div class="tab-pane fade active show" id="tab1" role="tabpanel">
	
				<!-- GALLERY -->
					<div class="gallery-pics inner-wrap">
						<div id="postsgallery" class="pic-wrap">
							<div class="pic">
								<div class="opacity-overlay">
									<img src="https://source.unsplash.com/1600x900/?beach">
								</div>
								<div class="icons">
									<i class="fas fa-coffee">00가게</i><br/>
									<i class="fa fa-heart">200m</i> 
									<i class="fa fa-calendar">2022/08/23</i>
								</div>
								<div style="background-color: yellow;">
									아이스아메리카노가 맛있네요....
								</div>
									<span><i class="fas fa-star"></i><span>8.0 Superb</span>
							</div>
							<div class="pic">
								<div class="opacity-overlay">
									<img src="https://source.unsplash.com/1600x900/?pool">
								</div>
								<div class="icons">
									<i class="fas fa-coffee">00가게</i><br/>
									<i class="fa fa-heart">200m</i> 
								</div>
							</div>
							<div class="pic">
								<div class="opacity-overlay">
									<img src="https://source.unsplash.com/1600x900/?summer">
								</div>
								<div class="icons">
									<i class="fas fa-coffee">00가게</i><br/>
									<i class="fa fa-heart">200m</i> 
								</div>
							</div>
							<div class="pic">
								<div class="opacity-overlay">
									<img src="https://source.unsplash.com/1600x900/?food">
								</div>
								<div class="icons">
									<i class="fas fa-coffee">00가게</i><br/>
									<i class="fa fa-heart">200m</i> 
								</div>
							</div>
							<div class="pic">
								<div class="opacity-overlay">
									<img src="https://source.unsplash.com/1600x900/?hotels">
								</div>
								<div class="icons">
									<i class="fas fa-coffee">00가게</i><br/>
									<i class="fa fa-heart">200m</i> 
								</div>
							</div>
							<div class="pic">
								<div class="opacity-overlay">
									<img src="https://source.unsplash.com/1600x900/?resort">
								</div>
								<div class="icons">
									<i class="fas fa-coffee">00가게</i><br/>
									<i class="fa fa-heart">200m</i> 
						
								</div>
							</div>
						</div>
					</div>
	
				</div>
		
				<div class="tab-pane fade" id="tab2" role="tabpanel">
				<div class="gallery-pics inner-wrap">
					<div id="jjimgallery" class="pic-wrap">
						<div class="pic">
							<div class="opacity-overlay">
								<img src="https://source.unsplash.com/1600x900/?beach">
							</div>
							<div class="icons">
								<i class="fas fa-coffee">00가게</i><br/>
								<i class="fa fa-heart">200m</i> 
								<i class="fa fa-calendar">2022/08/23</i>
							</div>
							<div style="background-color: yellow;">
								
							</div>
							
						</div>
						<div class="pic">
							<div class="opacity-overlay">
								<img src="https://source.unsplash.com/1600x900/?beach">
							</div>
							<div class="icons">
								<i class="fas fa-coffee">00가게</i><br/>
								<i class="fa fa-heart">200m</i> 
								<i class="fa fa-calendar">2022/08/23</i>
							</div>
							<div style="background-color: yellow;">
								
							</div>
							
						</div>
						
				</div>
			
			</div>
			<!-- 본문 -->
		
		</div>
		<!-- //tab-menu -->

	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>
<script>
	var postswrap = document.getElementById("postsgallery");
	var profileImg = document.getElementById("profileimg");
	var posts = document.getElementById("posts");
	var followers = document.getElementById("followers");
	var userpoint = document.getElementById("userpoint");
	
	function loadinformation(){
		$.ajax({
			url:'../mypage/loadinfo.do',
			dataType:'json',
			success:function(data){
				posts.innerText = data.length;
				makeReviewList(data);
				
			},
			error :function(msg){
				console.log(msg);
			}


		});
	}
	function loadJjiminformation(){
		$.ajax({
			url:'../mypage/loadjjiminfo.do',
			dataType:'json',
			success:function(data){
				followers.innerText = data.length;
				makeJjimList(data);
				
				
			},
			error :function(msg){
				console.log(msg);
			}


		});
	}
	function makeReviewList(data){
		var listStr = "";
		console.log(data[0].review_img);
		for(let i =0; i<data.length; i++){
			listStr +=	"<div class='pic'>";
			listStr +=	   "<div class='opacity-overlay'>";
			listStr +=		 "<img src='../resources/img/review/"+data[i].review_img+"'>";
			listStr +=	"</div>";
			listStr +=	"<div class='icons'>";
			listStr +=		"<i class='fas fa-coffee'>"+data[i].store_info.store_name+"</i><br/>";
			listStr +=		"<i class='fa fa-heart'>200m</i> ";
			listStr +=		"<i class='fa fa-calendar'>"+data[i].review_postdate+"</i>";
			listStr +=		"</div>";
			listStr +=		"<div style='background-color: yellow;'>";
			listStr +=		data[i].review_content
			listStr +=		"<div><i class='fas fa-star'></i><span>"+data[i].review_star+"별점</div>";
			listStr +=		"</div>";
			listStr +=	"</div>";
		}
		$("#postsgallery").append(listStr);
	}
	function makeJjimList(data){
		var jjimStr = "";
		console.log(data[0].review_img);
		for(let i =0; i<data.length; i++){
			jjimStr +=	"<div class='pic'>";
			jjimStr +=	   "<div class='opacity-overlay'>";
			jjimStr +=		 "<img src='../resources/img/stores/"+data[i].store_info.store_img+"'>";
			jjimStr +=	"</div>";
			jjimStr +=	"<div class='icons'>";
			jjimStr +=		"<i class='fas fa-coffee'>"+data[i].store_info.store_name+"</i><br/>";
			jjimStr +=		"<i class='fa fa-heart'>200m</i> ";
			jjimStr +=		"<i class='fa fa-calendar'>"+data[i].jjim_postdate+"</i>";
			jjimStr +=		"</div>";
			jjimStr +=	"</div>";
		}
		$("#jjimgallery").append(jjimStr);
	}
	$(function(){
		loadinformation();
		loadJjiminformation();
	});
</script>
</html>