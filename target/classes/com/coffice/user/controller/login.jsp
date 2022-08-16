<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<script type="text/javascript">
function loginValidate(f)
{
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.pass.value==""){
		alert("패스워드를 입력하세요"); 
		f.pass.focus();
		return false;
	} 
}

$(function(){
	$("#findId").click(function(){
		location.href='../member/findId.do';
	})
	$("#findPw").click(function(){
		location.href='../member/findPw.do';
	})
})
</script>
<div class="container"> 
	<h3>방명록(로그인)</h3> 
		
		<!-- 로그인이 된 경우 회원정보와 로그아웃 버튼을 출력한다. -->
	<c:choose>
		<c:when test="${not empty sessionScope.siteUserInfo }">
			<div class="row" style="border:2px solid #cccccc;padding:10px;">			
				<!-- 로그인에 성공한 경우 MemberVO객체에 회원정보를 저장한 후 세션영역에
				저장할것이므로, 출력시에는 getter()를 사용하기 위해 멤버변수로 접근한다.
				EL에서는 멤버변수명 만으로 getter()를 호출할 수 ㅣㅆ다. -->
				<h4>아이디:${sessionScope.siteUserInfo.mem_id }</h4>
				<h4>이름:${sessionScope.siteUserInfo.mem_pw }</h4>
				<br /><br />
				<button class="btn btn-danger" 
					onclick="location.href='logout.do';">
					로그아웃</button>
				&nbsp;&nbsp;
				<button class="btn btn-primary" 
					onclick="location.href='../admin/member/list.do';">
					방명록리스트</button>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 로그인이 안된 상태이므로 로그인 폼을 출력한다.ㅣ -->
			<span style="font-size:1.5em; color:red;">${LoginNG }</span>
			<!-- 로그인이 안된 상태이므로 로그인 폼을 출력한다. -->
			<form name="loginForm" method="post" action="./loginAction.do" onsubmit="return loginValidate(this);">
				<!-- 로그인에 성공한 경우 돌아갈 페이지의 경로를 파라미터로 받아온다. -->
				<input type="hidden" name="backUrl" value="${param.backUrl }"/>
				<table class="table-bordered" style="width:50%;">
					<tr>
						<td><input type="text" class="form-control" name="id" placeholder="아이디" tabindex="1"></td>
						<td rowspan="2" style="width:80px;"><button type="submit" class="btn btn-primary" style="height:77px; width:77px;"  tabindex="3">로그인</button></td>
						<td rowspan="2" style="width:80px;" title="아이디 찾기" id="findId"><button type="submit" class="btn btn-primary" style="height:77px; width:77px;"  tabindex="3">아이디찾기</button>
						</td>
						<td rowspan="2" style="width:80px;" title="비밀번호 찾기" id="findPw"><button type="submit" class="btn btn-primary" style="height:77px; width:90px;"  tabindex="3">비밀번호<br/>찾기</button>
						</td>
					</tr>
					<tr>
						<td><input type="password" class="form-control" name="pass" placeholder="패스워드" tabindex="2"></td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
</div>
	
</body>
</html>