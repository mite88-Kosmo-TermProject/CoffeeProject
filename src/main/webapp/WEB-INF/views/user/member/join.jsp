<%--
/**
회원가입 페이지
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

<link
	href="<%=request.getContextPath()%>/resources/assets/css/joining.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/css/maining.css"
	rel="stylesheet">
</head>


<style>
P, h2 {
	margin: 0;
	padding: 0;
}

@media screen and (max-width:480px) {
	section {
		padding: 20px 10px;
	}
}

.text-center {
	text-align: center;
}

form {
	margin-top: 20px;
}

h1 {
	font-size: 15px;
	margin-bottom: 0;
}

.col-7 {
	display: flex;
	justify-content: center;
}

.member_selec {
	width: 100%;
	height: auto;
	padding: 15px 20px 5px 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

input[type='date'] {
	width: 100%;
	height: auto;
	padding: 0 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

.whether {
	width: 100%;
	height: auto;
	padding: 15px 20px 5px 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

input[type='tel'], .call select {
	width: 50%;
	height: auto;
	padding: 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
}

.call label {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.member_selec label {
	float: left;
}

.overlap-wrap {
	position: absolute;
	bottom: 8px;
	right: 10px;
}

.overlap {
	border: 1px solid rgb(185, 185, 185);
	height: 100%;
	color: rgb(139, 139, 139);
	font-size: 13px;
	font-family: 'NotokrM';
}

.overlap:hover {
	border: 1px solid rgb(112, 112, 112);
	color: rgb(77, 77, 77);
}

.form-select {
	width: 100%;
	padding: 10px 20px;
	background-color: white;
	overflow: hidden;
	border: solid 1px #e0e0e0;
	border-radius: 5px;
	font-family: 'NotokrR';
	font-size: 18px;
	background: url(./cyto_img/select_arrow.png) no-repeat 97% 50%/20px auto;
}

.form-select option {
	background-color: white;
}

.mt-20 {
	margin-top: 10px !important;
}

.essential {
	color: orangered;
	font-size: 20px;
}

input {
	font-size: 18px;
}

.step01_con .row {
	margin-top: 0;
}

.step01_con .row .col-6 {
	padding-top: 0;
}

input[type="date"] {
	-webkit-appearance: textfield;
	-moz-appearance: textfield;
}

.office, .home_call {
	display: flex;
	justify-content: space-between;
}

.upload-photo {
	width: 10%;
	padding: 5px 20px;
	border: 1px solid rgb(185, 185, 185);
	height: 100%;
	color: rgb(139, 139, 139);
	font-size: 13px;
	font-family: 'NotokrM';
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
}

.upload-photo:hover {
	border: 1px solid rgb(112, 112, 112);
	color: rgb(77, 77, 77);
}
/* input[type='file']{
			display: none;
		} */

</style>
<body class="is-preload">
	<div id="page-wrapper">


		<!-- Section 01 -->
		<section id="join-wrapper"
			class="wrapper Latest_data more-services top_100"
			style="background-color: #F7F7F7; font-family: 'NotokrR';">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<form id="join" action="../member/joinResult.do" method="post" >
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_id">아이디</label>
					<input class="form-control" type="text" id="mem_id" name="mem_id" />
					<p id="id_check"></p>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_pw">패스워드</label>
					<input class="form-control" type="password" id="mem_pw" name="mem_pw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_pw">패스워드 확인</label>
					<input class="form-control" type="password" id="mem_pw2" name="mem_pw2" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_name">성명</label>
					<input class="form-control" type="text" id="mem_name" name="mem_name" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_case">case</label>
					<input class="form-control" type="text" id="mem_case" name="mem_case" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_email">email</label>
					<input class="form-control" type="text" id="mem_email" name="mem_email" />
					<p id="email_check"></p>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_nickname">nickname</label>
					<input class="form-control" type="text" id="mem_nickname" name="mem_nickname" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_phone">phone</label>
					<input class="form-control" type="text" id="mem_phone" name="mem_phone" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_gender">gender</label>
					<input class="form-control" type="text" id="mem_gender" name="mem_gender" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="joinBtn">회원가입</button>
					<button class="cencle btn btn-danger" type="button" onclick="history.go(-1);">취소</button>
				</div>
			</form>
					
						
					</div>
				</div>
				<!--row end-->
			</div>
			<!--container end-->
		</section>


		<a href="" class="top"> <img src="./cyto_img/click_top.png" alt="">
		</a>
	</div>



	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
	
	<script type="text/javascript">
	$(function(){
		$("#join").submit(function(){
			if($("#mem_pw").val() !== $("#mem_pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#mem_pw").val("").focus();
				$("#mem_pw2").val("");
				return false;
			}else if ($("#mem_pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#mem_pw").val("").focus();
				return false;
			}else if($.trim($("#mem_pw").val()) !== $("#mem_pw").val() || $.trim($("#mem_email").val()) !== $("#mem_email").val() || $.trim($("#mem_id").val()) !== $("#mem_id").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		})
		
		$("#mem_id").keyup(function() {
			$.ajax({
				url : "../member/idCheck.do",
				type : "POST",
				data : {
					mem_id : $("#mem_id").val()
				},
				success : function(cnt) {
					if (cnt == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#id_check").css("color","red");
						$("#joinBtn").attr("+", "disabled");
					} else {
						$("#id_check").html("사용 가능한 아이디 입니다.");
						$("#id_check").css("color","blue");
						$("#joinBtn").removeAttr("disabled");
					}
				},  
				error:function(request,status,error){       
					 alert(request.status);      
				 }
			
			})
		});
		
		$("#mem_email").keyup(function(){
			$.ajax({
				url : "../member/emailCheck.do",
				type : "POST",
				data : {
					mem_email : $("#mem_email").val()
				},
				success : function(cnt) {
					console.log(cnt+"!!");
					if (cnt == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
						$("#email_check").css("color","red");
					} else {
						$("#email_check").html("");
					}
				},
			})
		});
	})
	</script>
</body>

</html>