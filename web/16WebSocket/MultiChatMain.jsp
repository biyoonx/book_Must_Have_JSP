<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-04
  Time: 오후 11:31
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>웹소켓 채팅</title>
    <script>
        function chatWinOpen() {
            const id = document.querySelector('#chatId');

            if (!id.value) {
                alert('대화명을 입력한 후 채팅창을 열어주세요.');
                id.focus();
                return false;
            }

            window.open(`ChatWindow.jsp?chatId=${id.value}`, '', 'width=320, height=400');
            id.value = '';
        }
    </script>
</head>
<body>
    <h2>웹소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</h2>
    <label for="chatId">대화명 : </label><input type="text" id="chatId" name="chatId" />
    <button onclick="chatWinOpen();">채팅 참여</button>
</body>
</html>