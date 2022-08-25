<%--
/**
 글쓰기 페이지
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

<!-- 너무 간단해서 그냥 여기다 넣었습니다 -->

<style>
h6{
	color: #AB7442;
}

#apple {
  height:400px;
}

</style>


<!-- content -->
<body>
	<article>
		<div class="container" role="main">
		<br>
			<h1>게시글 작성</h1>
			
			<br>
			<form>
				<div class="mb-3">
					<!-- <label for="title">제목</label>  -->
					
					
					<h6>제목</h6>
					<input type="text"
						class="form-control" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<h6>작성자</h6>
					<input type="text" class="form-control" placeholder="이름을 입력해 주세요" >
				</div>
				<div class="mb-3">
					<h6>내용</h6>
					<textarea class="form-control" rows="5"
						placeholder="내용을 입력해 주세요" id="apple"></textarea>
				</div>
				
			</form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" >저장</button>
				<button type="button" class="btn btn-sm btn-primary" >목록</button>
			</div>
		</div>
	</article>
<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
</body>



</html>