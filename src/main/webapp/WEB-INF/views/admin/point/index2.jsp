<%--
/**
 * <pre>
 * 1. 프로젝트명 : point/index2.jsp
 * 2. 작성일 : 2022. 8. 2. 오후 12:22:36
 * 3. 작성자 : home
 * 4. 설명 : 룰렛설정
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<style type="text/css">
.table > :not(caption) > * > * {
    padding: 0.5rem !important;
    }
#roulette-outer{
	position: relative;
	left:80px;
	bottom:50px;
	overflow: hidden;
	width: 350px;
	height: 350px;
	background: yellow;
	z-index: 1;
	}
#roulette{
position: absolute;
border:0px;
padding:0px;
top: 5%;
left: 5%;
right:5%;
bottom:5% ;
width:313px;
border-radius: 50%;
background: #D1B6E1;
border: 2px solid black;
z-index: 2;
}
#roulette > #item-wrapper > .item {
	position: absolute;
	font:25px bold;
	top:0;
	left:0;
	right:0;
	bottom:0;
	
	padding-top: 10%;
	text-align: center;
	display: flex;
	justify-content: center;
	
}
#roulette > #item-wrapper > .item:nth-child(1) {
	transform: rotate(0deg);
}
#roulette > #item-wrapper > .item:nth-child(2) {
	transform: rotate(90deg);
}
#roulette > #item-wrapper > .item:nth-child(3) {
	transform: rotate(180deg);
}
#roulette > #item-wrapper > .item:nth-child(4) {
	transform: rotate(270deg);
}	
#roulette > #line-wrapper > .line {
	position: absolute;
	top: 0;
	bottom: 50%;
	left: 50%;
	width: 2px;
	background: black;
	transform-origin: bottom;
	z-index: 3;
}
#roulette > #line-wrapper > .line:nth-child(1) {
	transform: rotate(45deg);
}
#roulette > #line-wrapper > .line:nth-child(2) {
	transform: rotate(135deg);
}
#roulette > #line-wrapper > .line:nth-child(3) {
	transform: rotate(225deg);
}
#roulette > #line-wrapper > .line:nth-child(4) {
	transform: rotate(315deg);
}
#roulette-pin{
position: absolute;
top:5%;
left:173px;
width:4px;
padding-left:0px;
padding-right:0px;
margin-right:10px;
height:20px;
background:red;
z-index: 4;
}


</style>

</head>
<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- header -->
			<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

			<!-- 여기에 새로운 css파일있으면 넣기 -->
			<link
				href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"
				rel="stylesheet" />

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->

					<div class="row mb-5">
						<div class="col-12 mb-3">


							<div class="card">
								<div class="card-header header-elements p-3 my-n1">
									<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">출책이벤트설정</h5>
									<div class="card-action-element ms-auto py-0"></div>
								</div>
								<div class="card-body">
									<form id="formAccountSettings" method="POST" enctype="multipart/form-data"
										action="../../admin/point/eventSetting.do">
										<!-- 왼편 -->
										<div class="mb-3 row">
											<div class="col-md-6">

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">이벤트명</label>
													<div class="col-md-8">
														<input  name="eventname" class="form-control" type="text" value=""
															id="html5-text-input">
													</div>
												</div>


												<div class="mb-3 row">
												<label for="html5-text-input"
														class="col-md-4 col-form-label">배경이미지</label>
													<div class="col-md-8">									
														<input  name="file" class="form-control" type="file"
															id="formFileMultiple" multiple>													
													</div>
												

												</div>

												<div class="mb-3 row">
													<label for="html5-text-input"
														class="col-md-4 col-form-label">이벤트설명</label>
													<div class="col-md-8">
														<textarea placeholder="" name="desc" class="form-control"
															id="exampleFormControlTextarea1" rows="3"></textarea>
													</div>
												</div>
												<div class="mt-2">
													<button type="submit" class="btn btn-primary me-2">저장</button>
												</div>
											</form>
											</div>
											<div class="mb-3 row" id="roulette-outer" style="display: flex;">
											
											
											<div id="roulette-pin"></div>
												<div id="roulette">
												<!--값영역 -->
												<div id="item-wrapper">
													<div class="item">100점</div>
													<div class="item">200점</div>
													<div class="item">300점</div>
													<div class="item">-50점</div>
												</div>
												<!--선영역-->
												<div id="line-wrapper">
													<div class="line"></div>
													<div class="line"></div>
													<div class="line"></div>
													<div class="line"></div>
												</div>
											</div>
											</div>
												<button type="button" onclick="testRotate();">돌리기</button>

											<!-- 오른편 -->
											<div class="col-md-12">
												<div class="table-responsive text-nowrap">
													<table class="table" id="table">
														<thead>
															<tr data-tabullet-map="id">
																<th data-tabullet-map="0">항목번호</th>
																<th data-tabullet-map="1">항목명</th>												
																<th data-tabullet-map="2">확률</th>
																<th data-tabullet-map="3">항목상품</th>
																<th width="50" data-tabullet-type="edit"></th>
																<th width="50" data-tabullet-type="delete"></th>
															</tr>
														</thead>
													</table>
												</div>

											</div>
											<div class="mt-2">
												<button type="button" class="btn btn-primary me-2">저장</button>
												<button type="reset" class="btn btn-outline-secondary">Cancel</button>
											</div>

										</div>
									

								</div>
							</div>


						</div>
					</div>
				</div>

				<!-- / Content -->

				<!-- footer -->
				<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>
				<!-- / Footer -->

				<div class="content-backdrop fade"></div>
			</div>
			<!-- Content wrapper -->
		</div>
		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	<!-- </div> -->
	<!-- / Layout wrapper -->

	<!-- 여기에 새로운 js파일있으면 넣기 -->
	<script src="<%= request.getContextPath() %>/resources/lib/Dynamic-Table/Tabullet.js"></script>

	<script type="text/javascript">
		var source = [];
		var eventname = document.getElementsByName("eventname")[0];
		var file = document.getElementsByName("file")[0];
		var desc = document.getElementsByName("desc")[0];
		var roulette = document.getElementById("roulette");
		var percentage = [];
		
		function setSource(){
			$.ajax({
				url:'../../admin/point/loadevent_item.do',
				dataType:'json',
				success:function(data){
					source = data;
					resetTabullet();
					
				},
				error:function(msg){
					console.log(msg);
				}
			});
		 }
		function loadEventSetting(){
			$.ajax({
				url:'../../admin/point/loadeventsetting.do',
				dataType:'json',
				success:function(data){					
					eventname.placeholder = data.name;
					desc.placeholder = data.desc;
				},
				error:function(msg){
					console.log(msg);
				}
			});
		}
		 function resetTabullet() {
             $("#table").tabullet({
                 data: source,
                 action: function (mode, data) {
                     console.dir(mode);
                     if (mode === 'save') {
                         source.push(data);
                     }
                     if (mode === 'edit') {
                         for (var i = 0; i < source.length; i++) {
                             if (source[i][0] == data[0]) {
                            	 console.log(data);
                                 source[i] = data;
                             }
                         }
                     }
                     if(mode == 'delete'){
                         for (var i = 0; i < source.length; i++) {
                             if (source[i][0] == data[0]) {
                                 source.splice(i,1);
                                 break;
                             }
                         }
                     }
					if(1 <= 2)
                     resetTabullet();
                 }
             });
         }
		 function resoretdarray(){
			if(percentage.length <= 0){
			for(let i =0; i<source.length; i++){
				percentage.push(source[i][2]) ;
				percentage.sort();
				}
				
			}
			else{
				return;
			}
		 }
		 
		 function testRotate(){
			roulette.style.transform = "rotate(45deg)";
			MakeSetRouletteStr();
		 }
		 function MakeSetRouletteStr(){
			 	resoretdarray();
				Str = "";
				Str +="var ranNum = Math.floor(Math.random()*100);"
				Str +="var maxNum =0 ;"
				Str +="var minNum =0 ;"
				Str += "console.log(percentage);"
				Str +="if(ranNum <= percentage[0]) {\n"
				Str +="maxNum = Math.floor(percentage[0]/100*360);\n"
				Str +="minNum = 0 ;\n"
				Str +="console.log('이발:'+minNum);\n"
				Str +="}\n"	
				for(let j = 1 ; j<source.length; j++){
				Str +="else if((percentage["+j+"-1])+1 <= ranNum && ranNum <= percentage["+j+"]) {\n"
				Str +="console.log('percentage:'+percentage["+j+"]);\n"
				Str +="console.log('percentage-1:'+percentage["+j+"-1]);\n"
				Str +="maxNum = Math.floor(percentage["+j+"]/100*360);\n"
				Str +="minNum = (Math.floor(percentage["+j+"-1]/100*360))+1;\n"
				Str +="}\n"
				if(j == source.length-1 ){
				Str +="else {\n"
				Str +="maxNum = Math.floor(percentage["+j+"]/100*360);\n"
				Str +="minNum = (Math.floor(percentage["+j+"-1]/100*360))+1;\n"
				Str +="}\n"
				}
				}
			eval(Str);
			console.log(ranNum);
			console.log(maxNum);
			console.log(minNum);
			
			
		 }
	 $(function () {
		 //동적테이블 
		 setSource();
		 loadEventSetting();
     });
 </script>
</body>

</html>