<%--
/**
 * <pre>
 * 1. 프로젝트명 : /member/findPwResult.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:47:31
 * 3. 작성자 : 전옥주
 * 4. 설명 : 비밀번호찾기결과
 * </pre>
 */
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
</head>



<body>
	
	<!-- content -->
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>ID</label>
					<input class="w3-input" type="text" id="mem_id" name="mem_id" required>
					<p id="id"></p>
				</p>
				<p>
					<label>Email</label>
					<input class="w3-input" type="text" id="mem_email" name="mem_email" required>
					<p id="email"></p>
				</p>
				<p class="w3-center">
					<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "../member/findPwResult.do",
				type : "POST",
				data : {
					mem_id : $("#mem_id").val(),
					mem_email : $("#mem_email").val()
				},
				success : function(fpw) {
					
					console.log(fpw);
					
					if(fpw == 1){
						$("#id").html("아이디가 없습니다.");
						$("#id").css("color","red");
						$("#email").html("");
					}
					else if(fpw == 2){
						$("#email").html("이메일이 없습니다.");
						$("#email").css("color","red");
						$("#id").html("");
					}
					else{
						$("#id").html("");
						$("#email").html("");
						 alert("이메일로 새 비밀번호를 보내드렸습니다^-^!");
				         window.location.href="../member/login.do";
					}
					
				},
			})
		});
	})
</script>
</body>

</html>