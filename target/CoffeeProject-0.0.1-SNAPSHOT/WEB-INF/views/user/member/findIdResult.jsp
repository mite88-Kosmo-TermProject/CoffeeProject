<%--
/**
 * <pre>
 * 1. 프로젝트명 : /member/findIdResult.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:47:31
 * 3. 작성자 : 전옥주
 * 4. 설명 : 아이디찾기결과
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/img/icon.ico" />
<!DOCTYPE html>
<html lang="en">

<head>
<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->
</head>



<body>
	
	<!-- content -->
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					회원 아이디 : ${mem_id}
				</h5>
				<p class="w3-center">
					<button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Login</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../member/login.do';
		})
	})
</script>
</body>

</html>