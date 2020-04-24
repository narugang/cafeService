package ant.tproject.cafeService.chat.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import ant.tproject.cafeService.chat.service.ChatService;

public class EchoHandler extends TextWebSocketHandler {
	private ChatService chatService;
	
	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}
	private Map <Integer, Map<Integer, WebSocketSession>> sessionRoomMemList = new HashMap<>();
	private Map <Integer, WebSocketSession> sessionMemList = new HashMap<>();
     
      // 클라이언트와 연결 이후에 실행되는 메서드
      @Override
      public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	Map<String, Object> map = session.getAttributes();
        Integer roomcode = (Integer)map.get("roomcode");
        Integer memcode = (Integer)map.get("memcode");
        if(!sessionRoomMemList.containsKey(roomcode)) {
        	sessionMemList.clear();
        	sessionMemList.put(memcode, session);
        	sessionRoomMemList.put(roomcode, sessionMemList);
        }
        else {
        	sessionRoomMemList.get(roomcode).put(memcode, session);
        }
      }
      	
     
      // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
      @Override
      protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        Map<String, Object> map = session.getAttributes();
        
        Integer roomcode = (Integer)map.get("roomcode");
        Integer memcode = (Integer)map.get("memcode");
        Map <Integer, WebSocketSession> getMemList = sessionRoomMemList.get(roomcode);
        String sendMessage = message.getPayload();
        chatService.insertLog(roomcode, memcode, sendMessage);
        for(Integer i: getMemList.keySet()) {
       	getMemList.get(i).sendMessage(new TextMessage(memcode+":"+sendMessage));
        	chatService.insertClogRec(i);
        }
      }
     
      // 클라이언트와 연결을 끊었을 때 실행되는 메소드
      @Override
      public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { 
    	  Map<String, Object> map = session.getAttributes();
    	  
    	  Integer roomcode = (Integer)map.get("roomcode");
    	  Integer memcode = (Integer)map.get("memcode");
          sessionRoomMemList.get(roomcode).remove(memcode);
      }
}

