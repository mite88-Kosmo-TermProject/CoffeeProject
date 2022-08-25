<%--
/**
 * <pre>
 * 1. 프로젝트명 : /community/boardView.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:43:40
 * 3. 작성자 : 전옥주
 * 4. 설명 : 커뮤니티 게시판 상세보기
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
<!-- 여기에 새로운 js,css파일있으면 넣기 -->

</head>


<body>
	
	<!-- content -->
<div class="container">
<c:if test="${mode eq 'write'}">
<span>글 작성을 </span>
</c:if>
<c:if test="${mode eq 'edit' }">
<span>글 수정을 </span>
</c:if>
<c:if test="${mode eq 'delete' }">
<span>글 삭제를 </span>
</c:if>
<span>실패했습니다.(권한 밖의 작업입니다.)</span>

<button class="btn btn-dark" type="button" 
			onclick="location.href='<%=request.getContextPath() %>/community/boardList.do?nowPage=${nowPage}&&board_flag=${board_flag }'">
			확인</button>
</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>