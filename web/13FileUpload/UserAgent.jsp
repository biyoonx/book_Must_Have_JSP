<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-27
  Time: 오후 10:58
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User-Agent 확인하기</title>
</head>
<body>
    <%
        String client = request.getHeader("User-Agent");
        out.println(client);
    %>
</body>
</html>