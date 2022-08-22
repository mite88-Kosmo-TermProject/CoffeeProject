<%--
/**

약괸 동의 페이지
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
</head>


<body style="background-color: #F7F7F7;">
	<!-- Section 01 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-4">
				<div class="col-12">
					<form action="<%= request.getContextPath() %>/member/join.do" id="terms_form">
						<section id="join-wrapper"
							class="wrapper Latest_data more-services top_100">
							<div class="container">
								<div class="row">
									<div class="col">
										<div id="join_header">
											<br>
											<h3>수집동의서 및 회원이용약관</h3>
										</div>
										<hr style="opacity: 0.5;">
										<br> <br>

										<div class="join_con mb-5">
											<h4>개인정보 수집•이용 동의서</h4>
											<header>
												<input type="checkbox" id="check01"> <label
													for="check01" style="font-size: 18px;">개인정보수집
													동의(필수)</label>
											</header>
											<p>
												★☆★☆★☆와타시는!!!★☆★☆★☆「개인정보보호법」에 의거하여, 아래와 같은 내용으로 개인정보를 수집하고
												있습니다. 귀하께서는 아래 내용을 자세히 읽어 보시고, 모든 내용을 이해하신 후에 동의 여부를 결정해 주시기
												바랍니다. Ⅰ. 개인정보의 수집 및 이용 동의서<br> - 이용자가 제공한 모든 정보는 다음의
												목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.<br> ① 개인정보 수집 항목
												및 수집·이용 목적<br> 가) 수집 항목 (필수항목)<br> - 성명(국문),
												주민등록번호, 주소, 전화번호(자택, 휴대전화), 사진, 이메일, 나이, 재학정보, 병역사항, 외국어 점수,
												가족관계, 재산정도, 수상내역, 사회활동, 타 장학금 수혜현황, 요식업 종사 현황 등 지원 신청서에 기재된
												정보 또는 신청자가 제공한 정보<br> 나) 수집 및 이용 목적 - 하이트진로 장학생 선발 전형
												진행 - 하이트진로 장학생과의 연락 및 자격확인 - 하이트진로 장학생 자원관리<br> ② 개인정보
												보유 및 이용기간<br> - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지<br>
												③ 동의거부관리<br> - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여 동의를 거부하실
												권리가 있습니다. 다만, 귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 장학생 선발 과정에 있어
												불이익이 발생할 수 있음을 알려드립니다.<br> <br> Ⅱ. 고유식별정보 처리 동의서<br>
												① 고유식별정보 수집 항목 및 수집·이용 목적<br> 가) 수집 항목 (필수항목)<br>
												- 주민등록번호<br> 나) 수집 및 이용 목적<br> - 하이트진로 장학생 선발 전형
												진행<br> - 하이트진로 장학생과의 연락 및 자격확인<br> - 하이트진로 장학생
												자원관리<br> ② 개인정보 보유 및 이용기간<br> - 수집·이용 동의일로부터 개인정보의
												수집·이용목적을 달성할 때까지<br> ③ 동의거부관리<br> - 귀하께서는 본 안내에 따른
												개인정보 수집, 이용에 대하여 동의를 거부하실 권리가 있습니다. 다만, 귀하가 개인정보의 수집/이용에 동의를
												거부하시는 경우에 장학생 선발 과정에 있어 불이익이 발생할 수 있음을 알려드립니다.

											</p>
										</div>

										<div class="join_con mb-5">
											<h4>개인정보 수집•이용 동의서</h4>
											<header>
												<input type="checkbox" id="check02" style="padding: 10px;">
												<label for="check02" style="font-size: 18px;">
													회원이용약관 동의(필수)</label>
											</header>
											<p>
												★☆★☆★☆와타시는!!!★☆★☆★☆「개인정보보호법」에 의거하여, 아래와 같은 내용으로 개인정보를 수집하고
												있습니다. 귀하께서는 아래 내용을 자세히 읽어 보시고, 모든 내용을 이해하신 후에 동의 여부를 결정해 주시기
												바랍니다. Ⅰ. 개인정보의 수집 및 이용 동의서<br> - 이용자가 제공한 모든 정보는 다음의
												목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.<br> ① 개인정보 수집 항목
												및 수집·이용 목적<br> 가) 수집 항목 (필수항목)<br> - 성명(국문),
												주민등록번호, 주소, 전화번호(자택, 휴대전화), 사진, 이메일, 나이, 재학정보, 병역사항, 외국어 점수,
												가족관계, 재산정도, 수상내역, 사회활동, 타 장학금 수혜현황, 요식업 종사 현황 등 지원 신청서에 기재된
												정보 또는 신청자가 제공한 정보<br> 나) 수집 및 이용 목적 - 하이트진로 장학생 선발 전형
												진행 - 하이트진로 장학생과의 연락 및 자격확인 - 하이트진로 장학생 자원관리<br> ② 개인정보
												보유 및 이용기간<br> - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지<br>
												③ 동의거부관리<br> - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여 동의를 거부하실
												권리가 있습니다. 다만, 귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 장학생 선발 과정에 있어
												불이익이 발생할 수 있음을 알려드립니다.<br> <br> Ⅱ. 고유식별정보 처리 동의서<br>
												① 고유식별정보 수집 항목 및 수집·이용 목적<br> 가) 수집 항목 (필수항목)<br>
												- 주민등록번호<br> 나) 수집 및 이용 목적<br> - 하이트진로 장학생 선발 전형
												진행<br> - 하이트진로 장학생과의 연락 및 자격확인<br> - 하이트진로 장학생
												자원관리<br> ② 개인정보 보유 및 이용기간<br> - 수집·이용 동의일로부터 개인정보의
												수집·이용목적을 달성할 때까지<br> ③ 동의거부관리<br> - 귀하께서는 본 안내에 따른
												개인정보 수집, 이용에 대하여 동의를 거부하실 권리가 있습니다. 다만, 귀하가 개인정보의 수집/이용에 동의를
												거부하시는 경우에 장학생 선발 과정에 있어 불이익이 발생할 수 있음을 알려드립니다.
											</p>
											<br>
										</div>
										<!--join_con mb-5 end-->
										<div class="join_btn">
											<button type="reset" class="btn btn-danger">취소</button>
											<button type="button" id="nextBtn" class="btn btn-primary">다음</button>
										</div>
									</div>
									<!--col end-->
								</div>
								<!--row end-->
							</div>
							<!--container end-->
						</section>
					</form>

				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

	<script type="text/javascript">
        $(document).ready(function(){
    
            $("#nextBtn").click(function(){    
                if($("#check01").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
                }else if($("#check02").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    return;
                }else{
                    $("#terms_form").submit();
                }
            });    
        });
    </script>
</body>

</html>