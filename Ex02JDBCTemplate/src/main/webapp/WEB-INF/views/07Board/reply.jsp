<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

</head>
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
		<h2>비회원제 게시판 - 답변쓰기폼 폼</h2>

		<form name="writeFrm" method="post" action="./replyAction.do"
			onsubmit="return checkValidate(this);">

			<input type="hidden" name="idx" value="${replyRow.idx}" /> <input
				type="hidden" name="nowPage" value="${param.nowPage}" /> <input
				type="hidden" name="bgroup" value="${replyRow.bgroup}" /> <input
				type="hidden" name="bstep" value="${replyRow.bstep}" /> <input
				type="hidden" name="bindent" value="${replyRow.bindent}" />

			<table class="table table-bordered">
				<colgroup>
					<col width="25%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="name" style="width: 50%;" /></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pass" style="width: 30%;" />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" style="width: 90%;"
						value="${replyRow.title }" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="contents"
							style="width: 90%; height: 200px;">${replyRow.contents }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-secondary">작성완료</button>
						<button type="reset" class="btn btn-secondary">RESET</button>
						<button type="button" class="btn btn-secondary" onclick="location.href='./list.do';">
							리스트바로가기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>