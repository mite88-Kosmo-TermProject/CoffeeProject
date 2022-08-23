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
<link href="<%=request.getContextPath()%>/resources/assets/css/idpass.css" rel="stylesheet" type="text/css">

	<!-- footer -->


<style>

.div-center {
    margin-left: auto;
    margin-right: auto;

    text-align: center;  
}
</style>
</head>



<body >


<div id="login" >
  <div class="login-card" style=" height: 550px; width:600px ">

    <div class="card-title" style=" width:600px ">
      <h2>아이디 찾기</h2>
    </div>

    <div class="content" style=" height: 900px; width:600px ">
      <form method="POST" action="#">

        <!-- 네이버 -->
        
				<div >
						<br>
						<br>
						<br>
						<br>
						<div class="div-center"> 
							<a style="font-size: 22px"  class="link_info">아이디는 &nbsp;&nbsp;</a> 
							<a style="font-size: 30px">순만아열심히하자!</a> 
							<a style="font-size: 22px"  class="link_info">&nbsp;&nbsp;입니다.</a>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						</div>		
				</div>
        <!-- 네이버 -->
		        
        <br>
        
		&nbsp;
        <a href="https://www.ikosmo.co.kr/">비밀번호 찾기</a> &nbsp;
        <a href="https://www.ikosmo.co.kr/">메인페이지</a>
        <br>
        <br>
        <button type="submit" class="btn btn-primary">로그인</button>
      </form>
    </div>
  </div>
</div>

<div class="div-center" >
    <h2 class="screen_out">서비스 이용정보</h2>
    <br>
    <a href="https://www.ikosmo.co.kr/" class="link_info" data-tiara-action-name="서비스_약관_정책">서비스 약관/정책</a>
    &nbsp;|&nbsp; <a href="https://www.ikosmo.co.kr/" class="link_info" data-tiara-action-name="개인정보처리방침">개인정보처리방침</a>
    &nbsp;|&nbsp; <a href="https://www.ikosmo.co.kr/" class="link_info" data-tiara-action-name="권리침해신고">권리침해신고</a>
    &nbsp;|&nbsp; <a href="https://www.ikosmo.co.kr/" target="_blank" class="link_info" data-tiara-action-name="고객센터">고객센터</a>
    <address class="txt_copyright">Copyright &#169; <a href="https://www.ikosmo.co.kr/" class="link_daum" data-tiara-action-name="카카오_회사소개_링크">Kakao Corp.</a> All rights reserved.
    </address>
</div>
	<!-- content -->

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
</body>

</html>