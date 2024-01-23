<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-23
  Time: 오후 10:24
--%>

<%@ page import="board_mine.CookieManagerUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String userId = CookieManagerUtil.readCookie(request, "UserId");
    boolean isRemembered = Boolean.parseBoolean(CookieManagerUtil.readCookie(request, "isRemembered"));
    String userName = (String)session.getAttribute("UserName");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="LoginForm.css" />
    <script defer src="validateForm.js"></script>
</head>
<body>
    <jsp:include page="NavBar.jsp" />

    <%
        if (session.getAttribute("UserId") == null) {
    %>
        <h2>로그인 페이지</h2>
        <form name="LoginForm" action="LoginProcess.jsp" method="post">
            <div>
                <label for="user_id">아이디</label>
                <input type="text" name="user_id" id="user_id" required value="<%= isRemembered ? userId : "" %>" />
                <input type="checkbox" name="remember_id" id="remember_id" value="true" <%= isRemembered ? "checked" : "" %> />
                <label for="remember_id">아이디 기억하기</label>
            </div>
            <div>
                <label for="user_pw">비밀번호</label>
                <input type="password" name="user_pw" id="user_pw" required />
            </div>
            <div>
                <input type="submit" name="login" id="submitBtn" value="로그인" />
            </div>
        </form>
    <%
        } else {
    %>
        <h2>마이페이지</h2>
        <p><%= userName != null ? userName + " " : "" %>회원님, 환영합니다.</p>
        <form name="LogoutForm" action="LogoutProcess.jsp" method="post">
            <input type="submit" name="logout" value="로그아웃" />
        </form>
    <%
        }
    %>
</body>
</html>