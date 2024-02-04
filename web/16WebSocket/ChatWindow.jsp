<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-04
  Time: 오후 11:46
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>웹소켓 채팅</title>
    <link rel="stylesheet" href="ChatWindow.css" />
    <script>
        const webSocket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
        let chatWindow;
        let chatMessage;
        let chatId;

        // 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
        window.onload = () => {
            chatWindow = document.querySelector('#chatWindow');
            chatMessage = document.querySelector('#chatMessage');
            chatId = document.querySelector('#chatId').value;
        }

        // 메시지 전송
        function sendMessage() {
            // 대화창에 표시
            chatWindow.innerHTML += `<div class='myMsg'>${ '${chatMessage.value}' }</div>`;
            webSocket.send(`${ '${chatId}|${chatMessage.value}' }`); // 서버로 전송
            chatMessage.value = ''; // 메시지 입력창 내용 비우긱
            chatWindow.scrollTop = chatWindow.scrollHeight; // 대화창 스크롤
        }

        // 서버와의 연결 종료
        function disconnect() {
            webSocket.close();
        }

        // 엔터 키 입력 처리
        function enterKey() {
            if (window.event.keyCode === 13) { // 13은 Enter 키의 코드값
                sendMessage();
            }
        }

        // 웹소켓 서버에 연결됐을 때 실행
        webSocket.onopen = (event) => {
            chatWindow.innerHTML += '<p>웹소켓 서버에 연결되었습니다.</p>';
        };

        // 웹소켓이 닫혔을 때(서버와의 연결이 끊어졌을 때) 실행
        webSocket.onclose = (event) => {
            chatWindow.innerHTML += '<p>웹소켓 서버가 종료되었습니다.</p>';
        };


        // 에러 발생 시 실행
        webSocket.onerror = (event) => {
            alert(event.data);
            chatWindow.innerHTML += '<p>채팅 중 에러가 발생하였습니다.</p>';
        };

        // 메시지를 받았을 때 실행
        webSocket.onmessage = (event) => {
            const message = event.data.split('|'); // 대화명과 메시지 분리
            const sender = message[0]; // 메시지 전송자 대화명
            const content = message[1]; // 메시지 내용

            if (content) {
                if (content.match('/')) { // 귓속말
                    if (content.match(`/${ '${chatId}' }`)) { // 나에게 보낸 메시지만 출력
                        const contentToMe = content.replace(`/${ '${chatId}' } `, '[귓속말] : ');
                        chatWindow.innerHTML += `<div>${ '${sender}${contentToMe}' }</div>`;
                    }
                } else { // 일반 대화
                    chatWindow.innerHTML += `<div>${ '${sender} : ${content}' }</div>`
                }
            }

            chatWindow.scrollTop = chatWindow.scrollHeight;
        }
    </script>
</head>
<body>
    <label for="chatId">대화명 : </label>
    <input type="text" id="chatId" value="${ param.chatId }" readonly />
    <button id="closeBtn" onclick="disconnect();">채팅 종료</button>
    <div id="chatWindow"></div>
    <div>
        <input type="text" id="chatMessage" onkeyup="enterKey();" />
        <button id="sendBtn" onclick="sendMessage();">전송</button>
    </div>
</body>
</html>