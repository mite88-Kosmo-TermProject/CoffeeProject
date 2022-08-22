<%--
/**
 * <pre>
 * 1. 프로젝트명 : /member/modify.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:47:31
 * 3. 작성자 : 전옥주
 * 4. 설명 : 회원수정
 * </pre>
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



<body>
	
	<!-- content -->
	<div class="container">
		<h3>
			회원정보수정
		</h3>

		<form name="writeFrm" method="post"
			onsubmit="return writeValidate(this);"
			action="<c:url value="/mybatis/modifyAction.do" />">

			<input type="hid den" name="mem_id" value="${dto.mem_id }" /> 

			<table class="table table-bordered">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center" style="vertical-align: middle;">유저이름</th>
						<td><input type="text" class="form-control"
							style="width: 100px;" name="mem_name" value="${dto.mem_name }" /></td>
					</tr>
					<tr>
						<th class="text-center" style="vertical-align: middle;">휴대폰번호</th>
						<td><textarea rows="10" class="form-control" name="mem_phone">${dto.mem_phone }</textarea>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="row text-center" style="">
				<!-- 각종 버튼 부분 -->
				<button type="submit" class="btn btn-danger">전송하기</button>
				<button type="reset" class="btn">Reset</button>
			<!--  
			<button type="button" class="btn btn-warning"
					onclick="location.href='list.do';">리스트보기</button>
			-->
			</div>
		</form>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	<script type="text/javascript">
		function writeValidate(f) {
			if (f.name.value == "") {
				alert("작성자 이름을 입력하세요");
				f.name.focus();
				return false;
			}
			if (f.contents.value == "") {
				alert("내용을 입력하세요");
				f.contents.focus();
				return false;
			}
		}
	</script>
</body>

</html>