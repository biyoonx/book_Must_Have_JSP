<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-18
  Time: 오전 12:10
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String popupMode = "on";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            String cookieName = c.getName();
            String cookieValue = c.getValue();

            if (cookieName.equals("PopupClose")) {
                popupMode = cookieValue;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠키를 이용한 팝업 관리</title>
    <style>
        div#popup {
            position: absolute;
            top: 100px;
            left: 100px;
            color: yellow;
            width: 300px;
            height: 100px;
            background-color: grey;
        }
        div#popup > div {
            position: relative;
            top: 0;
            color: black;
            background-color: #fff;
            border: 1px solid grey;
            padding: 10px;
        }
    </style>

<%--    <script src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
<%--    <script src="http://code.jquery.com/jquery-latest.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
        $(function() {
            $('#closeBtn').click(function() {
                $('#popup').hide();
                const chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
                if (+chkVal === 1) {
                    $.ajax({
                        url: './PopupCookie.jsp',
                        type: 'get',
                        data: { inactiveToday: chkVal },
                        dataType: 'text',
                        success: function(resData) {
                            if (resData) {
                                location.reload();
                            }
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <h2>팝업 메인 페이지</h2>
    <%
        for (int i = 1; i <= 10; i++) {
            out.println(String.format("현재 팝업창은 %s 상태입니다.<br />", popupMode));
        }
        if (popupMode.equals("on")) {
    %>
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
            <form name="popFrm">
                <input type="checkbox" id="inactiveToday" value="1" />
                하루 동안 열지 않음
                <input type="button" value="닫기" id="closeBtn" />
            </form>
        </div>
    </div>
    <%
        }
    %>
</body>
</html>