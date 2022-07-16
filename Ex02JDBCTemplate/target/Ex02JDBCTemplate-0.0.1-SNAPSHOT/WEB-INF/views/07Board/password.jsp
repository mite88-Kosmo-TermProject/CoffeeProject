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
	<script type="text/javascript">
	function checkValidate(f){
		if(f.pass.value==""){
			alert("패스워드를 입력하세요");
			f.pass.focus();
			return false;
		}
	}
</script>
<div class="container">
	<h2>회원제 게시판 - 패스워드검증폼</h2>
	
	<!-- 패스워드 검증에 실패했을때 에러메세지 출력용 -->
	<span style="color:red; font-size:1.8em;">
		${isCorrMsg }
	</span>
	
	<form name="writeFrm" method="post" 
		action="./passwordAction.do"
		onsubmit="return checkValidate(this);">
		
	<input type="hid den" name="idx" value="${idx }" />
	<input type="hid den" name="mode" value="${param.mode }" />
	<input type="hid den" name="nowPage" value="${param.nowPage }" />
		
	<table class="table table-bordered">
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>
	
	<tr>
		<td>패스워드</td>
		<td>
			<input type="password" name="pass" style="width:30%;" />
		</td>
	</tr>
	 
	<tr>
		<td colspan="2" align="center">
			<button type="submit" class="btn btn-secondary">작성완료</button>
			<button type="reset" class="btn btn-secondary" >RESET</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='./list.do?nowPage=${param.nowPage}';">
				리스트바로가기
			</button>
		</td>
	</tr>
	</table>	
	</form>
</div>

</body>
</html>