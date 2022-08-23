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
      <h2>비밀번호 찾기</h2>
    </div>

    <div class="content" style=" height: 900px; width:600px ">
      <form method="POST" action="#">

        <input id="email" type="email" name="email" title="email" placeholder="Email" required autofocus>
        <input id="email" type="name" name="name" placeholder="이름" required autofocus>
        
        <!-- 네이버 -->
        
				<div >
						<h4>본인확인</h4>
						<br>
						<div > 
							<p class="dsc">본인확인 이메일 주소 이름이 입력한 이메일 주소와 이름이 같아야, 인증할 수 있습니다.</p>	
							<dl>
							<p>인증실패시 재시도 해주세요, 기타 문의사항은 Kosmo를 방문해주세요.</p>
							</dl>
						</div>		
				</div>
        <!-- 네이버 -->
		        
        <br>
        
		&nbsp;
        <a href="https://www.ikosmo.co.kr/">&nbsp;비밀번호 찾기</a> &nbsp;
        <a href="https://www.ikosmo.co.kr/">메인페이지</a>
        <br>
        <button type="submit" class="btn btn-primary">찾기!</button>
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