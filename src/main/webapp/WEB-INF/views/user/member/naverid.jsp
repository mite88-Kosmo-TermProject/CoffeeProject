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






</head>



<body>

<!-- 네이버 -->

<div id="u_skip">
		<!-- [D] 주메뉴가 존재하는 페이지에 적용 -->
		<a href="#lnb" onclick="document.getElementById('lnb').tabIndex=-1;document.getElementById('lnb').focus();return false;"><span>주메뉴로 바로가기</span></a>
		<a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
	</div>
	<!-- //스킵네비게이션 -->
	<div id="header" class="header_type2">
		<div class="top">
			<h1> <a href="http://www.naver.com" onclick="clickcr(this,'STA.naver','','',event)" class="logo"><span class="blind">NAVER</span></a> <a href="#" class="logo_sub"><span class="blind">내정보</span></a></h1>
			<div id="gnb"> 
				<script type='text/javascript' charset='utf-8' src='https://static.nid.naver.com/template/gnb_utf8.nhn?2022. 8. 23'></script>
			</div>
		</div>
		<div id="lnb" class="lnb_wrap">
			<ul class="lnb lnb_type3">
				<li class="m5"><a href="#" id="idinquiry" onMouseOver="showMenu('idinquiry','pwinquiry');" onMouseOut="hideMenu('idinquiry');" onclick="showMenu('idinquiry','pwinquiry');goPage('idInquiry','idinquiry');clickcr(this,'LNB.idinquiry','','',event);return false;"><span class="blind">아이디 찾기</span></a></li>
				<li class="m6"><a href="#" id="pwinquiry" onMouseOver="showMenu('pwinquiry','idinquiry');" onMouseOut="hideMenu('idinquiry');" onclick="showMenu('pwinquiry','idinquiry');goPage('pwInquiry','pwinquiry');clickcr(this,'LNB.pwinquiry','','',event);return false;"><span class="blind">비밀번호 재설정</span></a></li>
			</ul>
			<h2 class="blind">현재페이지는 "아이디찾기"</h2>
		</div>
	</div>
	
	<div id="container">
		<!-- CONTENTS -->
<!-- CONTENTS -->
<div id="content" class="non_sign inquiry" onclick="clearDocs();">

	<div class="content_header">
		<h2><img src="https://static.nid.naver.com/images/user/images/user/h_find_id.gif" width="70" height="16" alt="아이디 찾기"></h2>
	</div>
	<p class="content_summary">아이디 찾는 방법을 선택해 주세요.</p>
	
	<div class="section section_find">
		<form id="fm" name="fm" onSubmit="return mainSubmit();">
		<fieldset>
		<input type="hidden" id="token_help" name="token_help" value="39UZbLrEbNcHQco0" />
		<input type="hidden" id="birthday" name="birthday" value="" />
		<input type="hidden" id="fromPage" name="fromPage" value="idInquiryBegin" />
		<input type="hidden" name="authYn" id="authYn" value="">
		<input type="hidden" name="captchaCheckYn" id="captchaCheckYn" value="N">
		<input type="hidden" id="captcha_type" name="captcha_type" value="image">
		<input type="hidden" id="autoValue" name="autoValue" value="">
		<input type="hidden" id="mobileYn" name="mobileYn" value="N">
		<input type="hidden" name="type" id="type" value="idInquiry">
		<input type="hidden" id="chptchakey" name="chptchakey" value="">		
			<div class="box6">
				<!-- 휴대전화 영역 -->
				<div id="div_phone" class="box_inn selected"> <!-- [D] 선택시 selected 클래스 추가 -->
						<legend>회원정보에 등록한 휴대전화로 인증</legend>
						<input type="radio" id="r_pn1" class="input_rd" name="certification" checked="" value="phone" onClick="selectType('phone');clickcr(this,'idf.memeberphone','','',event);">

						<label for="r_pn1" class="label_rd">회원정보에 등록한 휴대전화로 인증</label>
						<div class="box_inn_sub">
							<p class="dsc">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>	
							<dl>
							<dt><label for="phoneNm" class="label_txt">이름<!--이름--></label></dt>
							<dd><input type="text" id="phoneNm" name="phoneNm" maxlength="40" class="input_txt" style="width:217px"></dd>
							<dt><label for="t_pn1" class="label_txt">휴대전화</label></dt>
							<dd>
								<label for="nationNo" class="blind">국가 번호</label>
								<span class="country_code">
									<span class="sel_value" id="input_internationalCode">+82</span>
									<select id="internationalCode" name="internationalCode" title="국가코드" class="country_sel" onchange="javascript:setInternationalCode('internationalCode','input_internationalCode','');">
											  	 	<option value="82">대한민국 +82</option>
									</select>
								</span>
								
								<span class="int_mob">
									<!-- [D] 인풋 포커스시 label에 클래스 on을 붙여주세요. -->
									<label for="phoneNo" id="lbl_phoneNo" class="lbl_mob">휴대전화번호</label><input type="text" id="phoneNo" name="phoneNo" class="input_txt" style="width:147px" onfocus="toggle('on');" onblur="toggle('off');" onKeydown="check_num('phoneNo', '1')" maxlength="11">
								</span>
								<a href="#" id="btnPhoneAuthNo" name="btnPhoneAuthNo" onClick="sendAuthNoForPhoneAuth();clickcr(this,'rmp.code','','',event);" class="btn_ct"><span class="blind">인증번호 받기</span></a>
							</dd>
							<dt><label for="t_ct1" class="blind">인증번호 입력</label></dt>
							<dd class="ct">
								<span class="input_box2">
									<span id="span_phoneAuthNo" class="phold">인증번호 6자리 숫자 입력</span>
									<input type="text" id="phoneAuthNo" name="phoneAuthNo"  maxlength="6" onkeydown="check_num('phoneAuthNo', '1')" onClick="hiddenObj('span_phoneAuthNo')" class="input_txt" style="width:217px" disabled>
								</span>
								<div>인증번호가 오지 않나요  <a href="javascript:showHelp('smsHelpTxt');" onClick="clickcr(this,'rmp.help','','',event);" class="ico_help2"><span class="blind">도움말</span></a>
									<div id="smsHelpTxt" class="help_tooltip2" style="display:none">
										<p>1588 번호가 스팸 문자로 등록되어 있는 것은 아닌지<br>확인해주세요. 스팸 문자로 등록되어 있지 않다면,<br>다시 한 번 '인증번호 받기'를 눌러주세요.</p>
										<span class="edge"></span>
									</div>
								</div>		
							</dd>	
							</dl>
						</div>		
				</div>
				<!-- 휴대전화 영역 -->
				<!-- 이메일 영역 -->
				<div id="div_email" class="box_inn"> <!-- [D] 선택시 selected 클래스 추가 -->
						<input type="radio" id="r_pn2" class="input_rd" name="certification" value="email" onClick="selectType('email');clickcr(this,'idf.email','','',event);">
						<label for="r_pn2" class="label_rd">본인확인 이메일로 인증</label>
						<div class="box_inn_sub">
							<p class="dsc">본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>	
							<dl>
							<dt><label for="emailNm" class="label_txt">이름</label></dt>
							<dd><input type="text" id="emailNm" name="emailNm" maxlength="40" class="input_txt" style="width:217px"></dd>
							<dt><label for="email" class="label_txt">이메일 주소</label></dt>
							<dd>
								<input type="text" id="email" name="email" maxlength="100" class="input_txt" style="width:217px">
								<a href="#" id="btnEmailAuthNo" name="btnEmailAuthNo" onClick="sendAuthNoForEmailAuth();clickcr(this,'eml.code','','',event);" class="btn_ct"><span class="blind">인증번호 받기</span></a>
							</dd>
							<dt><label for="t_ct1" class="blind">인증번호 입력</label></dt>
							<dd class="ct">
								<span class="input_box2">
									<span id="span_emailAuthNo" class="phold" style="">인증번호 6자리 숫자 입력</span>
									<input type="text" id="emailAuthNo" name="emailAuthNo" maxlength="6" onkeydown="check_num('emailAuthNo', '1')" onClick="hiddenObj('span_emailAuthNo')" class="input_txt" style="width:217px" disabled>
								</span>
								<div>인증번호가 오지 않나요 <a href="javascript:showHelp('emailHelpTxt');" onClick="clickcr(this,'eml.help','','',event);" class="ico_help2"><span class="blind">도움말</span></a>
									<!-- [D]툴팁 활성화시 display:block , 비활성화시 display:none  -->
									<div id="emailHelpTxt" class="help_tooltip2" style="display:none">
										<p>네이버가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 <br>확인해 주세요. 스팸 메일함에도 메일이 없다면,<br>다시 한 번 '인증번호 받기'를 눌러주세요.</p>
										<span class="edge"></span>
									</div>
								</div>									
							</dd>	
							</dl>
						</div>		
				</div>
				<!-- 이메일 영역 -->
			
			</div>
			
			<div class="box6">
				<h3>등록한 회원정보로 찾기 어려우시면, 본인 확인 후 아이디를 찾아드립니다.</h3>
				<!-- 본인 명의 휴대전화 영역 -->
				<div id="div_mobile" class="box_inn">	<!-- [D] 선택시 selected 클래스 추가 -->					
						<input type="radio" id="r_pn4" class="input_rd" name="certification" value="mobile" onClick="selectType('mobile');clickcr(this,'idf.myphone','','',event);">
						<label for="r_pn4" class="label_rd">본인 명의 휴대전화로 인증<span>(본인 주민등록번호로 가입된 휴대전화)</span></label>
						<div class="box_inn_sub">
							<p class="dsc">내 명의(주민등록번호)로 가입한 아이디를 찾을 수 있습니다.</p>
						</div>		
				</div>
				<!-- 본인 명의 휴대전화 영역 -->
				<!-- 아이핀 영역 -->
				<div id="div_ipin" class="box_inn">	<!-- [D] 선택시 selected 클래스 추가 -->					
						<input type="radio" id="r_pn5" class="input_rd" name="certification" value="ipin" onClick="selectType('ipin');clickcr(this,'idf.ipin','','',event);">
						<label for="r_pn5" class="label_rd">아이핀 인증</label>
						<div class="box_inn_sub">
							<p class="dsc">내 명의(주민등록번호)로 가입한 아이디의 일부분을 볼 수 있습니다.<br>아이핀이 없다면, 바로 발급받아 사용할 수 있습니다. <a href="javascript:ipinStart2();" onClick="clickcr(this,'ipn.issue','','',event);">아이핀 발급받기</a></p>
						</div>		
				</div>
				<!-- 아이핀 영역 -->
			</div>

		<div class="btn_area">
			<a href="javascript:mainSubmit();" id="btnNext" onClick="clickcr(this,'idf.next','','',event);" class="btn_next2"><span class="blind">다음</span></a>
		</div>
		
		<!-- 상세내용 영역 -->
		<div id="div_groupV2Guide" class="find_dsc">
			<h3>단체 아이디 찾기 시 문제가 있나요? <a href="javascript:showGroupV2Detail()" id="anc_detailGroup" >상세내용 펼치기<em class="ico_arr"></em></a></h3>
			<div class="find_dsc_sub">
				<p>단체아이디의 단체 정보에 단체 고유번호를 등록해 놓으셨다면 고객센터를 통해 아이디/비밀번호를 찾을 수 있습니다.
				<br>단체 고유번호(예 : 사업자등록번호)가 표시된 증빙서류(예 : 사업자등록증)를 고객센터에 제출해 주세요. <a href="https://help.naver.com/support/alias/membership/group/group_2.naver" target="_blank">도움말 바로가기</a></p>
				<br>
				<p>(구) 단체아이디는 개인 아이디의 회원정보에서 보실 수 있습니다.
				<br>(구) 단체아이디 멤버로 가입된 개인 아이디로 로그인한 후, <a target="_blank" href="https://nid.naver.com/user2/help/joinedGroupInfo?menu=nid" onClick="clickcr(this,'bhl.groupid','','',event);">내정보&gt;회원정보&gt;가입된 단체 아이디</a> 에서 확인해 주세요.</p>
			</div>
		</div>
		<p class="txt_help btn_id_help">아이디 찾기 시 문제가 있나요? <a href="https://help.naver.com/support/alias/membership/p.membership/p.membership_22.naver" target="blank">바로가기<em class="ico_arr2"></em></a></p>
		<!-- 상세내용 영역 -->
		</fieldset>	
		</form>
	</div>
</div>
<hr>
<!--본인 휴대전화 인증 호출 시 필요한 form//-->
<form name="formAuth" method="post" action="/user2/help/idInquiry?m=actionUserMobile">
<input type=hidden name="authRes" value="" />
<input type=hidden name="token_help" value="39UZbLrEbNcHQco0" />
</form>
<!--가상 주민번호 - 아이핀 팝업페이지 호출 시 필요한 form//-->
<form name="form_ipin" method="post" action="" >
    <input type="hidden" name="m" value="pubmain" />
    <input type="hidden" name="enc_data" value="AgEER0Q0NjdHv6v7n3Y2tIZwpPwpkXXE1wNmAzj8hs1UKbURBJLqVDcwpU7+LXl1tLkx5LnMBvCt17uIDUrPEcu66CpyIz5/+1N6ysSnnuFA8tKI4dtfUb4y95nfB17aOp/uBMt/37ZpO7Tcvp+bQS7wDpoWBqazAxYVQuFG/RZls6ovUHqFsM75Jy9wcM7pgh+3OsEeHu9Uu2v478M6MVZ60wCWsSUupspnpNd+QOjA9Fsjy/+wIdNbrOXe4PT2I5R2nuAczNJnW1qMqi/O2PvSHDGYc08HdRiFGDC75ez+vsUVpFSr" />
    <input type="hidden" name="token_help" value="39UZbLrEbNcHQco0" />    
    <input type="hidden" name="id" value="" />
</form>
<!--가상 주민번호 - 아이핀 팝업페이지에서 인증받기 버튼 클릭 후 부모 페이지를 이동하기 위해 필요한 form//-->
<form name="vnoform" method="post" action="" >
	<input type="hidden" name="token_join" />
    <input type="hidden" name="token_help" />
	<input type="hidden" name="enc_data" />
	<input type="hidden" name="authRes" />
</form>
<hr>

		<!-- //CONTENTS -->
		<div class="aside"></div>
	</div>
	
	<div class="aside_bg"><div class="aside_bg_min"></div><div class="aside_bg_r"></div></div>
	<div id="footer">
		<ul class="guides fl">
		<li class="first"><a href="https://pay.naver.com/npoint/pay/terms-of-electronic-financecontract_20140701.html" target="_blank" onclick="clickcr(this,'fot.ecommerce','','',event);">전자금융거래 이용약관</a></li>
		<li><a href="http://policy.naver.com/policy/privacy.html" target="_blank" onclick="clickcr(this,'fot.privacy','','',event);"><strong>개인정보처리방침</strong></a></li>
		<li><a href="http://policy.naver.com/rules/disclaimer.html" target="_blank" onclick="clickcr(this,'fot.disclaimer','','',event);">책임의 한계와 법적고지</a></li>
		</ul>
		<address class="copyright">
		Copyright <em>&copy;</em> <a href="https://www.navercorp.com/" target="_blank" onclick="clickcr(this,'fot.navercorp','','',event);"><strong>NAVER Corp.</strong></a> All Rights Reserved.
		</address>
		<ul class="guides fr">
		<li><a href="https://help.naver.com/support/alias/membership/p.membership/p.membership_26.naver" target="_blank" title="새창" onclick="clickcr(this,'fot.help','','',event);"> 회원정보 고객센터 </a></li>
		</ul>
	</div>
	<div id="divMobileYn" style="display:none">
		<p style="clear:both;margin:0;padding:42px 0 0"><a href="https://nid.naver.com/mobile/user/help/idInquiry" style="display:block;padding:31px 0 30px;border-top:1px solid #dbdde1;border-bottom:1px solid #c2c4c8;background:#ebeded url(https://static.nid.naver.com/images/web/user/bg_mobileversionbutton.gif) repeat-x 0 0;text-align:center;text-decoration:none"><img src="https://static.nid.naver.com/images/web/user/btn_mobileversionbutton.png" width="305" height="30" alt="모바일 버전으로 보기" style="vertical-align:top"></a></p>;		
	</div>
</div>


</body>

<!-- 네이버 -->

	<!-- content -->

	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>


</body>

</html>