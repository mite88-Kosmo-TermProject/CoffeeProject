<%--
카카오 API 소셜로그인
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


<!-- content -->

<!-- footer -->

<style type="text/css">
/* 주소 중앙정렬 */
th, td {
  vertical-align: middle;
}
#divdiv div {

/*     bottom: 0;
    left: 0;
    right: 0; */

    margin: auto;
}

</style>
</head>



<body> 
<div class="col-sm-6"></div>
	<div class="container" id="divdiv">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">
					<h2>회원수정</h2>
					<br>
					<form action="proc.do" method="post">
						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" name="id"
									placeholder="변경하실 아이디를 입력해주세요"></td>
							</tr>


							<tr>
								<th>패스워드확인</th>
								<td><input type="password" class="form-control"
									name="pass2" placeholder="변경하실 비밀번호를 입력하세요"></td>

							</tr>

							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" name="email"
									placeholder="변경하실 이메일을 입력하세요"></td>
							</tr>

							<tr>
								<th>전화번호</th>
								<td><input type="tel" class="form-control" name="tel"
									placeholder="변경하실 전화번호를 입력하세요"></td>
							</tr>
							<!-- 주소 -->
							<tr>
								<th>주소</th>
								<td>
								<div>
									<input type="tel" class="form-control" name="tel" placeholder="변경하실 주소(동,읍,면)를 입력하세요">
									<input type="tel" class="form-control" name="tel" placeholder="변경하실 상세주소를 입력하세요">
								</div>
								</td>
							</tr>

							<!-- 주소 -->

							<tr>
								<th>기타 하고싶은말</th>
								<td><textarea rows="5" cols="40" name="info"
										class="form-control"></textarea></td>
							</tr>

							<tr>
								<td colspan="2"><input type="submit"
									class="btn btn-primary" value="저장"> <input type="reset"
									class="btn btn-danger" value="취소"></td>
							</tr>

						</table>
					</form>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
</body>

</html>