<%--
/**
 * <pre>
 * 1. 프로젝트명 : 
 * 2. 작성일 : 2022. 7. 13. 오전 10:27:24
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판쓰기</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	<h2>비회원제 게시판 - 상세보기</h2>
	
	<table class="table table-bordered">
		<colgroup>
			<col width="20%" />
			<col width="30%" />
			<col width="20%" />
			<col width="30%" />
		</colgroup>
		<tr>
			<th>No</th>
			<td>${viewRow.idx }</td>
			<th>작성자</th>
			<td>${viewRow.name }</td>			
		</tr>
		<tr>
			<th>작성일</th>
			<td>${viewRow.postdate }</td>			
			<th>조회수</th>
			<td>${viewRow.hits }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				${viewRow.title }
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" style="height:150px;">
				${viewRow.contents }
			</td>
		</tr>		
		<tr>
			<td colspan="4" align="center">	
			<button type="button" class="btn btn-secondary"
				onclick="location.href='./reply.do?idx=${viewRow.idx}&nowPage=${nowPage }';">
				답변글달기</button>
			
			<button type="button" class="btn btn-secondary"
				onclick="location.href='./password.do?idx=${viewRow.idx}&mode=edit&nowPage=${nowPage }';">
				수정하기</button>
				
			<button type="button" class="btn btn-secondary"
				onclick="location.href='./password.do?idx=${viewRow.idx}&mode=delete&nowPage=${nowPage }';">
				삭제하기</button>
				
				
			<c:if test="${empty searchColumn }"> 
			<button type="button" class="btn btn-secondary"
				onclick="location.href='./list.do?nowPage=${param.nowPage}';">리스트보기</button>
			</c:if>
			
			<c:if test="${not empty searchColumn }"> 
			<button type="button" class="btn btn-secondary"
				onclick="location.href='./list.do?nowPage=${param.nowPage}&searchColumn=${searchColumn}&searchWord=${searchWord}';">리스트보기</button>
			</c:if>
				
			
			</td>
		</tr>
	</table>
</div>

</body>
</html>