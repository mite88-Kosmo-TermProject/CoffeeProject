package com.coffice.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;





@Controller
@ServerEndpoint("/EchoServer.do")
public class WebSocketHandler {

	@RequestMapping("/WebChat.do")
	public String webSocket() {
		return "webChating";
	}

	private static final List<Session> sessionList = new ArrayList<Session>();
	
	public  WebSocketHandler() {
		System.out.println("웹소켓(서버) 객체생성");
	}
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("새로운 Session id="+session.getId());
		try {
			final javax.websocket.RemoteEndpoint.Basic basic =  session.getBasicRemote();
			System.out.println("새로운 session getBasicRemote"+ basic);
			basic.sendText("대화방에 연결 되었습니다.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}
	private void sendAllSessionToMessage(Session self, String message) {
		try {
			//List컬렉션에 저장된 클라이언트의 수만큼 반복한다.
			for(Session session : WebSocketHandler.sessionList) {
				//메세지를 보낸 자신을 제외한 나머지에게 메세지를 전송한다.
				if(!self.getId().equals(session.getId())) {
					//메세지는 sendText()메서드를 통해 전송한다.
					session.getBasicRemote().sendText(message);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	//클라이언트가 서버측으로 메세지를 보냈을때 호출된다.
	@OnMessage
	public void onMessage(String message, Session session) {
		try {
			final Basic basic = session.getBasicRemote();
			System.out.println("메세지 도착:"+basic+"="+message);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		//클라이너트 전체에게 메세지를 전송한다.
		sendAllSessionToMessage(session, message);
	}
	
	//채팅중 에러가 발생했을때 호출된다.
	@OnError
	public void onError(Throwable e, Session session) {
		System.out.println(e.getMessage());
	}
	//클라이언트가 접속을 종료했을때 호출된다.
	@OnClose
	public void onClose(Session session) {
		//접속을 종료하면 List컬렉션에서 삭제한다.
		sessionList.remove(session);
		System.out.println("접속종료:"+session.getId());
	}
}


