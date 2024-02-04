package websocket;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

    // 클라이언트 접속 시 실행
    @OnOpen
    public void onOpen(Session session) {
        // 세션 추가
        clients.add(session);

        System.out.println("웹소켓 연결 : " + session.getId());
    }

    // 메시지를 받으면 실행
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.printf("메시지 전송 : %s > %s\n", session.getId(), message);

        synchronized (clients) {
            // 모든 클라이언트에 메시지 전달
            for (Session client : clients) {
                // 단, 메시지를 보낸 클라이언트는 제외하고 전달
                if (!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }

    // 클라이언트와의 연결이 끊기면 실행
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);

        System.out.println("웹 소켓 종료 : " + session.getId());
    }

    // 에러 발생 시 실행
    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");

        e.printStackTrace();
    }
}