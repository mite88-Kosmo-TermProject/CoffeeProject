<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

</head>
<body>
	<script type="text/javascript">
		function checkValidate(f) {
			if (f.name.value == "") {
				alert("이름을 입력하세요");
				f.name.focus();
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
		<h2>비회원제 게시판 - 글수정 폼</h2>

		<form name="writeFrm" method="post" action="./editAction.do"
			onsubmit="return checkValidate(this);">
			
			<input type="hidden" name="idx" value="${viewRow.idx}" />
			<input type="hidden" name="nowPage" value="${param.nowPage}"/>
			<input type="hidden" name="pass" value="${viewRow.pass}"/>

			<table class="table table-bordered">
				<colgroup>
					<col width="25%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="name" style="width: 50%;" value="${viewRow.name}" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" style="width: 90%;" value="${viewRow.title}" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="contents"
							style="width: 90%; height: 200px;">${viewRow.contents}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-secondary" type="submit">작성완료</button>
						<button class="btn btn-secondary" type="reset">RESET</button>
						<button class="btn btn-secondary" type="button" onclick="location.href='./list.do';">
							리스트바로가기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>