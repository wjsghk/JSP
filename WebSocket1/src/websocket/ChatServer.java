package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
	private static Set<Session> clients
		=Collections.synchronizedSet(new HashSet<Session>());//컬랙션(클래스) 사용이유 동시다발적으로 접근 막기위해?
	
	@OnOpen//클라이언트 접속시 실행
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("웹 소켓 연결 : " + session.getId());
	}
	
	
	
	@OnMessage//메시지를 받으면 실행
	public void onMessage(String message,Session session) throws IOException{
		System.out.println("메시지 전송 : " + session.getId() + ":" + message);
		synchronized(clients) {//동기화처리 하는 이유 보낸 순서대로 만들기위해 동기화처리 하지않으면 순서가 바뀌기 때문에
			for(Session client : clients) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
		
	
	@OnClose//클라이언트와의 연결이 끊기면 실행
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹 소켓 종료 : " + session.getId());
	}
	
	
	@OnError//에러 발생시 실행
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
		
}
	
	
	
}