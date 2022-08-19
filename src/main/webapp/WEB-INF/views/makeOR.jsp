<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<%-- <%= response.sendRedirect("/makeQR.do?url=http://http://www.naver.com"); %> --%>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	
	<script>
	$(function(){
		alert("!!");
		callContent();
		
	});
	
	function callContent(){
	
		$.ajax({
				// URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
				url : 'makeQRajax.do',
				type : 'GET',
				data : {
					url : 'http://www.naver.com',
					storeName : 'name'
				},
				dataType : 'text',
				success : function(data, status, xhr) {
					alert(data);
				},
				error : function(xhr, status, error) {

				},
				complete : function(xhr, status) {

				}
			});
		}
	</script>

</body>

</html>