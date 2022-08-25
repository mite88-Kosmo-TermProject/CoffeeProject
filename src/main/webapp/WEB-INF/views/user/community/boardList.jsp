<%--
/**
 * <pre>
 * 1. 프로젝트명 : /community/boardList.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:43:40
 * 3. 작성자 : 이호영
 * 4. 설명 : 커뮤니티 게시판 리스트
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

<div class="container-fluid">
		<c:if test="${board_flag eq 1 }">
			<h2>공지게시판</h2>
		</c:if>
		<c:if test="${board_flag eq 2 }">
			<h2>이벤트게시판</h2>
		</c:if>
		<c:if test="${board_flag eq 3 }">
			<h2>자유게시판</h2>
		</c:if>
	<div>
		<form action="<%=request.getContextPath() %>/community/searchList.do?">
			<select name="searchField" id="searchField">
				<option value="board_title">제목</option>
				<option value="mem_id">작성자</option>
				<option value="board_content">내용</option>
			</select>
			<input type="hidden" name="board_flag" value="${board_flag }" />
			<input type="hidden" name="nowPage" value="${nowPage }" />
			<input type="text" name="searchTxt" id="searchTxt" />
			<button type="submit" class="btn btn-dark">검색</button>
		</form>
	</div>
	<div >
	  <table class="table table-hover">
	    <tr>
	    	<th>글 번호</th>
	    	<th>글 제목</th>
	    	<th>작성자</th>
	    	<th>작성일</th>
	    	<th>조회수</th>
	    </tr>
	    <c:forEach items="${lists }" var="item">
	    	<tr>
	    		<td>${item.board_idx }</td>
	    		<td><a href="../user/community/boardView.do?board_idx=${item.board_idx }&&board_flag=${item.board_flag}&&nowPage=${nowPage}">${item.board_title }</a></td>
	    		<td>${item.mem_id }</td>
	    		<td>${item.board_postdate }</td>
	    		<td>${item.board_visitcount }</td>
	    	</tr>
	    </c:forEach>
	    <tr>
	    	<td colspan="5" style="text-align: center">${pagingImg}</td>
	    	
	    </tr>
	    <tr>
	    	<td colspan="5" style="text-align: left"><button type="button" style="border-radius: 20px;" class="btn btn-success" 
			onclick="location.href='<%=request.getContextPath() %>/community/boardWrite.do?nowPage=${nowPage }&&board_flag=${board_flag }'">글쓰기</button></td>
	    </tr>
	  </table>
	</div>
</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>