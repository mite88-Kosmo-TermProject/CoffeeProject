<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<script src="<%= request.getContextPath() %>/resources/js/jsQR.js"></script>
<style type="text/css">
main {
	width: 100%;
	height: 100%;
	text-align: center;
}

div#frame {
	background-color: #FFFFFF;
}

div#outputLayer {
	text-align: left;
}

canvas {
	width: 100%;
}
</style>
</head>
<script type="text/javascript">
	// 스캔
	function startScan() {
		var video = document.createElement("video");		
		var canvasElement = document.getElementById("canvas");
		var canvas = canvasElement.getContext("2d");
		var loadingMessage = document.getElementById("loadingMessage");
		var outputContainer = document.getElementById("output");
		var outputMessage = document.getElementById("outputMessage");
		var outputData = document.getElementById("outputData");

		function drawLine(begin, end, color) {
			canvas.beginPath();
			canvas.moveTo(begin.x, begin.y);
			canvas.lineTo(end.x, end.y);
			canvas.lineWidth = 4;
			canvas.strokeStyle = color;
			canvas.stroke();
		}

	        // 카메라 사용시
		navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
     		    video.srcObject = stream;
      		    video.setAttribute("playsinline", true);      // iOS 사용시 전체 화면을 사용하지 않음을 전달
         		video.play();
      		    requestAnimationFrame(tick);
		});

		function tick() {
			loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

			if(video.readyState === video.HAVE_ENOUGH_DATA) {
				loadingMessage.hidden = true;
				canvasElement.hidden = false;
				outputContainer.hidden = false;

				// 읽어들이는 비디오 화면의 크기
				canvasElement.height = video.videoHeight;
				canvasElement.width = video.videoWidth;
				canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
				
				var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
				var code = jsQR(imageData.data, imageData.width, imageData.height, {
                                inversionAttempts : "dontInvert",
    		    });
				
				// QR코드 인식에 성공한 경우
				if(code) {
					// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성
					drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");
					drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");
					drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");
					drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000");
					
					outputMessage.hidden = true;
					outputData.parentElement.hidden = false;

					// QR코드 메시지 출력
					//url은 input hidden속성을 이용하여 숨기시면 좋을거같습니다
					outputData.innerHTML = code.data;
					outputData.innerHTML+='<br>000님 결제입니다<br>';
					outputData.innerHTML+='잔여횟수:10/30<br>';
					outputData.innerHTML+='1개를 차감합니다<br>';
					outputData.innerHTML+='<a href="#" onclick="pay_del();" class="btn btn-primary style="width:100%;height:30px">확인</a>';
				
					return;
				}
				// QR코드 인식에 실패한 경우
				else {
					outputMessage.hidden = false;
					outputData.parentElement.hidden = true;
				}
			}
			requestAnimationFrame(tick);
		}
	}
	
	//ajax 구현하기 - 0개 이상남으면 ajax로 구현 아니면 결제 불가 출력

	// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
	function pay_del(){
		alert("확인");
	}
	
	// 카메라 열기
	function openCamera() {
		startScan();
	}
</script>

<body>

	<div class="container">

		<div class="container-xxl py-5">
			<div class="container">
				<div class="main_page text-center">
					<h1 class="display-6 mb-5">스캔</h1>
				</div>
				<div class="row g-4">
					<!-- 사진스캔 -->
					<div class="col-md-6 col-lg-6 mb-5">
						<div id="frame">
							<div id="loadingMessage">
								🎥 비디오 스트림에 액세스 할 수 없습니다<br />웹캠이 활성화되어 있는지 확인하십시오
							</div>
							<canvas id="canvas"></canvas>
						</div>
						<input type="button" id="button1" onclick="openCamera();" 
						class="btn btn-primary"  value="카메라 열기" style="width:100%;height:30px"/>
		
					</div>
					<!-- // -->
					
					<div class="col-md-6 col-lg-6 mb-5" id="test" >
					<h1>QR 코드 스캔 결과</h1>
						<div id="output">
							<div id="outputMessage"></div>
							<div id="outputLayer" hidden>
								<span id="outputData"></span>
							</div>
						</div>
					</div>



				</div>

			</div>
		</div>

	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>

</body>
</html>