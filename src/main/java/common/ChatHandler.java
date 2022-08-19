package common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatHandler extends TextWebSocketHandler{
	List<WebSocketSession> sessionList=new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결됨 :" + session.getId() );
		sessionList.add(session);
		System.out.println("연결된갯수:" + sessionList.size());
		super.afterConnectionEstablished(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결끊김 :" + session.getId());
		sessionList.remove(session);
		super.afterConnectionClosed(session, status);
	}
	
	// 클라이언트(브라우저)에서 서버로 메시지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메시지가 들어오는 부분
		String strMessage=message.getPayload();
		System.out.println("보냄 :" + session.getId() );
		System.out.println("메시지:" + strMessage);
		
		// 연결된세션들에게 메시지를 보낼때
		// 현재 시간도 보내보자.
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = sdf.format(new Date());
		strMessage += "|" + strDate;
		
		for(WebSocketSession webSocketSession:sessionList){
			webSocketSession.sendMessage(new TextMessage(strMessage));
		}
		super.handleTextMessage(session, message);
	}
}
