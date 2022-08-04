
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
/* a#MOVE_TOP_BTN, a#CHAT_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
} */

a#CHAT_BTN {
    display: none;
    position: fixed;
    bottom: 10px;
    right: 10px;
    width: 50px;
    height: 50px;
    border: 1px solid #fff;
    color: #fff;
    text-align: center;
    line-height: 50px;
    border-radius: 10px;
    background-color: #555; /*버튼 색상*/
    transition: background 0.2s;
    cursor: pointer;
}

a#CHAT_BTN:hover {
    background-color: #AB7442; /*마우스 올렸을 때 버튼 색상*/
}
</style>

<!-- Footer -->
<footer class="content-footer footer bg-footer-theme">
	<div
		class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
		<div class="mb-2 mb-md-0">
			©
			<script>
				document.write(new Date().getFullYear());
			</script>
			, made with ❤️ by <a href="https://themeselection.com"
				target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
		</div>
		<div>
			<a href="https://themeselection.com/license/"
				class="footer-link me-4" target="_blank">License</a> <a
				href="https://themeselection.com/" target="_blank"
				class="footer-link me-4">More Themes</a> <a
				href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
				target="_blank" class="footer-link me-4">Documentation</a> <a
				href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
				target="_blank" class="footer-link me-4">Support</a>
		</div>
	</div>
</footer>

<!-- 상단 버튼 -->
<!-- <a id="MOVE_TOP_BTN" href="#" style="display: inline;">TOP</a> -->
<a id="CHAT_BTN" href="#" style="display: inline;">채팅</a>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/jquery/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/popper/popper.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/bootstrap.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/js/main.js"></script>

<!-- Page JS -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<script>
	//상단버튼용
	$(function() {
		$("#CHAT_BTN").click(function() {
		  var popup = window.open($(location).attr('origin')+'/CoffeeProject/storeowner/chtt/EchoServer.do', '채팅', 'width=500px,height=700px,scrollbars=yes');
		});
		/* $(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		}); */
	});
	


</script>
</body>
</html>
