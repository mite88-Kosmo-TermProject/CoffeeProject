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
<form action="<%=request.getContextPath() %>/community/boardWriteAction.do?nowPage=${nowPage}&&mode=write" method="post">

	<table class="table">
		<tr>
			<th>카테고리</th>
			<td colspan="3">
				<select name="board_flag">
					<c:if test="${map.mem_case eq '4' }">
						<option value="1" >공지사항</option>
						<option value="2" >이벤트</option>
					</c:if>
					<option value="3" >자유게시판</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3"><input type="text" name="board_title" placeholder="제목을 입력하세요" size="80"/></td>
		</tr>
		<tr>
			<th>글내용</th>
<%-- 			<td>${list.board_content }</td> --%>
			<td colspan="3"><textarea rows="15" name="board_content" cols="80" placeholder="내용을 입력하세요"></textarea> </td>
		</tr>
		<tr>
			<td colspan="4"><button class="btn btn-dark" type="submit">작성하기</button>   <button class="btn btn-dark" type="button" 
			onclick="location.href='<%=request.getContextPath() %>/community/boardList.do?nowPage=${nowPage }&&board_flag=${board_flag }'">
			돌아가기</button></td>
			
		</tr>
	</table>
</form>
</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>

</html>