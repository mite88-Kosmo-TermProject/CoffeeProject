<%--
카카오 API 소셜로그인
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- header -->



<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->

	<!-- content -->

	<!-- footer -->

	<!-- d111b929650250ba880557f494275c43 -->
	<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>



	<script>
		/* JavaScript  앱키 */
		window.Kakao.init("d111b929650250ba880557f494275c43")
		

		
		function kakaoLogin(){
			window.Kakao.Auth.login({
				/* 아래꺼는 카카오에서 얻을수있는 정보입니다 없어도 상관없습니다 배열에 저절로 들어간대요 */
				/* scope:'profile_nickname,profile_image,account_email,gender,talk_message',  */
				success : function(authObj){
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: res=>{
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						}
					});
				}
			});
		}
		
		/* 복붙한거라 아는게 없습니다 */
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
		
	</script>


</head>



<body>

	<a href="javascript:kakaoLogin();">카카오 소셜로그인</a>
	<br>
	<br>
	<li onclick="kakaoLogout();"><a href="javascript:void(0)"> <span>카카오
				로그아웃</span>
	</a></li>


	<!-- content -->

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

	<!-- d111b929650250ba880557f494275c43 -->
	<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>

</body>

</html>