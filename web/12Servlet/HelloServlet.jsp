<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 10:29
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HelloServlet.jsp</title>
    <link rel="stylesheet" href="<%= "../Common/common.css" %>" />
</head>
<body>
    <h2>web.xml에서 매핑 후 JSP에서 출력하기</h2>
    <p><strong><%= request.getAttribute("message") %></strong></p>
    <p><a href="./HelloServlet.do">바로가기</a></p>
</body>
</html>