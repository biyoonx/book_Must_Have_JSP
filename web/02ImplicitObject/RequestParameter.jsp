<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-16
  Time: 오후 11:16
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내장 객체 - request</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String sex = request.getParameter("sex");
        String[] favo = request.getParameterValues("favo");
        String favoStr = favo != null ? String.join(" ", favo) : "";
        String intro = request.getParameter("intro").replace("\r\n", "<br />");
    %>

    <ul>
        <li>아이디 : <%= id %></li>
        <li>성별 : <%= sex %></li>
        <li>관심사항 : <%= favoStr %></li>
        <li>자기소개 : <%= intro %></li>
    </ul>
</body>
</html>