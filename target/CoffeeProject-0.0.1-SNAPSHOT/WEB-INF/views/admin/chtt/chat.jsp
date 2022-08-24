<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/img/icon.ico" />
<html>
<head>

<title>채팅</title>
<!-- 개인 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/assets/css/style.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/admin/assets/vendor/fonts/boxicons.css" />

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
<style>
.chat_wrap .header {
	font-size: 14px;
	padding: 15px 0px;
	background: #F18C7E;
	color: white;
	text-align: center;
}

.chat_wrap #chat {
	width: 100%;
}

.chat_wrap #chat .left {
	text-align: left;
}

.chat_wrap #chat .right {
	text-align: right;
}

.chat_wrap #chat {
	font-size: 12px;
}

.chat_wrap #chat .sender {
	margin: 10px 25px 0px 10px;
	font-weight: bold;
}

.chat_wrap #chat .message {
	display: inline-block;
	margin: 5px 20px 0px 10px;
	max-width: 75%;
	border: 1px solid gray;
	padding: 5px;
	border-radius: 5px;
	background-color: #FCFCFC;
	text-align: left;
}

.chat_wrap #chat .date {
	margin: 5px 20px 10px 10px;
	font-size: 10px;
}

.chat_wrap .input-div {
	position: fixed;
	bottom: 0px;
	width:  calc(100% - 60px);
	background-color: #FFF;
	text-align: center;
	border-top: 1px solid #F18C7E;
}

.received_msg {
    display: inline-block;
    padding: 0 0 0 10px;
    /* vertical-align: top; */
    width: 40%;
}

.received_withd_msg {
    width: 90%;
}

.messaging .card {
    height: 85%;
}

.msg_history{
	height: height: calc(700px - 150px);
    overflow-x: hidden;
}

.mesgs{
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y">
			<!-- Content -->
			<div class="messaging">
				<div class="inbox_msg">
					<!-- row -->
					<div class="row">

						<div class="col-md-12">

							<div class="chat_wrap">
								<div class="header">
									<h3>채 팅 방 (${param.chat_id})</h3>
									<input type="hidden" id="chat_id" value="${param.chat_id}">
								</div>

								<!-- card -->
								<div class="card">
									<div class="card-header header-elements p-3 my-n1">
										
										<div class="card-action-element ms-auto py-0">

											<span id="action_menu_btn"><i
												class='bx bx-dots-vertical-rounded'></i></span>
											<div class="action_menu">
												<ul>
													<li id="chat_close">채팅방나가기</li>
													<li id="chat_toggle">취소</li>
												</ul>
											</div>
										</div>
									</div>
									<!--  card-body -->
									<div class="card-body" style="width: 100%; display: inline-grid;">

										<div class="mesgs">
											<div class="msg_history">
											
												<div id="chat"></div>
												<script id="temp" type="text/x-handlebars-template">
      											{{#each .}}
      											<div class="incoming_msg {{printLeftRight sender}}">

													<div class="incoming_msg_img">
														<img src="<%= request.getContextPath() %>/resources/img/user/{{mem_img}}" 
														style="width:50px;border-radius:50%" alt="sunil">
														{{sender}}
													</div>
													<div class="received_msg">
														<div class="received_withd_msg">
															<p>{{message}}<a href="{{id}}" style="display:{{printNone sender}}">X</a></p>
															<span class="time_date"> {{regdate}}</span>
														</div>
													</div>
												</div>

      											{{/each}}
      											</script>
												<script id="temp1" type="text/x-handlebars-template">
      	
												<div class="outgoing_msg {{printLeftRight sender}}">
													<div class="sent_msg">
														<p>{{message}}<a href="{{id}}" style="display:{{printNone sender}}">X</a></p>
														<span class="time_date">{{regdate}}</span>
													</div>
												</div>
     				 							</script>
												<script>
										  		var uid =$('#chat_id').val();
										         Handlebars.registerHelper("printLeftRight", function(sender) {
										            if (uid != sender) {
										               return "right";
										            } else {
										               return "left";
										            }
										         });
										         Handlebars.registerHelper("printNone", function(sender) {
										             if (uid == sender) return "none";             
										         });
										         Handlebars.registerHelper("printImg", function(sender) {
										             if (uid!= sender) return "none";             
										         });
										      </script>
												<!-- <div class="input-div">
													<textarea id="txtMessage"
														placeholder="메세지를 입력한 후 리턴키를 누르세요!"></textarea>
												</div> -->
												
												<div class="input-div">

													<div class="type_msg">
														<div class="input_msg_write">
															<input id="txtMessage" type="text" class="write_msg"
																placeholder="Type a message" />
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>
									<!--  //card-body -->
									
								</div>
								<!-- // card -->
							</div>
						</div>
					</div>
					<!-- //row -->
				</div>
			</div>
			<!-- //content -->
		</div>
	</div>

</body>
<script type="text/javascript">
	//var urlParams = new URL(location.href).searchParams;
	//alert($('#chat_id').val());
	getList();
	timer = setInterval( function () {getList();},2000);
	var uid = $('#chat_id').val();
	var photo = "${photo}";
	//삭제
	$("#chat").on("click", "p a", function(e) {
		e.preventDefault();
		var id = $(this).attr("href");
		if (!confirm(id + "을(를) 삭제하실래요?"))
			return;
		$.ajax({
			type : "post",
			url : $(location).attr('origin')+"/CoffeeProject/admin/chat/delete",
			data : {
				"id" : id
			},
			success : function() {
				sock.send("delete");
				getList();
			}
		});
	});
	
	$('#action_menu_btn').click(function(){
		$('.action_menu').toggle();
	});
	
	$('#chat_toggle').click(function(){
		$('.action_menu').toggle();
	});

	$("#txtMessage").on("keydown", function(e) {
		if (e.keyCode == 13 && !e.shiftKey) {
			e.preventDefault();
			var message = $("#txtMessage").val();
			if (message == "") {
				alert("내용을 입력하세요!");
				return;
			}
			$("#txtMessage").val("");

			//메세지 테이블에 등록
			$.ajax({
				type : "post",
				url : $(location).attr('origin')+"/CoffeeProject/admin/chat/insert",
				data : {
					"sender" : "admin",
					"chat_id" : uid,
					"message" : message
				},
				success : function(data) {
					//메세지 보내기...
					sock.send(uid + "|" + message + "|" + data + "|" + photo);
					//sock.send("insert");
					getList();
				}
			});
		}
	});

	//웹소켓 생성
	var sock = new SockJS($(location).attr('origin')+":8088/CoffeeProject/echo/");
	sock.onmessage = onMessage;

	//서버로부터 메세지 받기...
	function onMessage(msg) {
		var items = msg.data.split("|");
		var sender = items[0];

		if (sender == "delete") {
			getList();
			return;
		}

		var message = items[1];
		var id = items[2];
		var photo = items[3];
		var date = items[4];

		var data = {
			"message" : message,
			"sender" : sender,
			"regdate" : date,
			"id" : id,
			"photo" : photo
		};

		var template = Handlebars.compile($("#temp1").html());
		$("#chat").append(template(data));

		//스크롤바 아래 고정
		window.scrollTo(0, $('#chat').prop('scrollHeight'));
	}

	function getList() {
		$.ajax({
			type : "get",
			url : $(location).attr('origin')+"/CoffeeProject/admin/chat.json",
			data : {"sender": uid},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$('#chat').children().remove();
				$("#chat").html(template(data));
				
				//스크롤이동
				$(".msg_history").scrollTop($('.msg_history').height());


			}
		});
	}




</script>
</html>



