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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>
<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/cafeSNS.js"></script>
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

</body>

</html>