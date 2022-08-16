<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<style>
div.header {
   position: sticky;
   top: 0;
   background-color: blue;
}
a {
	font-weight:bold;
	text-decoration:none;
	color: red;
}
</style>
<title>채팅</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/chat.css" />
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
   <div class="chat_wrap">
      <div class="header">
         <h3>채 팅 방 (admin)</h3>
      </div>
      <div id="chat"></div>
      <script id="temp" type="text/x-handlebars-template">
      {{#each .}}
      <div class="{{printLeftRight sender}}">
      	<div class="sender" style="display:{{printImg sender}}">
			<img src="/display?file={{photo}}" style="width:50px;border-radius:50%"/>
			{{sender}}
		</div>
      	<div class="message">
			{{message}} 
			<a href="{{id}}" style="display:{{printNone sender}}">X</a>
		</div>
      	<div class="date">{{regdate}}</div>
      </div>
      {{/each}}
      </script>
      <script id="temp1" type="text/x-handlebars-template">
      	<div class="{{printLeftRight sender}}">
      	<div class="sender" style="display:{{printImg sender}}">
			<img src="/display?file={{photo}}" style="width:50px;border-radius:50%"/>
			{{sender}}
		</div>
      	<div class="message">
			{{message}}
			<a href="{{id}}" style="display:{{printNone sender}}">X</a>
		</div>
      	<div class="date">{{regdate}}</div>
      	</div>
      </script>
      <script>
       var urlParams = new URL(location.href).searchParams;
  		var uid = urlParams.get('chat_id');
         Handlebars.registerHelper("printLeftRight", function(sender) {
            if (uid != sender) {
               return "left";
            } else {
               return "right";
            }
         });
         Handlebars.registerHelper("printNone", function(sender) {
             if (uid != sender) return "none";             
         });
         Handlebars.registerHelper("printImg", function(sender) {
             if (uid== sender) return "none";             
         });
      </script>
      <div class="input-div">
         <textarea id="txtMessage" placeholder="메세지를 입력한 후 리턴키를 누르세요!"></textarea>
      </div>
   </div>
</body>
<script type="text/javascript">
	var urlParams = new URL(location.href).searchParams;
	
	getList();
	var uid = urlParams.get('chat_id');
	//alert(urlParams.get('chat_id'));
	var photo = "${photo}";
	//삭제
	$("#chat").on("click", ".message a", function(e) {
		e.preventDefault();
		var id = $(this).attr("href");
		if (!confirm(id + "을(를) 삭제하실래요?"))
			return;
		$.ajax({
			type : "post",
			url : "./chat/delete",
			data : {
				"id" : id
			},
			success : function() {
				sock.send("delete");
				getList();
			}
		});
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
				url : "./chat/insert",
				data : {
					"sender" : uid,
					"chat_id" : "admin",
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
	var sock = new SockJS("http://localhost:8088/echo/");
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

	function getList() {;
	//alert(uid);
		$.ajax({
			type : "get",
			url : "./chat.json",
			data : {"sender": uid},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#chat").html(template(data));
			}
		});
	}
</script>
</html>



