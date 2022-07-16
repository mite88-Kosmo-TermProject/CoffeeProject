<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./commons/header.jsp"%>
<body>

	<div class="container">
		<!-- Top영역 -->
		<%@ include file="./commons/top.jsp"%>
		<!-- Body영역 -->
		<div class="row">
			<!-- Left메뉴영역 -->
			<%@ include file="./commons/left.jsp"%>
			<!-- Contents영역 -->
			<div class="col-9 pt-3">
				<h3>비회원제 게시판 - 상세보기</h3>

				<form name="writeFrm" method="post" action="./writeAction.do"
					onsubmit="return checkValidate(this);">
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
							<td colspan="3">${viewRow.title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" style="height: 150px;">${viewRow.contents }
							</td>
						</tr>


						</tbody>
					</table>

					<!-- 각종버튼 -->
					<div class="row mb-3">
						<div class="col d-flex justify-content-end">


							<button type="button" class="btn btn-info"
								onclick="location.href='./reply.do?idx=${viewRow.idx}&nowPage=${nowPage }';">
								답변글달기</button>

							<button type="button" class="btn btn-secondary"
								onclick="location.href='./password.do?idx=${viewRow.idx}&mode=edit&nowPage=${nowPage }';">
								수정하기</button>

							<button type="button" class="btn btn-success"
								onclick="location.href='./password.do?idx=${viewRow.idx}&mode=delete&nowPage=${nowPage }';">
								삭제하기</button>


							<c:if test="${empty searchColumn }">
								<button type="button" class="btn btn-warning"
									onclick="location.href='./list.do?nowPage=${param.nowPage}';">리스트보기</button>
							</c:if>

							<c:if test="${not empty searchColumn }">
								<button type="button" class="btn btn-warning"
									onclick="location.href='./list.do?nowPage=${param.nowPage}&searchColumn=${searchColumn}&searchWord=${searchWord}';">리스트보기</button>
							</c:if>


						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Copyright영역 -->
		<%@ include file="./commons/copyright.jsp"%>
	</div>
</body>
</html>