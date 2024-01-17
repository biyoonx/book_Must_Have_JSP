<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-17
  Time: 오후 9:26
--%>

<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Optional" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    boolean popupMode = true;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        Optional<Cookie> popupModeCookie = Arrays.stream(cookies).filter(c -> c.getName().equals("isPopupMode")).findAny();
        if (popupModeCookie.isPresent()) {
            popupMode = Boolean.parseBoolean(popupModeCookie.get().getValue());
        }
        ;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠키를 이용한 팝업 관리 ver 0.1(my version)</title>
    <link href="PopupMain_0.1_mine.css" rel="stylesheet">
    <script defer src="PopupMain_0.1_mine.js"></script>
</head>
<body>
    <h2>팝업 메인 페이지 ver 0.1(my version)</h2>
    <%
        String mode = popupMode ? "on" : "off";
        for (int i = 0; i < 10; i++) {
            out.println(String.format("현재 팝업창은 %s 상태 입니다.<br>", mode));
        }

        if (popupMode) {
    %>
    <div id="popup" class="popup">
        <h2>공지사항 팝업입니다.</h2>
        <form>
            <input type="checkbox" id="inactivePopup" value="false" />
            <label for="inactivePopup">하루 동안 열지 않음</label>
            <button type="button" id="closePopup">닫기</button>
        </form>
    </div>
    <%
        }
    %>
</body>
</html>