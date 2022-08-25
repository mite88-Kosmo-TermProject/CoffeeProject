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
	<table class="table">
		<tr>
			<th>글제목</th>
<%-- 			<td>${list.board_title }</td> --%>
			<td colspan="3">${map.board_title }</td>
			<th>조회수</th>
			<td>${map.board_visitcount }</td>
		</tr>
		<tr>
			<th>작성일자</th>
<%-- 			<td>${list.board_title }</td> --%>
			<td >${map.board_postdate }</td>
			<th>작성자</th>
			<td>${map.mem_id }</td>
		</tr>
		<tr>
			<th>글내용</th>
<%-- 			<td>${list.board_content }</td> --%>
			<td colspan="3">${map.board_content }</td>
		</tr>
		<tr>
			<td colspan="4">
			  <button class="btn btn-dark" type="button" 
			onclick="location.href='<%=request.getContextPath() %>/community/boardList.do?nowPage=${nowPage}&&board_flag=${board_flag }'">
			글목록</button>
			
				<a href="<%=request.getContextPath() %>/community/boardEdit.do?nowPage=${nowPage}&&mode=edit&&board_idx=${board_idx}&&board_flag=${board_flag }"><button class="btn btn-dark">수정하기</button></a>
			
				<a href="<%=request.getContextPath() %>/community/boardDelete.do?nowPage=${nowPage}&&mode=delete&&board_idx=${board_idx}&&board_flag=${board_flag }"><button class="btn btn-dark">삭제하기</button></a>
			</td>
			
		</tr>
	</table>
</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>