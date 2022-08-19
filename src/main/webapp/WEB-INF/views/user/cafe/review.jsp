<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>

	<li class="photoY">
		<!-- 유저사진 및 유저명 -->
		<div class="reviewSet">
			<span class="thum">
				<img src="https://static-www.jejupass.com/resource/PC/images/mypage/@default_img.png" alt="">
			</span>
			<div class="tit">
				<div class="common-grade-badge d small has-text mb-2" >
					<i class="fas fa-coffee"></i>
					<p>다이아</p>
				</div>
				<strong class="name">리*맘</strong>
			
			</div>
		</div>
		<!-- 별점 및 날짜-->
		<div class="reviewSet">

			<div class="rating-box" style="text-align: left;">
				<i class="fas fa-star"></i> 
				<i class="fas fa-star"></i> 
				<i class="fas fa-star"></i> 
				<i class="fas fa-star"></i> 
				<i class="far fa-star"></i>
			</div>

			<em class="date">2022-03-11</em>
		</div>
		
		<!-- 리뷰내용 -->
		<div class="txt">진짜 맛있고 친절하고 이뻐요 또가고 싶어요~~~~~~~~</div> 
		
		<!-- 좋아요 -->
		<a class="frmLike">
			<input type="checkbox" id="chkLike0" title="좋아요" onclick="fnAddReviewLike();"
			href="javascript:;" style="display: none;"><label for="chkLike0">0</label>
		</a>
		
		<!-- 사진 -->
		<figure class="photoSet" data-count="2">
			<a href="https://static-file.jejupass.com/download/781859?width=592&amp;height=473" class="img-fluid" data-title="열심히 한 작업!!" data-lightbox="example-set">
				<img src="https://static-file.jejupass.com/download/781859?width=592&amp;height=473" class="img-fluid" alt="">
			</a>
			<a style="display:none;" href="https://static-file.jejupass.com/download/781860?width=592&amp;height=473" class="img-fluid" data-title="열심히 한 작업!!22" data-lightbox="example-set">
				<img src="https://static-file.jejupass.com/download/781860?width=592&amp;height=473" alt="" class="img-fluid">
			</a>

		</figure>
		
		
		<!-- 사장님댓글 -->
		<div class="comment mt-5" style="">
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
		</div>

	</li>


</body>
