<%--
/**
 * <pre>
 * 1. 프로젝트명 : /member/joinResult.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:47:31
 * 3. 작성자 : 전옥주
 * 4. 설명 : 회원가입결과
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
	<h2>회원가입 성 공 !!</h2>
		
		<li>
			<a href="<%request.getContextPath(); %>../user/member/list.do" target="_self">
			메인 가기
			</a>
		</li>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>