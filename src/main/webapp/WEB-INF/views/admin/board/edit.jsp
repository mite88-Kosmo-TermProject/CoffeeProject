<%--
/**
 * <pre>
 * 1. 프로젝트명 : /admin/board/edit.jsp
 * 2. 작성일 : 2022. 8. 1. 오후 5:45:47
 * 3. 작성자 : home
 * 4. 설명 : 게시판리스트
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/resources/img/icon.ico" />
<!DOCTYPE html>
<html lang="en">
<style>
/*파일첨부관련 css*/
input[type="file"] {
	display: none;
}

.insert {
	padding: 20px 30px;
	display: block;
	width: 600px;
	margin: 5vh auto;
	height: 90vh;
	border: 1px solid #dbdbdb;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.insert .file-list {
	height: 200px;
	overflow: auto;
	border: 1px solid #989898;
	padding: 10px;
}

.insert .file-list .filebox p {
	font-size: 14px;
	margin-top: 10px;
	display: inline-block;
}

.insert .file-list .filebox .delete i {
	color: #ff5353;
	margin-left: 5px;
}
</style>
<head>

<meta charset="utf-8">

</head>
<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- header -->
			<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

			<!-- 여기에 새로운 css파일있으면 넣기 -->
			<!-- include summernote css -->
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css" />

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- Content -->

					<div class="row mb-5">
						<div class="col-12 mb-3">

							<form id="formAccountSettings" method="POST" onsubmit="return false">
								<div class="card">
									<div class="card-header header-elements p-3 my-n1">
										<h5 class="card-title mb-0 pl-0 pl-sm-2 p-2">게시판 쓰기</h5>
										<div class="card-action-element ms-auto py-0">
											<button type="button" class="btn btn-primary">작성완료</button>

										</div>
									</div>
									<div class="card-body">

										<div class="mb-3 row">
											<label for="html5-text-input" class="col-md-2 col-form-label">제목</label>
											<div class="col-md-10">
												<input class="form-control" type="text" value=""
													id="html5-text-input" readonly>
											</div>
										</div>

										<div class="mb-3 row">
											<div class="col-md-12 ">
												<!-- summernote -->
												<div id="summernote"></div>
											</div>
										</div>

										<!-- 파일멀티첨부용 -->
										<div class="mb-3 row">
											<div class="col-md-12 ">
												<input class="form-control" type="file"
													id="formFileMultiple" onchange="addFile(this);" multiple>
												<button type="button" id="btn-upload"
													class="btn btn-outline-warning">파일첨부</button>
												<div class="file-list"></div>
											</div>
										</div>


									</div>
								</div>

							</form>
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
	<!-- https://hankong.tistory.com/19 -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

	<!-- include summernote js -->
	<script type="text/javascript"
		src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/lib/summernote/summernote-bs5.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ko-KR.min.js"></script>

	<script>
		$(function() {
			//에디터
			$('#summernote').summernote({
				lang: 'ko-KR' ,
				placeholder : 'Hello Bootstrap 5',
				tabsize : 2,
				height : 200
			});
			
			//파일첨부버튼 대신누르기 
			$('#btn-upload').click(function (e) {
				e.preventDefault();
				$('#formFileMultiple').click();
			});


		})
		
		//파일첨부
		var fileNo = 0;
		var filesArr = new Array();

		/* 첨부파일 추가 */
		function addFile(obj){
		    var maxFileCnt = 5;   // 첨부파일 최대 개수
		    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
		    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
		    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

		    // 첨부파일 개수 확인
		    if (curFileCnt > remainFileCnt) {
		        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
		    }

		    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

		        const file = obj.files[i];

		        // 첨부파일 검증
		        if (validation(file)) {
		            // 파일 배열에 담기
		            var reader = new FileReader();
		            reader.onload = function () {
		                filesArr.push(file);
		            };
		            reader.readAsDataURL(file)

		            // 목록 추가
		            let htmlData = '';
		            htmlData += '<div id="file' + fileNo + '" class="filebox">';
		            htmlData += '   <p class="name">' + file.name ;
		            htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="bx bxs-checkbox-minus" ></i></a></p>';
		            htmlData += '</div>';
		            $('.file-list').append(htmlData);
		            fileNo++;
		        } else {
		            continue;
		        }
		    }
		    // 초기화
		    document.querySelector("input[type=file]").value = "";
		}

		/* 첨부파일 검증 */
		function validation(obj){
		    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
		    if (obj.name.length > 100) {
		        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
		        return false;
		    } else if (obj.size > (100 * 1024 * 1024)) {
		        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
		        return false;
		    } else if (obj.name.lastIndexOf('.') == -1) {
		        alert("확장자가 없는 파일은 제외되었습니다.");
		        return false;
		    } else if (!fileTypes.includes(obj.type)) {
		        alert("첨부가 불가능한 파일은 제외되었습니다.");
		        return false;
		    } else {
		        return true;
		    }
		}

		/* 첨부파일 삭제 */
		function deleteFile(num) {
		    document.querySelector("#file" + num).remove();
		    filesArr[num].is_delete = true;
		}

		/* 폼 전송 */
		function submitForm() {
		    // 폼데이터 담기
		    var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		            formData.append("attach_file", filesArr[i]);
		        }
		    }

		    $.ajax({
		        method: 'POST',
		        url: '/register',
		        dataType: 'json',
		        data: formData,
		        async: true,
		        timeout: 30000,
		        cache: false,
		        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
		        success: function () {
		            alert("파일업로드 성공");
		        },
		        error: function (xhr, desc, err) {
		            alert('에러가 발생 하였습니다.');
		            return;
		        }
		    })
		}

	</script>
</body>

</html>