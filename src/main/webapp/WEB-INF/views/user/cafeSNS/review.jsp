<%--
/**
 * <pre>
 * 1. 프로젝트명 : /cafeSNS/review.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:42:37
 * 3. 작성자 : 전옥주
 * 4. 설명 : 카페SNS 리스트
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

</head>



<body>
	<ul>
		<li>커밋</li>
	</ul>
	<!-- content -->
	<table id="show_data" style="border: 1px; solid; black;0"></table>
	<button type="button" id="testbtn">더보기</button>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/cafeSNS.js"></script>
</body>

</html>