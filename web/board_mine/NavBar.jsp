<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-23
  Time: 오후 10:32
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<link rel="stylesheet" href="NavBar.css" />
<div class="nav_bar">
    <ul>
        <%
            if (session.getAttribute("UserId") == null) {
        %>
        <li onclick="location.href='LoginForm.jsp'">로그인</li>
        <%
            } else {
        %>
        <li onclick="location.href='LoginForm.jsp'">마이페이지</li>
        <li onclick="location.href='LogoutProcess.jsp'">로그아웃</li>
        <%
            }
        %>
        <li onclick="location.href='ListAll.jsp'">게시판(페이징X)</li>
        <li onclick="location.href='ListPaging.jsp'">게시판(페이징O)</li>
    </ul>
</div>