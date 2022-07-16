<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./commons/header.jsp"%>
<body>

	<script type="text/javascript">
		function checkValidate(f) {
			if (f.name.value == "") {
				alert("이름을 입력하세요");
				f.name.focus();
				return false;
			}
			if (f.pass.value == "") {
				alert("패스워드를 입력하세요");
				f.pass.focus();
				return false;
			}
			if (f.title.value == "") {
				alert("제목을 입력하세요");
				f.title.focus();
				return false;
			}
			if (f.contents.value == "") {
				alert("내용을 입력하세요");
				f.contents.focus();
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
				<h3>
					게시판쓰기</small>
				</h3>

				<form name="writeFrm" method="post" action="./writeAction.do"
					onsubmit="return checkValidate(this);">
					<table class="table table-bordered">
						<colgroup>
							<col width="25%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td><input type="text" name="name"  class="form-control" style="width: 50%;" /></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="password" name="pass"  class="form-control" style="width: 30%;" />
								</td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type="text" name="title"  class="form-control" style="width: 90%;" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name="contents"
										style="width: 90%; height: 200px;"  class="form-control" ></textarea></td>
							</tr>


						</tbody>
					</table>

					<!-- 각종버튼 -->
					<div class="row mb-3">
						<div class="col d-flex justify-content-end">
							<button type="submit" class="btn btn-primary">작성완료</button>
							<button type="reset" class="btn btn-dark">RESET</button>
							<button type="button" class="btn btn-warning" onclick="location.href='./list.do';">
							리스트바로가기</button>
						
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