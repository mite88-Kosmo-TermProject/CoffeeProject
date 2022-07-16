<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./commons/header.jsp"%>
<body>

	<script type="text/javascript">
		function checkValidate(f) {
			if (f.pass.value == "") {
				alert("패스워드를 입력하세요");
				f.pass.focus();
				return false;
			}
		}
	</script>

	<div class="container">
		<!-- Top영역 -->
		<%@ include file="./commons/top.jsp"%>
		<!-- Body영역 -->
		<div class="row">
			<!-- Left메뉴영역 -->
			<%@ include file="./commons/left.jsp"%>
			<!-- Contents영역 -->
			<div class="col-9 pt-3">
				<h3>회원제 게시판 - 패스워드검증폼</h3>

				<!-- 패스워드 검증에 실패했을때 에러메세지 출력용 -->
				<span style="color: red; font-size: 1.8em;"> ${isCorrMsg } </span>

				<form name="writeFrm" method="post" action="./passwordAction.do"
					onsubmit="return checkValidate(this);">

					<input type="hidden" name="idx" class="form-control" value="${idx }" /> <input
						type="hidden" name="mode" class="form-control" value="${param.mode }" /> <input
						type="hidden" name="nowPage" class="form-control" value="${param.nowPage }" />

					<table class="table table-bordered">
						<colgroup>
							<col width="25%" />
							<col width="*" />
						</colgroup>

						<tr>
							<td>패스워드</td>
							<td><input type="password" class="form-control"  name="pass" style="width: 30%;" />
							</td>
						</tr>

						<tr>
							<td colspan="2" align="center">
								<button type="submit" class="btn btn-secondary">작성완료</button>
								<button type="reset" class="btn btn-secondary">RESET</button>
								<button type="button" class="btn btn-secondary"
									onclick="location.href='./list.do?nowPage=${param.nowPage}';">
									리스트바로가기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>

		</div>
	</div>
	<!-- Copyright영역 -->
	<%@ include file="./commons/copyright.jsp"%>
	</div>
</body>
</html>